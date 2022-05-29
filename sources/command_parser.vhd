library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity command_parser is
port(
  -- input
  UPL_input_data : in std_logic_vector(128-1 downto 0);
  UPL_input_en : in std_logic;
  UPL_input_req : in std_logic;
  UPL_input_ack : out std_logic;

  -- forward_input
  UPL_forward_input_data : in std_logic_vector(128-1 downto 0);
  UPL_forward_input_en : in std_logic;
  UPL_forward_input_req : in std_logic;
  UPL_forward_input_ack : out std_logic;

  -- output
  UPL_output_data : out std_logic_vector(128-1 downto 0);
  UPL_output_en : out std_logic;
  UPL_output_req : out std_logic;
  UPL_output_ack : in std_logic;

  -- forward_output
  UPL_forward_output_data : out std_logic_vector(128-1 downto 0);
  UPL_forward_output_en : out std_logic;
  UPL_forward_output_req : out std_logic;
  UPL_forward_output_ack : in std_logic;

  -- user-defiend ports
  synch_sender_kick : out std_logic;
  synch_sender_busy : in std_logic;
  synch_target_addr : out std_logic_vector(32-1 downto 0);
  synch_target_port : out std_logic_vector(16-1 downto 0);
  global_clock : in std_logic_vector(64-1 downto 0);
  global_clock_clear : out std_logic;

  -- system clock and reset
  clk : in std_logic;
  reset : in std_logic
);
end entity command_parser;

architecture RTL of command_parser is

  -- statemachine type and signal
  type StateType is (
      IDLE,
      command_parser,
      kick_timesynch,
      forward_packet,
      recv_forward,
      send_forward_reply,
      clear_clock,
      send_reply,
      output_send_0,
      output_send_1,
      output_send_2,
      output_send_3,
      output_send_4,
      forward_output_send_0,
      forward_output_send_1,
      forward_output_send_2,
      forward_output_send_3,
      input_recv_0,
      input_recv_1,
      input_recv_2,
      input_recv_3,
      forward_input_recv_0,
      forward_input_recv_1,
      forward_input_recv_2
  );
  signal gupl_state : StateType := IDLE;
  signal gupl_state_next : StateType := IDLE;

  -- UPL signals
  signal myIpAddr : std_logic_vector(32-1 downto 0);
  signal dstIpAddr : std_logic_vector(32-1 downto 0);
  signal myPort : std_logic_vector(16-1 downto 0);
  signal dstPort : std_logic_vector(16-1 downto 0);
  signal payloadBytes : std_logic_vector(32-1 downto 0);
  signal command : std_logic_vector(64-1 downto 0);
  signal data0 : std_logic_vector(32-1 downto 0);
  signal data1 : std_logic_vector(32-1 downto 0);
  signal data_waddr : std_logic_vector(32-1 downto 0);
  signal data_we : std_logic_vector(1-1 downto 0);
  signal data_din : std_logic_vector(128-1 downto 0);
  signal data_raddr : std_logic_vector(32-1 downto 0);
  signal data_dout : std_logic_vector(128-1 downto 0);
  signal data_send_words : std_logic_vector(32-1 downto 0);
  signal data_recv_words : std_logic_vector(32-1 downto 0);
  signal fwdMyIpAddr : std_logic_vector(32-1 downto 0);
  signal fwdDstIpAddr : std_logic_vector(32-1 downto 0);
  signal fwdMyPort : std_logic_vector(16-1 downto 0);
  signal fwdDstPort : std_logic_vector(16-1 downto 0);
  signal fwdPayloadBytes : std_logic_vector(32-1 downto 0);

  -- user-defiend signals
  signal state_counter : unsigned(8-1 downto 0);
  signal data_r : std_logic_vector(128-1 downto 0);
  signal synch_sender_kick_w : std_logic;

  -- ip-cores
  component simple_dualportram
    generic (
      DEPTH : integer := 10;
      WIDTH : integer := 32;
      WORDS : integer := 1024
    );
    port (
      clk    : in  std_logic;
      reset  : in  std_logic;
      we     : in  std_logic_vector(0 downto 0);
      raddr  : in  std_logic_vector(31 downto 0);
      waddr  : in  std_logic_vector(31 downto 0);
      dout   : out std_logic_vector(WIDTH-1 downto 0);
      din    : in  std_logic_vector(WIDTH-1 downto 0);
      length : out std_logic_vector(31 downto 0)
    );
  end component simple_dualportram;

begin

  -- add async
  synch_sender_kick <= synch_sender_kick_w;

process(clk)
begin
  if rising_edge(clk) then
    if reset = '1' then
      UPL_output_en <= '0';
      UPL_output_req <= '0';
      UPL_output_data <= (others => '0');
      UPL_forward_output_en <= '0';
      UPL_forward_output_req <= '0';
      UPL_forward_output_data <= (others => '0');
      UPL_input_ack <= '0';
      UPL_forward_input_ack <= '0';
      gupl_state <= IDLE;
      gupl_state_next <= IDLE;

      -- user-defiend reset stage
  synch_sender_kick_w <= '0';
  global_clock_clear <= '0';

    else
      case gupl_state is
        when IDLE =>
  state_counter <= (others => '0');
  synch_sender_kick_w <= '0';
  global_clock_clear <= '0';
          gupl_state <= input_recv_0;
          gupl_state_next <= command_parser;
          UPL_output_en <= '0';
          UPL_output_req <= '0';
          UPL_output_data <= (others => '0');
          UPL_forward_output_en <= '0';
          UPL_forward_output_req <= '0';
          UPL_forward_output_data <= (others => '0');
          UPL_input_ack <= '0';
          UPL_forward_input_ack <= '0';
          data_we <= (others => '0');
          data_waddr <= (others => '1');
          data_raddr <= (others => '0');
          data_recv_words <= (others => '0');
          data_send_words <= (others => '0');
        when command_parser =>

  -- kick time-synch
  if command(63 downto 56) = X"32" then
          gupl_state <= kick_timesynch;
  elsif command(63 downto 56) = X"34" then
          gupl_state <= clear_clock;
  elsif command(63 downto 56) = X"36" then
          gupl_state <= forward_packet;
  else
          gupl_state <= send_reply;
  end if;

        when kick_timesynch =>

  case(to_integer(state_counter)) is
  when 0 =>
    synch_sender_kick_w <= '1';
    synch_target_addr <= data0;
    synch_target_port <= data1(15 downto 0);
    state_counter <= state_counter + 1;
    payloadBytes <= std_logic_vector(unsigned(payloadBytes) - 8 - 8);
  when 1 =>
    synch_sender_kick_w <= '0';
    if synch_sender_kick_w = '0' and synch_sender_busy = '0' then
      if unsigned(payloadBytes) = 0 then
          gupl_state <= send_reply;
      else
        payloadBytes <= std_logic_vector(unsigned(payloadBytes) - 8);
        synch_sender_kick_w <= '1';
        synch_target_addr <= data_dout(127 downto 96);
        synch_target_port <= data_dout(79 downto 64);
        data_r <= data_dout;
        data_raddr <= std_logic_vector(unsigned(data_raddr) + 1);
        state_counter <= state_counter + 1;
      end if; 
    end if;
  when 2 =>
    synch_sender_kick_w <= '0';
    if synch_sender_kick_w = '0' and synch_sender_busy = '0' then
      if unsigned(payloadBytes) = 0 then
          gupl_state <= send_reply;
      else
        payloadBytes <= std_logic_vector(unsigned(payloadBytes) - 8);
        synch_sender_kick_w <= '1';
        synch_target_addr <= data_r(63 downto 32);
        synch_target_port <= data_r(15 downto 0);
        state_counter <= to_unsigned(1, state_counter'length);
      end if;
    end if;
  when others =>
    synch_sender_kick_w <= '0';
          gupl_state <= send_reply;
  end case;

        when forward_packet =>
  fwdMyIpAddr  <= myIpAddr;
  fwdDstIpAddr <= data0;
  fwdMyPort    <= myPort;
  fwdDstPort   <= data1(15 downto 0);
  fwdPayloadBytes <= std_logic_vector(unsigned(payloadBytes) - 16);
          gupl_state <= forward_output_send_0;
          gupl_state_next <= IDLE;
        when recv_forward =>
          gupl_state <= forward_input_recv_0;
          gupl_state_next <= send_forward_reply;
        when send_forward_reply =>
  command(63 downto 56) <= X"37";
  command(55 downto 0) <= (others => '0');
  payloadBytes <= std_logic_vector(unsigned(fwdPayloadBytes)+16);
  data0 <= fwdDstIpAddr;
  data1 <= X"0000" & fwdDstPort;
          gupl_state <= forward_output_send_0;
          gupl_state_next <= IDLE;
        when clear_clock =>
  global_clock_clear <= '1';
          gupl_state <= send_reply;
        when send_reply =>
  global_clock_clear <= '0';
  payloadBytes <= X"00000010"; -- 16
  command(63 downto 56) <= X"33";
  command(55 downto 0) <= (others => '0');
  data0(31 downto 24) <= global_clock( 7 downto  0);
  data0(23 downto 16) <= global_clock(15 downto  8);
  data0(15 downto  8) <= global_clock(23 downto 16);
  data0( 7 downto  0) <= global_clock(31 downto 24);
  data1(31 downto 24) <= global_clock(39 downto 32);
  data1(23 downto 16) <= global_clock(47 downto 40);
  data1(15 downto  8) <= global_clock(55 downto 48);
  data1( 7 downto  0) <= global_clock(63 downto 56);
          gupl_state <= output_send_0;
          gupl_state_next <= IDLE;
        when output_send_0 =>
          UPL_output_req <= '1';
          data_send_words <= (others => '0');
          if UPL_output_ack = '1' then
            data_raddr <= (others => '0'); -- for next next
            gupl_state <= output_send_1;
          end if;
        when output_send_1 =>
          gupl_state <= output_send_2;
        when output_send_2 =>
          UPL_output_req <= '0';
          UPL_output_data(127 downto 96) <= myIpAddr;
          UPL_output_data(95 downto 64) <= dstIpAddr;
          UPL_output_data(63 downto 48) <= myPort;
          UPL_output_data(47 downto 32) <= dstPort;
          UPL_output_data(31 downto 0) <= payloadBytes;
          UPL_output_en <= '1';
          gupl_state <= output_send_3;
        when output_send_3 =>
          UPL_output_req <= '0';
          UPL_output_data(127 downto 64) <= command;
          UPL_output_data(63 downto 32) <= data0;
          UPL_output_data(31 downto 0) <= data1;
          data_raddr <= std_logic_vector(unsigned(data_raddr)+1); -- for next next
          UPL_output_en <= '1';
          gupl_state <= output_send_4;
        when output_send_4 =>
          UPL_output_req <= '0';
          if data_recv_words = data_send_words then
            gupl_state <= gupl_state_next;
            UPL_output_en <= '0';
          else
            data_raddr <= std_logic_vector(unsigned(data_raddr)+1); -- for next next
            UPL_output_data <= data_dout;
            data_send_words <= std_logic_vector(unsigned(data_send_words)+1);
            UPL_output_en <= '1';
          end if;
        when forward_output_send_0 =>
          UPL_forward_output_req <= '1';
          data_send_words <= (others => '0');
          if UPL_forward_output_ack = '1' then
            data_raddr <= (others => '0'); -- for next next
            gupl_state <= forward_output_send_1;
          end if;
        when forward_output_send_1 =>
          gupl_state <= forward_output_send_2;
        when forward_output_send_2 =>
          UPL_forward_output_req <= '0';
          UPL_forward_output_data(127 downto 96) <= fwdMyIpAddr;
          UPL_forward_output_data(95 downto 64) <= fwdDstIpAddr;
          UPL_forward_output_data(63 downto 48) <= fwdMyPort;
          UPL_forward_output_data(47 downto 32) <= fwdDstPort;
          UPL_forward_output_data(31 downto 0) <= fwdPayloadBytes;
          data_raddr <= std_logic_vector(unsigned(data_raddr)+1); -- for next next
          UPL_forward_output_en <= '1';
          gupl_state <= forward_output_send_3;
        when forward_output_send_3 =>
          UPL_forward_output_req <= '0';
          if data_recv_words = data_send_words then
            gupl_state <= gupl_state_next;
            UPL_forward_output_en <= '0';
          else
            data_raddr <= std_logic_vector(unsigned(data_raddr)+1); -- for next next
            UPL_forward_output_data <= data_dout;
            data_send_words <= std_logic_vector(unsigned(data_send_words)+1);
            UPL_forward_output_en <= '1';
          end if;
        when input_recv_0 =>
          if UPL_input_en = '1' then
            UPL_input_ack <= '0';
          else
            UPL_input_ack <= '1';
          end if;
          myIpAddr <= UPL_input_data(127 downto 96);
          dstIpAddr <= UPL_input_data(95 downto 64);
          myPort <= UPL_input_data(63 downto 48);
          dstPort <= UPL_input_data(47 downto 32);
          payloadBytes <= UPL_input_data(31 downto 0);
          if UPL_input_en = '1' then
            gupl_state <= input_recv_1;
          end if;
        when input_recv_1 =>
          UPL_input_ack <= '0';
          command <= UPL_input_data(127 downto 64);
          data0 <= UPL_input_data(63 downto 32);
          data1 <= UPL_input_data(31 downto 0);
          gupl_state <= input_recv_2;
        when input_recv_2 =>
          UPL_input_ack <= '0';
          if UPL_input_en = '1' then
            data_waddr <= std_logic_vector(unsigned(data_waddr)+1);
            data_we <= "1";
            data_din <= UPL_input_data;
            data_recv_words <= std_logic_vector(unsigned(data_recv_words)+1);
          else
            data_we <= "0";
          end if;
          gupl_state <= input_recv_3;
        when input_recv_3 =>
          if UPL_input_en = '0' then
            gupl_state <= gupl_state_next;
            data_we <= "0";
          else
            data_waddr <= std_logic_vector(unsigned(data_waddr)+1);
            data_we <= "1";
            data_din <= UPL_input_data;
            data_recv_words <= std_logic_vector(unsigned(data_recv_words)+1);
          end if;
        when forward_input_recv_0 =>
          if UPL_forward_input_en = '1' then
            UPL_forward_input_ack <= '0';
          else
            UPL_forward_input_ack <= '1';
          end if;
          fwdMyIpAddr <= UPL_forward_input_data(127 downto 96);
          fwdDstIpAddr <= UPL_forward_input_data(95 downto 64);
          fwdMyPort <= UPL_forward_input_data(63 downto 48);
          fwdDstPort <= UPL_forward_input_data(47 downto 32);
          fwdPayloadBytes <= UPL_forward_input_data(31 downto 0);
          if UPL_forward_input_en = '1' then
            gupl_state <= forward_input_recv_1;
          end if;
        when forward_input_recv_1 =>
          UPL_forward_input_ack <= '0';
          if UPL_forward_input_en = '1' then
            data_waddr <= std_logic_vector(unsigned(data_waddr)+1);
            data_we <= "1";
            data_din <= UPL_forward_input_data;
            data_recv_words <= std_logic_vector(unsigned(data_recv_words)+1);
          else
            data_we <= "0";
          end if;
          gupl_state <= forward_input_recv_2;
        when forward_input_recv_2 =>
          if UPL_forward_input_en = '0' then
            gupl_state <= gupl_state_next;
            data_we <= "0";
          else
            data_waddr <= std_logic_vector(unsigned(data_waddr)+1);
            data_we <= "1";
            data_din <= UPL_forward_input_data;
            data_recv_words <= std_logic_vector(unsigned(data_recv_words)+1);
          end if;
        when others => gupl_state <= IDLE;
      end case;
    end if;
  end if;
end process;


  buf_data_i : simple_dualportram
    generic map(
      DEPTH => 7,
      WIDTH => 128,
      WORDS => 96
    )
    port map(
      clk    => clk,
      reset  => reset,
      we     => data_we,
      raddr  => data_raddr,
      waddr  => data_waddr,
      dout   => data_dout,
      din    => data_din,
      length => open
    );
end RTL;
