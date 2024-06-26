library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity e7udpip10g_au200 is
  port(
    gt_rxp_in : in std_logic_vector(4-1 downto 0);
    gt_rxn_in : in std_logic_vector(4-1 downto 0);
    gt_txp_out : out std_logic_vector(4-1 downto 0);
    gt_txn_out : out std_logic_vector(4-1 downto 0);

    gt_refclk_p : in std_logic;
    gt_refclk_n : in std_logic;

    clk250mhz : in std_logic;
    clk100mhz : in std_logic;
    clk_locked : in std_logic;
    
    rx_block_lock_led_0 : out std_logic;  -- Indicates Core Block Lock
    rx_block_lock_led_1 : out std_logic;  -- Indicates Core Block Lock
    rx_block_lock_led_2 : out std_logic;  -- Indicates Core Block Lock
    rx_block_lock_led_3 : out std_logic;  -- Indicates Core Block Lock

    MyIpAddr_0       : in std_logic_vector(31 downto 0);
    MyMacAddr_0      : in std_logic_vector(47 downto 0);
    MyNetMask_0      : in std_logic_vector(31 downto 0);
    DefaultGateway_0 : in std_logic_vector(31 downto 0);
    TargetIPAddr_0   : in std_logic_vector(31 downto 0);
    MyUdpPort_0_0    : in std_logic_vector(15 downto 0);
    MyUdpPort_0_1    : in std_logic_vector(15 downto 0);

    pUdp0Send_Data_0       : in  std_logic_vector(127 downto 0);
    pUdp0Send_Request_0    : in  std_logic;
    pUdp0Send_Ack_0        : out std_logic;
    pUdp0Send_Enable_0     : in  std_logic;
    pUdp1Send_Data_0       : in  std_logic_vector(127 downto 0);
    pUdp1Send_Request_0    : in  std_logic;
    pUdp1Send_Ack_0        : out std_logic;
    pUdp1Send_Enable_0     : in  std_logic;
    pUdp0Receive_Data_0    : out std_logic_vector(127 downto 0);
    pUdp0Receive_Request_0 : out std_logic;
    pUdp0Receive_Ack_0     : in  std_logic;
    pUdp0Receive_Enable_0  : out std_logic;
    pUdp1Receive_Data_0    : out std_logic_vector(127 downto 0);
    pUdp1Receive_Request_0 : out std_logic;
    pUdp1Receive_Ack_0     : in  std_logic;
    pUdp1Receive_Enable_0  : out std_logic;

    MyIpAddr_1       : in std_logic_vector(31 downto 0);
    MyMacAddr_1      : in std_logic_vector(47 downto 0);
    MyNetMask_1      : in std_logic_vector(31 downto 0);
    DefaultGateway_1 : in std_logic_vector(31 downto 0);
    TargetIPAddr_1   : in std_logic_vector(31 downto 0);
    MyUdpPort_1_0    : in std_logic_vector(15 downto 0);
    MyUdpPort_1_1    : in std_logic_vector(15 downto 0);

    pUdp0Send_Data_1       : in  std_logic_vector(127 downto 0);
    pUdp0Send_Request_1    : in  std_logic;
    pUdp0Send_Ack_1        : out std_logic;
    pUdp0Send_Enable_1     : in  std_logic;
    pUdp1Send_Data_1       : in  std_logic_vector(127 downto 0);
    pUdp1Send_Request_1    : in  std_logic;
    pUdp1Send_Ack_1        : out std_logic;
    pUdp1Send_Enable_1     : in  std_logic;
    pUdp0Receive_Data_1    : out std_logic_vector(127 downto 0);
    pUdp0Receive_Request_1 : out std_logic;
    pUdp0Receive_Ack_1     : in  std_logic;
    pUdp0Receive_Enable_1  : out std_logic;
    pUdp1Receive_Data_1    : out std_logic_vector(127 downto 0);
    pUdp1Receive_Request_1 : out std_logic;
    pUdp1Receive_Ack_1     : in  std_logic;
    pUdp1Receive_Enable_1  : out std_logic;

    MyIpAddr_2       : in std_logic_vector(31 downto 0);
    MyMacAddr_2      : in std_logic_vector(47 downto 0);
    MyNetMask_2      : in std_logic_vector(31 downto 0);
    DefaultGateway_2 : in std_logic_vector(31 downto 0);
    TargetIPAddr_2   : in std_logic_vector(31 downto 0);
    MyUdpPort_2_0    : in std_logic_vector(15 downto 0);
    MyUdpPort_2_1    : in std_logic_vector(15 downto 0);

    pUdp0Send_Data_2       : in  std_logic_vector(127 downto 0);
    pUdp0Send_Request_2    : in  std_logic;
    pUdp0Send_Ack_2        : out std_logic;
    pUdp0Send_Enable_2     : in  std_logic;
    pUdp1Send_Data_2       : in  std_logic_vector(127 downto 0);
    pUdp1Send_Request_2    : in  std_logic;
    pUdp1Send_Ack_2        : out std_logic;
    pUdp1Send_Enable_2     : in  std_logic;
    pUdp0Receive_Data_2    : out std_logic_vector(127 downto 0);
    pUdp0Receive_Request_2 : out std_logic;
    pUdp0Receive_Ack_2     : in  std_logic;
    pUdp0Receive_Enable_2  : out std_logic;
    pUdp1Receive_Data_2    : out std_logic_vector(127 downto 0);
    pUdp1Receive_Request_2 : out std_logic;
    pUdp1Receive_Ack_2     : in  std_logic;
    pUdp1Receive_Enable_2  : out std_logic;

    MyIpAddr_3       : in std_logic_vector(31 downto 0);
    MyMacAddr_3      : in std_logic_vector(47 downto 0);
    MyNetMask_3      : in std_logic_vector(31 downto 0);
    DefaultGateway_3 : in std_logic_vector(31 downto 0);
    TargetIPAddr_3   : in std_logic_vector(31 downto 0);
    MyUdpPort_3_0    : in std_logic_vector(15 downto 0);
    MyUdpPort_3_1    : in std_logic_vector(15 downto 0);

    pUdp0Send_Data_3       : in  std_logic_vector(127 downto 0);
    pUdp0Send_Request_3    : in  std_logic;
    pUdp0Send_Ack_3        : out std_logic;
    pUdp0Send_Enable_3     : in  std_logic;
    pUdp1Send_Data_3       : in  std_logic_vector(127 downto 0);
    pUdp1Send_Request_3    : in  std_logic;
    pUdp1Send_Ack_3        : out std_logic;
    pUdp1Send_Enable_3     : in  std_logic;
    pUdp0Receive_Data_3    : out std_logic_vector(127 downto 0);
    pUdp0Receive_Request_3 : out std_logic;
    pUdp0Receive_Ack_3     : in  std_logic;
    pUdp0Receive_Enable_3  : out std_logic;
    pUdp1Receive_Data_3    : out std_logic_vector(127 downto 0);
    pUdp1Receive_Request_3 : out std_logic;
    pUdp1Receive_Ack_3     : in  std_logic;
    pUdp1Receive_Enable_3  : out std_logic
    );
end entity e7udpip10g_au200;

architecture RTL of e7udpip10g_au200 is

  attribute keep : string;
  
  component xxv_ethernet_0
    port (
      gt_rxp_in                           : in  std_logic_vector (3 downto 0);
      gt_rxn_in                           : in  std_logic_vector (3 downto 0);
      gt_txp_out                          : out std_logic_vector (3 downto 0);
      gt_txn_out                          : out std_logic_vector (3 downto 0);
      tx_mii_clk_0                        : out std_logic;
      rx_core_clk_0                       : in  std_logic;
      rx_clk_out_0                        : out std_logic;
      gt_loopback_in_0                    : in  std_logic_vector (2 downto 0);
      rx_reset_0                          : in  std_logic;
      user_rx_reset_0                     : out std_logic;
      rxrecclkout_0                       : out std_logic;
      rx_mii_d_0                          : out std_logic_vector (63 downto 0);
      rx_mii_c_0                          : out std_logic_vector (7 downto 0);
      ctl_rx_test_pattern_0               : in  std_logic;
      ctl_rx_test_pattern_enable_0        : in  std_logic;
      ctl_rx_data_pattern_select_0        : in  std_logic;
      ctl_rx_prbs31_test_pattern_enable_0 : in  std_logic;
      stat_rx_block_lock_0                : out std_logic;
      stat_rx_framing_err_valid_0         : out std_logic;
      stat_rx_framing_err_0               : out std_logic;
      stat_rx_hi_ber_0                    : out std_logic;
      stat_rx_valid_ctrl_code_0           : out std_logic;
      stat_rx_bad_code_0                  : out std_logic;
      stat_rx_bad_code_valid_0            : out std_logic;
      stat_rx_error_valid_0               : out std_logic;
      stat_rx_error_0                     : out std_logic_vector (7 downto 0);
      stat_rx_fifo_error_0                : out std_logic;
      stat_rx_local_fault_0               : out std_logic;
      stat_rx_status_0                    : out std_logic;
      tx_reset_0                          : in  std_logic;
      user_tx_reset_0                     : out std_logic;
      tx_mii_d_0                          : in  std_logic_vector (63 downto 0);
      tx_mii_c_0                          : in  std_logic_vector (7 downto 0);
      ctl_tx_test_pattern_0               : in  std_logic;
      ctl_tx_test_pattern_enable_0        : in  std_logic;
      ctl_tx_test_pattern_select_0        : in  std_logic;
      ctl_tx_data_pattern_select_0        : in  std_logic;
      ctl_tx_test_pattern_seed_a_0        : in  std_logic_vector (57 downto 0);
      ctl_tx_test_pattern_seed_b_0        : in  std_logic_vector (57 downto 0);
      ctl_tx_prbs31_test_pattern_enable_0 : in  std_logic;
      stat_tx_local_fault_0               : out std_logic;
      gtwiz_reset_tx_datapath_0           : in  std_logic;
      gtwiz_reset_rx_datapath_0           : in  std_logic;
      gtpowergood_out_0                   : out std_logic;
      txoutclksel_in_0                    : in  std_logic_vector (2 downto 0);
      rxoutclksel_in_0                    : in  std_logic_vector (2 downto 0);
      tx_mii_clk_1                        : out std_logic;
      rx_core_clk_1                       : in  std_logic;
      rx_clk_out_1                        : out std_logic;
      gt_loopback_in_1                    : in  std_logic_vector (2 downto 0);
      rx_reset_1                          : in  std_logic;
      user_rx_reset_1                     : out std_logic;
      rxrecclkout_1                       : out std_logic;
      rx_mii_d_1                          : out std_logic_vector (63 downto 0);
      rx_mii_c_1                          : out std_logic_vector (7 downto 0);
      ctl_rx_test_pattern_1               : in  std_logic;
      ctl_rx_test_pattern_enable_1        : in  std_logic;
      ctl_rx_data_pattern_select_1        : in  std_logic;
      ctl_rx_prbs31_test_pattern_enable_1 : in  std_logic;
      stat_rx_block_lock_1                : out std_logic;
      stat_rx_framing_err_valid_1         : out std_logic;
      stat_rx_framing_err_1               : out std_logic;
      stat_rx_hi_ber_1                    : out std_logic;
      stat_rx_valid_ctrl_code_1           : out std_logic;
      stat_rx_bad_code_1                  : out std_logic;
      stat_rx_bad_code_valid_1            : out std_logic;
      stat_rx_error_valid_1               : out std_logic;
      stat_rx_error_1                     : out std_logic_vector (7 downto 0);
      stat_rx_fifo_error_1                : out std_logic;
      stat_rx_local_fault_1               : out std_logic;
      stat_rx_status_1                    : out std_logic;
      tx_reset_1                          : in  std_logic;
      user_tx_reset_1                     : out std_logic;
      tx_mii_d_1                          : in  std_logic_vector (63 downto 0);
      tx_mii_c_1                          : in  std_logic_vector (7 downto 0);
      ctl_tx_test_pattern_1               : in  std_logic;
      ctl_tx_test_pattern_enable_1        : in  std_logic;
      ctl_tx_test_pattern_select_1        : in  std_logic;
      ctl_tx_data_pattern_select_1        : in  std_logic;
      ctl_tx_test_pattern_seed_a_1        : in  std_logic_vector (57 downto 0);
      ctl_tx_test_pattern_seed_b_1        : in  std_logic_vector (57 downto 0);
      ctl_tx_prbs31_test_pattern_enable_1 : in  std_logic;
      stat_tx_local_fault_1               : out std_logic;
      gtwiz_reset_tx_datapath_1           : in  std_logic;
      gtwiz_reset_rx_datapath_1           : in  std_logic;
      gtpowergood_out_1                   : out std_logic;
      txoutclksel_in_1                    : in  std_logic_vector (2 downto 0);
      rxoutclksel_in_1                    : in  std_logic_vector (2 downto 0);
      tx_mii_clk_2                        : out std_logic;
      rx_core_clk_2                       : in  std_logic;
      rx_clk_out_2                        : out std_logic;
      gt_loopback_in_2                    : in  std_logic_vector (2 downto 0);
      rx_reset_2                          : in  std_logic;
      user_rx_reset_2                     : out std_logic;
      rxrecclkout_2                       : out std_logic;
      rx_mii_d_2                          : out std_logic_vector (63 downto 0);
      rx_mii_c_2                          : out std_logic_vector (7 downto 0);
      ctl_rx_test_pattern_2               : in  std_logic;
      ctl_rx_test_pattern_enable_2        : in  std_logic;
      ctl_rx_data_pattern_select_2        : in  std_logic;
      ctl_rx_prbs31_test_pattern_enable_2 : in  std_logic;
      stat_rx_block_lock_2                : out std_logic;
      stat_rx_framing_err_valid_2         : out std_logic;
      stat_rx_framing_err_2               : out std_logic;
      stat_rx_hi_ber_2                    : out std_logic;
      stat_rx_valid_ctrl_code_2           : out std_logic;
      stat_rx_bad_code_2                  : out std_logic;
      stat_rx_bad_code_valid_2            : out std_logic;
      stat_rx_error_valid_2               : out std_logic;
      stat_rx_error_2                     : out std_logic_vector (7 downto 0);
      stat_rx_fifo_error_2                : out std_logic;
      stat_rx_local_fault_2               : out std_logic;
      stat_rx_status_2                    : out std_logic;
      tx_reset_2                          : in  std_logic;
      user_tx_reset_2                     : out std_logic;
      tx_mii_d_2                          : in  std_logic_vector (63 downto 0);
      tx_mii_c_2                          : in  std_logic_vector (7 downto 0);
      ctl_tx_test_pattern_2               : in  std_logic;
      ctl_tx_test_pattern_enable_2        : in  std_logic;
      ctl_tx_test_pattern_select_2        : in  std_logic;
      ctl_tx_data_pattern_select_2        : in  std_logic;
      ctl_tx_test_pattern_seed_a_2        : in  std_logic_vector (57 downto 0);
      ctl_tx_test_pattern_seed_b_2        : in  std_logic_vector (57 downto 0);
      ctl_tx_prbs31_test_pattern_enable_2 : in  std_logic;
      stat_tx_local_fault_2               : out std_logic;
      gtwiz_reset_tx_datapath_2           : in  std_logic;
      gtwiz_reset_rx_datapath_2           : in  std_logic;
      gtpowergood_out_2                   : out std_logic;
      txoutclksel_in_2                    : in  std_logic_vector (2 downto 0);
      rxoutclksel_in_2                    : in  std_logic_vector (2 downto 0);
      tx_mii_clk_3                        : out std_logic;
      rx_core_clk_3                       : in  std_logic;
      rx_clk_out_3                        : out std_logic;
      gt_loopback_in_3                    : in  std_logic_vector (2 downto 0);
      rx_reset_3                          : in  std_logic;
      user_rx_reset_3                     : out std_logic;
      rxrecclkout_3                       : out std_logic;
      rx_mii_d_3                          : out std_logic_vector (63 downto 0);
      rx_mii_c_3                          : out std_logic_vector (7 downto 0);
      ctl_rx_test_pattern_3               : in  std_logic;
      ctl_rx_test_pattern_enable_3        : in  std_logic;
      ctl_rx_data_pattern_select_3        : in  std_logic;
      ctl_rx_prbs31_test_pattern_enable_3 : in  std_logic;
      stat_rx_block_lock_3                : out std_logic;
      stat_rx_framing_err_valid_3         : out std_logic;
      stat_rx_framing_err_3               : out std_logic;
      stat_rx_hi_ber_3                    : out std_logic;
      stat_rx_valid_ctrl_code_3           : out std_logic;
      stat_rx_bad_code_3                  : out std_logic;
      stat_rx_bad_code_valid_3            : out std_logic;
      stat_rx_error_valid_3               : out std_logic;
      stat_rx_error_3                     : out std_logic_vector (7 downto 0);
      stat_rx_fifo_error_3                : out std_logic;
      stat_rx_local_fault_3               : out std_logic;
      stat_rx_status_3                    : out std_logic;
      tx_reset_3                          : in  std_logic;
      user_tx_reset_3                     : out std_logic;
      tx_mii_d_3                          : in  std_logic_vector (63 downto 0);
      tx_mii_c_3                          : in  std_logic_vector (7 downto 0);
      ctl_tx_test_pattern_3               : in  std_logic;
      ctl_tx_test_pattern_enable_3        : in  std_logic;
      ctl_tx_test_pattern_select_3        : in  std_logic;
      ctl_tx_data_pattern_select_3        : in  std_logic;
      ctl_tx_test_pattern_seed_a_3        : in  std_logic_vector (57 downto 0);
      ctl_tx_test_pattern_seed_b_3        : in  std_logic_vector (57 downto 0);
      ctl_tx_prbs31_test_pattern_enable_3 : in  std_logic;
      stat_tx_local_fault_3               : out std_logic;
      gtwiz_reset_tx_datapath_3           : in  std_logic;
      gtwiz_reset_rx_datapath_3           : in  std_logic;
      gtpowergood_out_3                   : out std_logic;
      txoutclksel_in_3                    : in  std_logic_vector (2 downto 0);
      rxoutclksel_in_3                    : in  std_logic_vector (2 downto 0);
      gt_refclk_p                         : in  std_logic_vector (0 to 0);
      gt_refclk_n                         : in  std_logic_vector (0 to 0);
      gt_refclk_out                       : out std_logic_vector (0 to 0);
      qpllreset_in_0                      : in  std_logic;
      sys_reset                           : in  std_logic;
      dclk                                : in  std_logic
      );
  end component xxv_ethernet_0;
  
  component e7udpip10G_independent_clk
    port (
      -- Xilinx 10G PCS/PMAモジュールと、XGMIIインターフェースで接続する
      xgmii_rx_clk : in  std_logic;     -- 15625MHz
      xgmii_tx_clk : in  std_logic;     -- 15625MHz
      xgmii_txd    : out std_logic_vector(63 downto 0);
      xgmii_txc    : out std_logic_vector(7 downto 0);
      xgmii_rxd    : in  std_logic_vector(63 downto 0);
      xgmii_rxc    : in  std_logic_vector(7 downto 0);
      linkup       : in  std_logic;     -- 非同期

      -- Asynchronous Reset
      Reset_n : in std_logic;

      -- UPL interface
      pUPLGlobalClk     : in  std_logic;
      -- UDP tx input
      pUdp0Send_Data    : in  std_logic_vector(127 downto 0);
      pUdp0Send_Request : in  std_logic;
      pUdp0Send_Ack     : out std_logic;
      pUdp0Send_Enable  : in  std_logic;

      pUdp1Send_Data    : in  std_logic_vector(127 downto 0);
      pUdp1Send_Request : in  std_logic;
      pUdp1Send_Ack     : out std_logic;
      pUdp1Send_Enable  : in  std_logic;

      -- UDP rx output
      pUdp0Receive_Data    : out std_logic_vector(127 downto 0);
      pUdp0Receive_Request : out std_logic;
      pUdp0Receive_Ack     : in  std_logic;
      pUdp0Receive_Enable  : out std_logic;

      pUdp1Receive_Data    : out std_logic_vector(127 downto 0);
      pUdp1Receive_Request : out std_logic;
      pUdp1Receive_Ack     : in  std_logic;
      pUdp1Receive_Enable  : out std_logic;

      -- Setup
      pMyIpAddr       : in std_logic_vector(31 downto 0);
      pMyMacAddr      : in std_logic_vector(47 downto 0);
      pMyNetmask      : in std_logic_vector(31 downto 0);
      pDefaultGateway : in std_logic_vector(31 downto 0);
      pTargetIPAddr   : in std_logic_vector(31 downto 0);
      pMyUdpPort0     : in std_logic_vector(15 downto 0);
      pMyUdpPort1     : in std_logic_vector(15 downto 0);

      -- Status
      pStatus_clk                     : in  std_logic;    
      pStatus_RxByteCount             : out std_logic_vector( 63 downto 0 );
      pStatus_RxPacketCount           : out std_logic_vector( 31 downto 0 );
      pStatus_RxErrorPacketCount      : out std_logic_vector( 15 downto 0 );
      pStatus_RxDropPacketCount       : out std_logic_vector( 31 downto 0 );
      pStatus_RxARPRequestPacketCount : out std_logic_vector( 15 downto 0 );
      pStatus_RxARPReplyPacketCount   : out std_logic_vector( 15 downto 0 );
      pStatus_RxICMPPacketCount       : out std_logic_vector( 15 downto 0 );
      pStatus_RxUDP0PacketCount       : out std_logic_vector( 15 downto 0 );
      pStatus_RxUDP1PacketCount       : out std_logic_vector( 15 downto 0 );
      pStatus_RxIPErrorPacketCount    : out std_logic_vector( 15 downto 0 );
      pStatus_RxUDPErrorPacketCount   : out std_logic_vector( 15 downto 0 );

      pStatus_TxByteCount             : out std_logic_vector(63 downto 0);
      pStatus_TxPacketCount           : out std_logic_vector(31 downto 0);
      pStatus_TxARPRequestPacketCount : out std_logic_vector(15 downto 0);
      pStatus_TxARPReplyPacketCount   : out std_logic_vector(15 downto 0);
      pStatus_TxICMPReplyPacketCount  : out std_logic_vector(15 downto 0);
      pStatus_TxUDP0PacketCount       : out std_logic_vector(15 downto 0);
      pStatus_TxUDP1PacketCount       : out std_logic_vector(15 downto 0);
      pStatus_TxMulticastPacketCount  : out std_logic_vector(15 downto 0);

      pdebug : out std_logic_vector(63 downto 0)
      );
  end component e7udpip10G_independent_clk;

  component ila_0
    port (
      clk : in std_logic;
      probe0 : in std_logic_vector(13 downto 0);
      probe1 : in std_logic_vector(31 downto 0)
      );
  end component ila_0;

  component ila_1
    port (
      clk : in std_logic;
      probe0 : in std_logic_vector(130 downto 0);
      probe1 : in std_logic_vector(130 downto 0);
      probe2 : in std_logic_vector(130 downto 0);
      probe3 : in std_logic_vector(130 downto 0);
      probe4 : in std_logic_vector(130 downto 0);
      probe5 : in std_logic_vector(130 downto 0);
      probe6 : in std_logic_vector(130 downto 0);
      probe7 : in std_logic_vector(130 downto 0)
      );
  end component ila_1;
  
  component ila_2
    port (
      clk     : in std_logic;
      probe0  : in std_logic_vector(63 downto 0);
      probe1  : in std_logic_vector(31 downto 0);
      probe2  : in std_logic_vector(15 downto 0);
      probe3  : in std_logic_vector(31 downto 0);
      probe4  : in std_logic_vector(15 downto 0);
      probe5  : in std_logic_vector(15 downto 0);
      probe6  : in std_logic_vector(15 downto 0);
      probe7  : in std_logic_vector(15 downto 0);
      probe8  : in std_logic_vector(15 downto 0);
      probe9  : in std_logic_vector(15 downto 0);
      probe10 : in std_logic_vector(15 downto 0);
      probe11 : in std_logic_vector(63 downto 0);
      probe12 : in std_logic_vector(31 downto 0);
      probe13 : in std_logic_vector(15 downto 0);
      probe14 : in std_logic_vector(15 downto 0);
      probe15 : in std_logic_vector(15 downto 0);
      probe16 : in std_logic_vector(15 downto 0);
      probe17 : in std_logic_vector(15 downto 0);
      probe18 : in std_logic_vector(15 downto 0)
      );
  end component ila_2;

  signal restart_tx_rx_0       : std_logic;
  signal send_continous_pkts_0 : std_logic;  -- This port can be used to send continous packets 
  signal rx_gt_locked_led_0    : std_logic;  -- Indicates GT LOCK
  signal restart_tx_rx_1       : std_logic;
  signal send_continous_pkts_1 : std_logic;  -- This port can be used to send continous packets 
  signal rx_gt_locked_led_1    : std_logic;  -- Indicates GT LOCK
  signal restart_tx_rx_2       : std_logic;
  signal send_continous_pkts_2 : std_logic;  -- This port can be used to send continous packets 
  signal rx_gt_locked_led_2    : std_logic;  -- Indicates GT LOCK
  signal restart_tx_rx_3       : std_logic;
  signal send_continous_pkts_3 : std_logic;  -- This port can be used to send continous packets 
  signal rx_gt_locked_led_3    : std_logic;  -- Indicates GT LOCK
  signal completion_status     : std_logic_vector(4 downto 0);
  signal qpllreset_in_0        : std_logic;

  signal sys_reset     : std_logic := '1';
  signal sys_reset_n   : std_logic := '0';
  signal reset_counter : unsigned(31 downto 0) := X"00000000";

  attribute keep of sys_reset : signal is "true";
  attribute keep of reset_counter : signal is "true";

  constant gt_loopback_in_0 : std_logic_vector(2 downto 0) := "000";
  constant gt_loopback_in_1 : std_logic_vector(2 downto 0) := "000";
  constant gt_loopback_in_2 : std_logic_vector(2 downto 0) := "000";
  constant gt_loopback_in_3 : std_logic_vector(2 downto 0) := "000";

  signal rx_core_clk_0                       : std_logic;
  signal rx_clk_out_0                        : std_logic;
  signal tx_mii_clk_0                        : std_logic;
  signal rx_reset_0                          : std_logic;
  signal user_rx_reset_0                     : std_logic;
  signal rxrecclkout_0                       : std_logic;
  signal rx_mii_d_0                          : std_logic_vector(63 downto 0);
  signal rx_mii_c_0                          : std_logic_vector(7 downto 0);
  signal ctl_rx_test_pattern_0               : std_logic                     := '0';
  signal ctl_rx_test_pattern_enable_0        : std_logic                     := '0';
  signal ctl_rx_data_pattern_select_0        : std_logic                     := '0';
  signal ctl_rx_prbs31_test_pattern_enable_0 : std_logic                     := '0';
  signal stat_rx_block_lock_0                : std_logic;
  signal stat_rx_framing_err_valid_0         : std_logic;
  signal stat_rx_framing_err_0               : std_logic;
  signal stat_rx_hi_ber_0                    : std_logic;
  signal stat_rx_valid_ctrl_code_0           : std_logic;
  signal stat_rx_bad_code_0                  : std_logic;
  signal stat_rx_bad_code_valid_0            : std_logic;
  signal stat_rx_error_valid_0               : std_logic;
  signal stat_rx_error_0                     : std_logic_vector(7 downto 0);
  signal stat_rx_fifo_error_0                : std_logic;
  signal stat_rx_local_fault_0               : std_logic;
  signal stat_rx_status_0                    : std_logic;
  signal tx_reset_0                          : std_logic;
  signal user_tx_reset_0                     : std_logic;
  signal tx_mii_d_0                          : std_logic_vector(63 downto 0);
  signal tx_mii_c_0                          : std_logic_vector(7 downto 0);
  signal ctl_tx_test_pattern_0               : std_logic                     := '0';
  signal ctl_tx_test_pattern_enable_0        : std_logic                     := '0';
  signal ctl_tx_test_pattern_select_0        : std_logic                     := '0';
  signal ctl_tx_data_pattern_select_0        : std_logic                     := '0';
  signal ctl_tx_test_pattern_seed_a_0        : std_logic_vector(57 downto 0) := std_logic_vector(to_unsigned(0, 58));
  signal ctl_tx_test_pattern_seed_b_0        : std_logic_vector(57 downto 0) := std_logic_vector(to_unsigned(0, 58));
  signal ctl_tx_prbs31_test_pattern_enable_0 : std_logic                     := '0';
  signal stat_tx_local_fault_0               : std_logic;
  signal gtwiz_reset_tx_datapath_0           : std_logic;
  signal gtwiz_reset_rx_datapath_0           : std_logic;
  signal gtpowergood_out_0                   : std_logic;
  signal txoutclksel_in_0                    : std_logic_vector(2 downto 0);
  signal rxoutclksel_in_0                    : std_logic_vector(2 downto 0);

  signal rx_core_clk_1                       : std_logic;
  signal rx_clk_out_1                        : std_logic;
  signal tx_mii_clk_1                        : std_logic;
  signal rx_reset_1                          : std_logic;
  signal user_rx_reset_1                     : std_logic;
  signal rxrecclkout_1                       : std_logic;
  signal rx_mii_d_1                          : std_logic_vector(63 downto 0);
  signal rx_mii_c_1                          : std_logic_vector(7 downto 0);
  signal ctl_rx_test_pattern_1               : std_logic                     := '0';
  signal ctl_rx_test_pattern_enable_1        : std_logic                     := '0';
  signal ctl_rx_data_pattern_select_1        : std_logic                     := '0';
  signal ctl_rx_prbs31_test_pattern_enable_1 : std_logic                     := '0';
  signal stat_rx_block_lock_1                : std_logic;
  signal stat_rx_framing_err_valid_1         : std_logic;
  signal stat_rx_framing_err_1               : std_logic;
  signal stat_rx_hi_ber_1                    : std_logic;
  signal stat_rx_valid_ctrl_code_1           : std_logic;
  signal stat_rx_bad_code_1                  : std_logic;
  signal stat_rx_bad_code_valid_1            : std_logic;
  signal stat_rx_error_valid_1               : std_logic;
  signal stat_rx_error_1                     : std_logic_vector(7 downto 0);
  signal stat_rx_fifo_error_1                : std_logic;
  signal stat_rx_local_fault_1               : std_logic;
  signal stat_rx_status_1                    : std_logic;
  signal tx_reset_1                          : std_logic;
  signal user_tx_reset_1                     : std_logic;
  signal tx_mii_d_1                          : std_logic_vector(63 downto 0);
  signal tx_mii_c_1                          : std_logic_vector(7 downto 0);
  signal ctl_tx_test_pattern_1               : std_logic                     := '0';
  signal ctl_tx_test_pattern_enable_1        : std_logic                     := '0';
  signal ctl_tx_test_pattern_select_1        : std_logic                     := '0';
  signal ctl_tx_data_pattern_select_1        : std_logic                     := '0';
  signal ctl_tx_test_pattern_seed_a_1        : std_logic_vector(57 downto 0) := std_logic_vector(to_unsigned(0, 58));
  signal ctl_tx_test_pattern_seed_b_1        : std_logic_vector(57 downto 0) := std_logic_vector(to_unsigned(0, 58));
  signal ctl_tx_prbs31_test_pattern_enable_1 : std_logic                     := '0';
  signal stat_tx_local_fault_1               : std_logic;
  signal gtwiz_reset_tx_datapath_1           : std_logic;
  signal gtwiz_reset_rx_datapath_1           : std_logic;
  signal gtpowergood_out_1                   : std_logic;
  signal txoutclksel_in_1                    : std_logic_vector(2 downto 0);
  signal rxoutclksel_in_1                    : std_logic_vector(2 downto 0);

  signal rx_core_clk_2                       : std_logic;
  signal rx_clk_out_2                        : std_logic;
  signal tx_mii_clk_2                        : std_logic;
  signal rx_reset_2                          : std_logic;
  signal user_rx_reset_2                     : std_logic;
  signal rxrecclkout_2                       : std_logic;
  signal rx_mii_d_2                          : std_logic_vector(63 downto 0);
  signal rx_mii_c_2                          : std_logic_vector(7 downto 0);
  signal ctl_rx_test_pattern_2               : std_logic                     := '0';
  signal ctl_rx_test_pattern_enable_2        : std_logic                     := '0';
  signal ctl_rx_data_pattern_select_2        : std_logic                     := '0';
  signal ctl_rx_prbs31_test_pattern_enable_2 : std_logic                     := '0';
  signal stat_rx_block_lock_2                : std_logic;
  signal stat_rx_framing_err_valid_2         : std_logic;
  signal stat_rx_framing_err_2               : std_logic;
  signal stat_rx_hi_ber_2                    : std_logic;
  signal stat_rx_valid_ctrl_code_2           : std_logic;
  signal stat_rx_bad_code_2                  : std_logic;
  signal stat_rx_bad_code_valid_2            : std_logic;
  signal stat_rx_error_valid_2               : std_logic;
  signal stat_rx_error_2                     : std_logic_vector(7 downto 0);
  signal stat_rx_fifo_error_2                : std_logic;
  signal stat_rx_local_fault_2               : std_logic;
  signal stat_rx_status_2                    : std_logic;
  signal tx_reset_2                          : std_logic;
  signal user_tx_reset_2                     : std_logic;
  signal tx_mii_d_2                          : std_logic_vector(63 downto 0);
  signal tx_mii_c_2                          : std_logic_vector(7 downto 0);
  signal ctl_tx_test_pattern_2               : std_logic                     := '0';
  signal ctl_tx_test_pattern_enable_2        : std_logic                     := '0';
  signal ctl_tx_test_pattern_select_2        : std_logic                     := '0';
  signal ctl_tx_data_pattern_select_2        : std_logic                     := '0';
  signal ctl_tx_test_pattern_seed_a_2        : std_logic_vector(57 downto 0) := std_logic_vector(to_unsigned(0, 58));
  signal ctl_tx_test_pattern_seed_b_2        : std_logic_vector(57 downto 0) := std_logic_vector(to_unsigned(0, 58));
  signal ctl_tx_prbs31_test_pattern_enable_2 : std_logic                     := '0';
  signal stat_tx_local_fault_2               : std_logic;
  signal gtwiz_reset_tx_datapath_2           : std_logic;
  signal gtwiz_reset_rx_datapath_2           : std_logic;
  signal gtpowergood_out_2                   : std_logic;
  signal txoutclksel_in_2                    : std_logic_vector(2 downto 0);
  signal rxoutclksel_in_2                    : std_logic_vector(2 downto 0);
                                                                              
  signal rx_core_clk_3                       : std_logic;
  signal rx_clk_out_3                        : std_logic;
  signal tx_mii_clk_3                        : std_logic;
  signal rx_reset_3                          : std_logic;
  signal user_rx_reset_3                     : std_logic;
  signal rxrecclkout_3                       : std_logic;
  signal rx_mii_d_3                          : std_logic_vector(63 downto 0);
  signal rx_mii_c_3                          : std_logic_vector(7 downto 0);
  signal ctl_rx_test_pattern_3               : std_logic                     := '0';
  signal ctl_rx_test_pattern_enable_3        : std_logic                     := '0';
  signal ctl_rx_data_pattern_select_3        : std_logic                     := '0';
  signal ctl_rx_prbs31_test_pattern_enable_3 : std_logic                     := '0';
  signal stat_rx_block_lock_3                : std_logic;
  signal stat_rx_framing_err_valid_3         : std_logic;
  signal stat_rx_framing_err_3               : std_logic;
  signal stat_rx_hi_ber_3                    : std_logic;
  signal stat_rx_valid_ctrl_code_3           : std_logic;
  signal stat_rx_bad_code_3                  : std_logic;
  signal stat_rx_bad_code_valid_3            : std_logic;
  signal stat_rx_error_valid_3               : std_logic;
  signal stat_rx_error_3                     : std_logic_vector(7 downto 0);
  signal stat_rx_fifo_error_3                : std_logic;
  signal stat_rx_local_fault_3               : std_logic;
  signal stat_rx_status_3                    : std_logic;
  signal tx_reset_3                          : std_logic;
  signal user_tx_reset_3                     : std_logic;
  signal tx_mii_d_3                          : std_logic_vector(63 downto 0);
  signal tx_mii_c_3                          : std_logic_vector(7 downto 0);
  signal ctl_tx_test_pattern_3               : std_logic                     := '0';
  signal ctl_tx_test_pattern_enable_3        : std_logic                     := '0';
  signal ctl_tx_test_pattern_select_3        : std_logic                     := '0';
  signal ctl_tx_data_pattern_select_3        : std_logic                     := '0';
  signal ctl_tx_test_pattern_seed_a_3        : std_logic_vector(57 downto 0) := std_logic_vector(to_unsigned(0, 58));
  signal ctl_tx_test_pattern_seed_b_3        : std_logic_vector(57 downto 0) := std_logic_vector(to_unsigned(0, 58));
  signal ctl_tx_prbs31_test_pattern_enable_3 : std_logic                     := '0';
  signal stat_tx_local_fault_3               : std_logic;
  signal gtwiz_reset_tx_datapath_3           : std_logic;
  signal gtwiz_reset_rx_datapath_3           : std_logic;
  signal gtpowergood_out_3                   : std_logic;
  signal txoutclksel_in_3                    : std_logic_vector(2 downto 0);
  signal rxoutclksel_in_3                    : std_logic_vector(2 downto 0);

  signal completion_status_0 : std_logic_vector(4 downto 0);
  signal completion_status_1 : std_logic_vector(4 downto 0);
  signal completion_status_2 : std_logic_vector(4 downto 0);
  signal completion_status_3 : std_logic_vector(4 downto 0);
  
  signal gt_refclk_out : std_logic;

  signal pStatus_RxByteCount_0             : std_logic_vector(63 downto 0);
  signal pStatus_RxPacketCount_0           : std_logic_vector(31 downto 0);
  signal pStatus_RxErrorPacketCount_0      : std_logic_vector(15 downto 0);
  signal pStatus_RxDropPacketCount_0       : std_logic_vector(31 downto 0);
  signal pStatus_RxARPRequestPacketCount_0 : std_logic_vector(15 downto 0);
  signal pStatus_RxARPReplyPacketCount_0   : std_logic_vector(15 downto 0);
  signal pStatus_RxICMPPacketCount_0       : std_logic_vector(15 downto 0);
  signal pStatus_RxUDP0PacketCount_0       : std_logic_vector(15 downto 0);
  signal pStatus_RxUDP1PacketCount_0       : std_logic_vector(15 downto 0);
  signal pStatus_RxIPErrorPacketCount_0    : std_logic_vector(15 downto 0);
  signal pStatus_RxUDPErrorPacketCount_0   : std_logic_vector(15 downto 0);
  signal pStatus_TxByteCount_0             : std_logic_vector(63 downto 0);
  signal pStatus_TxPacketCount_0           : std_logic_vector(31 downto 0);
  signal pStatus_TxARPRequestPacketCount_0 : std_logic_vector(15 downto 0);
  signal pStatus_TxARPReplyPacketCount_0   : std_logic_vector(15 downto 0);
  signal pStatus_TxICMPReplyPacketCount_0  : std_logic_vector(15 downto 0);
  signal pStatus_TxUDP0PacketCount_0       : std_logic_vector(15 downto 0);
  signal pStatus_TxUDP1PacketCount_0       : std_logic_vector(15 downto 0);
  signal pStatus_TxMulticastPacketCount_0  : std_logic_vector(15 downto 0);
  
  attribute keep of pStatus_RxByteCount_0             : signal is "true";
  attribute keep of pStatus_RxPacketCount_0           : signal is "true";
  attribute keep of pStatus_RxErrorPacketCount_0      : signal is "true";
  attribute keep of pStatus_RxDropPacketCount_0       : signal is "true";
  attribute keep of pStatus_RxARPRequestPacketCount_0 : signal is "true";
  attribute keep of pStatus_RxARPReplyPacketCount_0   : signal is "true";
  attribute keep of pStatus_RxICMPPacketCount_0       : signal is "true";
  attribute keep of pStatus_RxUDP0PacketCount_0       : signal is "true";
  attribute keep of pStatus_RxUDP1PacketCount_0       : signal is "true";
  attribute keep of pStatus_RxIPErrorPacketCount_0    : signal is "true";
  attribute keep of pStatus_RxUDPErrorPacketCount_0   : signal is "true";
  attribute keep of pStatus_TxByteCount_0             : signal is "true";
  attribute keep of pStatus_TxPacketCount_0           : signal is "true";
  attribute keep of pStatus_TxARPRequestPacketCount_0 : signal is "true";
  attribute keep of pStatus_TxARPReplyPacketCount_0   : signal is "true";
  attribute keep of pStatus_TxICMPReplyPacketCount_0  : signal is "true";
  attribute keep of pStatus_TxUDP0PacketCount_0       : signal is "true";
  attribute keep of pStatus_TxUDP1PacketCount_0       : signal is "true";
  attribute keep of pStatus_TxMulticastPacketCount_0  : signal is "true";

begin

  sys_reset_n <= not sys_reset;

  rx_core_clk_0 <= rx_clk_out_0;
  rx_reset_0 <= sys_reset;
  tx_reset_0 <= sys_reset;
  gtwiz_reset_tx_datapath_0 <= '0'; 
  gtwiz_reset_rx_datapath_0 <= '0'; 
  txoutclksel_in_0 <= "101"; -- this value should not be changed as per gtwizard 
  rxoutclksel_in_0 <= "101"; -- this value should not be changed as per gtwizard
  rx_block_lock_led_0 <= stat_rx_block_lock_0 and stat_rx_status_0;
  
  rx_core_clk_1 <= rx_clk_out_1;
  rx_reset_1 <= sys_reset;
  tx_reset_1 <= sys_reset;
  gtwiz_reset_tx_datapath_1 <= '0'; 
  gtwiz_reset_rx_datapath_1 <= '0'; 
  txoutclksel_in_1 <= "101"; -- this value should not be changed as per gtwizard 
  rxoutclksel_in_1 <= "101"; -- this value should not be changed as per gtwizard
  rx_block_lock_led_1 <= stat_rx_block_lock_1 and stat_rx_status_1;

  rx_core_clk_2 <= rx_clk_out_2;
  rx_reset_2 <= sys_reset;
  tx_reset_2 <= sys_reset;
  gtwiz_reset_tx_datapath_2 <= '0'; 
  gtwiz_reset_rx_datapath_2 <= '0'; 
  txoutclksel_in_2 <= "101"; -- this value should not be changed as per gtwizard 
  rxoutclksel_in_2 <= "101"; -- this value should not be changed as per gtwizard
  rx_block_lock_led_2 <= stat_rx_block_lock_2 and stat_rx_status_2;
  
  rx_core_clk_3 <= rx_clk_out_3;
  rx_reset_3 <= sys_reset;
  tx_reset_3 <= sys_reset;
  gtwiz_reset_tx_datapath_3 <= '0'; 
  gtwiz_reset_rx_datapath_3 <= '0'; 
  txoutclksel_in_3 <= "101"; -- this value should not be changed as per gtwizard 
  rxoutclksel_in_3 <= "101"; -- this value should not be changed as per gtwizard
  rx_block_lock_led_3 <= stat_rx_block_lock_3 and stat_rx_status_3;

  qpllreset_in_0 <= '0'; -- Changing qpllreset_in_0 value may impact or disturb other cores in case of multicore
                         -- User should take care of this while changing.
  
  restart_tx_rx_0 <= '0';
  send_continous_pkts_0 <= '0';
  restart_tx_rx_1 <= '0';
  send_continous_pkts_1 <= '0';
  restart_tx_rx_2 <= '0';
  send_continous_pkts_2 <= '0';
  restart_tx_rx_3 <= '0';
  send_continous_pkts_3 <= '0';
  
  process(clk250mhz)
  begin
    if rising_edge(clk250mhz) then
      if clk_locked = '0' then
        reset_counter <= X"00000000";
        sys_reset <= '1';
      else
        if to_integer(reset_counter) < 3000 then
          reset_counter <= reset_counter + 1;
        end if;
        if to_integer(reset_counter) < 100 then
          sys_reset <= '1';
        else
          sys_reset <= '0';
        end if;
      end if;
    end if;
  end process;
    
  xxv_ethernet_0_i : xxv_ethernet_0 port map(
    gt_rxp_in     => gt_rxp_in,
    gt_rxn_in     => gt_rxn_in,
    gt_txp_out    => gt_txp_out,
    gt_txn_out    => gt_txn_out,
    tx_mii_clk_0  => tx_mii_clk_0,
    rx_core_clk_0 => rx_core_clk_0,
    rx_clk_out_0  => rx_clk_out_0,

    gt_loopback_in_0 => gt_loopback_in_0,
    rx_reset_0       => rx_reset_0,
    user_rx_reset_0  => user_rx_reset_0,
    rxrecclkout_0    => rxrecclkout_0,

    -- RX User Interface Signals
    rx_mii_d_0 => rx_mii_d_0,
    rx_mii_c_0 => rx_mii_c_0,


    -- RX Control Signals
    ctl_rx_test_pattern_0               => ctl_rx_test_pattern_0,
    ctl_rx_test_pattern_enable_0        => ctl_rx_test_pattern_enable_0,
    ctl_rx_data_pattern_select_0        => ctl_rx_data_pattern_select_0,
    ctl_rx_prbs31_test_pattern_enable_0 => ctl_rx_prbs31_test_pattern_enable_0,

    -- RX Stats Signals
    stat_rx_block_lock_0        => stat_rx_block_lock_0,
    stat_rx_framing_err_valid_0 => stat_rx_framing_err_valid_0,
    stat_rx_framing_err_0       => stat_rx_framing_err_0,
    stat_rx_hi_ber_0            => stat_rx_hi_ber_0,
    stat_rx_valid_ctrl_code_0   => stat_rx_valid_ctrl_code_0,
    stat_rx_bad_code_0          => stat_rx_bad_code_0,
    stat_rx_bad_code_valid_0    => stat_rx_bad_code_valid_0,
    stat_rx_error_valid_0       => stat_rx_error_valid_0,
    stat_rx_error_0             => stat_rx_error_0,
    stat_rx_fifo_error_0        => stat_rx_fifo_error_0,
    stat_rx_local_fault_0       => stat_rx_local_fault_0,
    stat_rx_status_0            => stat_rx_status_0,

    tx_reset_0      => tx_reset_0,
    user_tx_reset_0 => user_tx_reset_0,
    -- TX User Interface Signals
    tx_mii_d_0      => tx_mii_d_0,
    tx_mii_c_0      => tx_mii_c_0,

    -- TX Control Signals
    ctl_tx_test_pattern_0               => ctl_tx_test_pattern_0,
    ctl_tx_test_pattern_enable_0        => ctl_tx_test_pattern_enable_0,
    ctl_tx_test_pattern_select_0        => ctl_tx_test_pattern_select_0,
    ctl_tx_data_pattern_select_0        => ctl_tx_data_pattern_select_0,
    ctl_tx_test_pattern_seed_a_0        => ctl_tx_test_pattern_seed_a_0,
    ctl_tx_test_pattern_seed_b_0        => ctl_tx_test_pattern_seed_b_0,
    ctl_tx_prbs31_test_pattern_enable_0 => ctl_tx_prbs31_test_pattern_enable_0,

    -- TX Stats Signals
    stat_tx_local_fault_0 => stat_tx_local_fault_0,

    gtwiz_reset_tx_datapath_0 => gtwiz_reset_tx_datapath_0,
    gtwiz_reset_rx_datapath_0 => gtwiz_reset_rx_datapath_0,
    gtpowergood_out_0         => gtpowergood_out_0,
    txoutclksel_in_0          => txoutclksel_in_0,
    rxoutclksel_in_0          => rxoutclksel_in_0,
    tx_mii_clk_1              => tx_mii_clk_1,
    rx_core_clk_1             => rx_core_clk_1,
    rx_clk_out_1              => rx_clk_out_1,
 
    gt_loopback_in_1 => gt_loopback_in_1,
    rx_reset_1       => rx_reset_1,
    user_rx_reset_1  => user_rx_reset_1,
    rxrecclkout_1    => rxrecclkout_1,
    
    -- RX User Interface Signals
    rx_mii_d_1 => rx_mii_d_1,
    rx_mii_c_1 => rx_mii_c_1,


    -- RX Control Signals
    ctl_rx_test_pattern_1               => ctl_rx_test_pattern_1,
    ctl_rx_test_pattern_enable_1        => ctl_rx_test_pattern_enable_1,
    ctl_rx_data_pattern_select_1        => ctl_rx_data_pattern_select_1,
    ctl_rx_prbs31_test_pattern_enable_1 => ctl_rx_prbs31_test_pattern_enable_1,

    -- RX Stats Signals
    stat_rx_block_lock_1        => stat_rx_block_lock_1,
    stat_rx_framing_err_valid_1 => stat_rx_framing_err_valid_1,
    stat_rx_framing_err_1       => stat_rx_framing_err_1,
    stat_rx_hi_ber_1            => stat_rx_hi_ber_1,
    stat_rx_valid_ctrl_code_1   => stat_rx_valid_ctrl_code_1,
    stat_rx_bad_code_1          => stat_rx_bad_code_1,
    stat_rx_bad_code_valid_1    => stat_rx_bad_code_valid_1,
    stat_rx_error_valid_1       => stat_rx_error_valid_1,
    stat_rx_error_1             => stat_rx_error_1,
    stat_rx_fifo_error_1        => stat_rx_fifo_error_1,
    stat_rx_local_fault_1       => stat_rx_local_fault_1,
    stat_rx_status_1            => stat_rx_status_1,

    tx_reset_1      => tx_reset_1,
    user_tx_reset_1 => user_tx_reset_1,
    -- TX User Interface Signals
    tx_mii_d_1      => tx_mii_d_1,
    tx_mii_c_1      => tx_mii_c_1,

    -- TX Control Signals
    ctl_tx_test_pattern_1               => ctl_tx_test_pattern_1,
    ctl_tx_test_pattern_enable_1        => ctl_tx_test_pattern_enable_1,
    ctl_tx_test_pattern_select_1        => ctl_tx_test_pattern_select_1,
    ctl_tx_data_pattern_select_1        => ctl_tx_data_pattern_select_1,
    ctl_tx_test_pattern_seed_a_1        => ctl_tx_test_pattern_seed_a_1,
    ctl_tx_test_pattern_seed_b_1        => ctl_tx_test_pattern_seed_b_1,
    ctl_tx_prbs31_test_pattern_enable_1 => ctl_tx_prbs31_test_pattern_enable_1,

    -- TX Stats Signals
    stat_tx_local_fault_1 => stat_tx_local_fault_1,

    gtwiz_reset_tx_datapath_1 => gtwiz_reset_tx_datapath_1,
    gtwiz_reset_rx_datapath_1 => gtwiz_reset_rx_datapath_1,
    gtpowergood_out_1         => gtpowergood_out_1,
    txoutclksel_in_1          => txoutclksel_in_1,
    rxoutclksel_in_1          => rxoutclksel_in_1,
    tx_mii_clk_2              => tx_mii_clk_2,
    rx_core_clk_2             => rx_core_clk_2,
    rx_clk_out_2              => rx_clk_out_2,
 
    gt_loopback_in_2 => gt_loopback_in_2,
    rx_reset_2       => rx_reset_2,
    user_rx_reset_2  => user_rx_reset_2,
    rxrecclkout_2    => rxrecclkout_2,

    -- RX User Interface Signals
    rx_mii_d_2 => rx_mii_d_2,
    rx_mii_c_2 => rx_mii_c_2,

    -- RX Control Signals
    ctl_rx_test_pattern_2               => ctl_rx_test_pattern_2,
    ctl_rx_test_pattern_enable_2        => ctl_rx_test_pattern_enable_2,
    ctl_rx_data_pattern_select_2        => ctl_rx_data_pattern_select_2,
    ctl_rx_prbs31_test_pattern_enable_2 => ctl_rx_prbs31_test_pattern_enable_2,

    -- RX Stats Signals
    stat_rx_block_lock_2        => stat_rx_block_lock_2,
    stat_rx_framing_err_valid_2 => stat_rx_framing_err_valid_2,
    stat_rx_framing_err_2       => stat_rx_framing_err_2,
    stat_rx_hi_ber_2            => stat_rx_hi_ber_2,
    stat_rx_valid_ctrl_code_2   => stat_rx_valid_ctrl_code_2,
    stat_rx_bad_code_2          => stat_rx_bad_code_2,
    stat_rx_bad_code_valid_2    => stat_rx_bad_code_valid_2,
    stat_rx_error_valid_2       => stat_rx_error_valid_2,
    stat_rx_error_2             => stat_rx_error_2,
    stat_rx_fifo_error_2        => stat_rx_fifo_error_2,
    stat_rx_local_fault_2       => stat_rx_local_fault_2,
    stat_rx_status_2            => stat_rx_status_2,

    tx_reset_2      => tx_reset_2,
    user_tx_reset_2 => user_tx_reset_2,
    -- TX User Interface Signals
    tx_mii_d_2      => tx_mii_d_2,
    tx_mii_c_2      => tx_mii_c_2,

    -- TX Control Signals
    ctl_tx_test_pattern_2               => ctl_tx_test_pattern_2,
    ctl_tx_test_pattern_enable_2        => ctl_tx_test_pattern_enable_2,
    ctl_tx_test_pattern_select_2        => ctl_tx_test_pattern_select_2,
    ctl_tx_data_pattern_select_2        => ctl_tx_data_pattern_select_2,
    ctl_tx_test_pattern_seed_a_2        => ctl_tx_test_pattern_seed_a_2,
    ctl_tx_test_pattern_seed_b_2        => ctl_tx_test_pattern_seed_b_2,
    ctl_tx_prbs31_test_pattern_enable_2 => ctl_tx_prbs31_test_pattern_enable_2,

    -- TX Stats Signals
    stat_tx_local_fault_2 => stat_tx_local_fault_2,

    gtwiz_reset_tx_datapath_2 => gtwiz_reset_tx_datapath_2,
    gtwiz_reset_rx_datapath_2 => gtwiz_reset_rx_datapath_2,
    gtpowergood_out_2         => gtpowergood_out_2,
    txoutclksel_in_2          => txoutclksel_in_2,
    rxoutclksel_in_2          => rxoutclksel_in_2,
    tx_mii_clk_3              => tx_mii_clk_3,
    rx_core_clk_3             => rx_core_clk_3,
    rx_clk_out_3              => rx_clk_out_3,
 
    gt_loopback_in_3  => gt_loopback_in_3,
    rx_reset_3  => rx_reset_3,
    user_rx_reset_3  => user_rx_reset_3,
    rxrecclkout_3  => rxrecclkout_3,

    -- RX User Interface Signals
    rx_mii_d_3 => rx_mii_d_3,
    rx_mii_c_3 => rx_mii_c_3,

    -- RX Control Signals
    ctl_rx_test_pattern_3               => ctl_rx_test_pattern_3,
    ctl_rx_test_pattern_enable_3        => ctl_rx_test_pattern_enable_3,
    ctl_rx_data_pattern_select_3        => ctl_rx_data_pattern_select_3,
    ctl_rx_prbs31_test_pattern_enable_3 => ctl_rx_prbs31_test_pattern_enable_3,

    -- RX Stats Signals
    stat_rx_block_lock_3        => stat_rx_block_lock_3,
    stat_rx_framing_err_valid_3 => stat_rx_framing_err_valid_3,
    stat_rx_framing_err_3       => stat_rx_framing_err_3,
    stat_rx_hi_ber_3            => stat_rx_hi_ber_3,
    stat_rx_valid_ctrl_code_3   => stat_rx_valid_ctrl_code_3,
    stat_rx_bad_code_3          => stat_rx_bad_code_3,
    stat_rx_bad_code_valid_3    => stat_rx_bad_code_valid_3,
    stat_rx_error_valid_3       => stat_rx_error_valid_3,
    stat_rx_error_3             => stat_rx_error_3,
    stat_rx_fifo_error_3        => stat_rx_fifo_error_3,
    stat_rx_local_fault_3       => stat_rx_local_fault_3,
    stat_rx_status_3            => stat_rx_status_3,
    
    tx_reset_3      => tx_reset_3,
    user_tx_reset_3 => user_tx_reset_3,
    -- TX User Interface Signals
    tx_mii_d_3      => tx_mii_d_3,
    tx_mii_c_3      => tx_mii_c_3,

    -- TX Control Signals
    ctl_tx_test_pattern_3               => ctl_tx_test_pattern_3,
    ctl_tx_test_pattern_enable_3        => ctl_tx_test_pattern_enable_3,
    ctl_tx_test_pattern_select_3        => ctl_tx_test_pattern_select_3,
    ctl_tx_data_pattern_select_3        => ctl_tx_data_pattern_select_3,
    ctl_tx_test_pattern_seed_a_3        => ctl_tx_test_pattern_seed_a_3,
    ctl_tx_test_pattern_seed_b_3        => ctl_tx_test_pattern_seed_b_3,
    ctl_tx_prbs31_test_pattern_enable_3 => ctl_tx_prbs31_test_pattern_enable_3,

    -- TX Stats Signals
    stat_tx_local_fault_3 => stat_tx_local_fault_3,

    gtwiz_reset_tx_datapath_3 => gtwiz_reset_tx_datapath_3,
    gtwiz_reset_rx_datapath_3 => gtwiz_reset_rx_datapath_3,
    gtpowergood_out_3         => gtpowergood_out_3,
    txoutclksel_in_3          => txoutclksel_in_3,
    rxoutclksel_in_3          => rxoutclksel_in_3,
    qpllreset_in_0            => qpllreset_in_0,
    gt_refclk_p(0)            => gt_refclk_p,
    gt_refclk_n(0)            => gt_refclk_n,
    gt_refclk_out(0)          => gt_refclk_out,
    sys_reset                 => sys_reset,
    dclk                      => clk100mhz
    );

  completion_status(0) <= completion_status_0(0) and completion_status_1(0) and completion_status_2(0) and completion_status_3(0);
  completion_status(1) <= completion_status_0(1) and completion_status_1(1) and completion_status_2(1) and completion_status_3(1);
  completion_status(2) <= completion_status_0(2) and completion_status_1(2) and completion_status_2(2) and completion_status_3(2);
  completion_status(3) <= completion_status_0(3) and completion_status_1(3) and completion_status_2(3) and completion_status_3(3);
  completion_status(4) <= completion_status_0(4) and completion_status_1(4) and completion_status_2(4) and completion_status_3(4);

  ----------------------------------------------------------------------
  -- #0
  ----------------------------------------------------------------------
  e7udpip10G_i_0 : e7udpip10G_independent_clk port map
    (
      -- Xilinx 10G PCS/PMAモジュールと、XGMIIインターフェースで接続する
      xgmii_rx_clk => rx_core_clk_0,
      xgmii_tx_clk => tx_mii_clk_0,
      xgmii_txd    => tx_mii_d_0,
      xgmii_txc    => tx_mii_c_0,
      xgmii_rxd    => rx_mii_d_0,
      xgmii_rxc    => rx_mii_c_0,
      linkup       => '1',

      -- Asynchronous Reset
      Reset_n => sys_reset_n,
      
      -- UPL interface
      pUPLGlobalClk     => clk250mhz,
      -- UDP tx input
      pUdp0Send_Data    => pUdp0Send_Data_0,
      pUdp0Send_Request => pUdp0Send_Request_0,
      pUdp0Send_Ack     => pUdp0Send_Ack_0,
      pUdp0Send_Enable  => pUdp0Send_Enable_0,

      pUdp1Send_Data    => pUdp1Send_Data_0,
      pUdp1Send_Request => pUdp1Send_Request_0,
      pUdp1Send_Ack     => pUdp1Send_Ack_0,
      pUdp1Send_Enable  => pUdp1Send_Enable_0,

      -- UDP rx output
      pUdp0Receive_Data    => pUdp0Receive_Data_0,
      pUdp0Receive_Request => pUdp0Receive_Request_0,
      pUdp0Receive_Ack     => pUdp0Receive_Ack_0,
      pUdp0Receive_Enable  => pUdp0Receive_Enable_0,

      pUdp1Receive_Data    => pUdp1Receive_Data_0,
      pUdp1Receive_Request => pUdp1Receive_Request_0,
      pUdp1Receive_Ack     => pUdp1Receive_Ack_0,
      pUdp1Receive_Enable  => pUdp1Receive_Enable_0,

      -- Setup
      pMyIpAddr       => MyIpAddr_0,
      pMyMacAddr      => MyMacAddr_0,
      pMyNetmask      => MyNetMask_0,
      pDefaultGateway => DefaultGateway_0,
      pTargetIPAddr   => TargetIPAddr_0,
      pMyUdpPort0     => MyUdpPort_0_0,
      pMyUdpPort1     => MyUdpPort_0_1,

      -- Status
      pStatus_clk                     => clk250mhz,
      pStatus_RxByteCount             => pStatus_RxByteCount_0,
      pStatus_RxPacketCount           => pStatus_RxPacketCount_0,
      pStatus_RxErrorPacketCount      => pStatus_RxErrorPacketCount_0,
      pStatus_RxDropPacketCount       => pStatus_RxDropPacketCount_0,
      pStatus_RxARPRequestPacketCount => pStatus_RxARPRequestPacketCount_0,
      pStatus_RxARPReplyPacketCount   => pStatus_RxARPReplyPacketCount_0,
      pStatus_RxICMPPacketCount       => pStatus_RxICMPPacketCount_0,
      pStatus_RxUDP0PacketCount       => pStatus_RxUDP0PacketCount_0,
      pStatus_RxUDP1PacketCount       => pStatus_RxUDP1PacketCount_0,
      pStatus_RxIPErrorPacketCount    => pStatus_RxIPErrorPacketCount_0,
      pStatus_RxUDPErrorPacketCount   => pStatus_RxUDPErrorPacketCount_0,

      pStatus_TxByteCount             => pStatus_TxByteCount_0,
      pStatus_TxPacketCount           => pStatus_TxPacketCount_0,
      pStatus_TxARPRequestPacketCount => pStatus_TxARPRequestPacketCount_0,
      pStatus_TxARPReplyPacketCount   => pStatus_TxARPReplyPacketCount_0,
      pStatus_TxICMPReplyPacketCount  => pStatus_TxICMPReplyPacketCount_0,
      pStatus_TxUDP0PacketCount       => pStatus_TxUDP0PacketCount_0,
      pStatus_TxUDP1PacketCount       => pStatus_TxUDP1PacketCount_0,
      pStatus_TxMulticastPacketCount  => pStatus_TxMulticastPacketCount_0,

      pdebug => open
      );

  ----------------------------------------------------------------------
  -- #1
  ----------------------------------------------------------------------
  e7udpip10G_i_1 : e7udpip10G_independent_clk port map
    (
      -- Xilinx 10G PCS/PMAモジュールと、XGMIIインターフェースで接続する
      xgmii_rx_clk => rx_core_clk_1,
      xgmii_tx_clk => tx_mii_clk_1,
      xgmii_txd    => tx_mii_d_1,
      xgmii_txc    => tx_mii_c_1,
      xgmii_rxd    => rx_mii_d_1,
      xgmii_rxc    => rx_mii_c_1,
      linkup       => '1',

      -- Asynchronous Reset
      Reset_n => sys_reset_n,
      
      -- UPL interface
      pUPLGlobalClk     => clk250mhz,
      -- UDP tx input
      pUdp0Send_Data    => pUdp0Send_Data_1,
      pUdp0Send_Request => pUdp0Send_Request_1,
      pUdp0Send_Ack     => pUdp0Send_Ack_1,
      pUdp0Send_Enable  => pUdp0Send_Enable_1,

      pUdp1Send_Data    => pUdp1Send_Data_1,
      pUdp1Send_Request => pUdp1Send_Request_1,
      pUdp1Send_Ack     => pUdp1Send_Ack_1,
      pUdp1Send_Enable  => pUdp1Send_Enable_1,

      -- UDP rx output
      pUdp0Receive_Data    => pUdp0Receive_Data_1,
      pUdp0Receive_Request => pUdp0Receive_Request_1,
      pUdp0Receive_Ack     => pUdp0Receive_Ack_1,
      pUdp0Receive_Enable  => pUdp0Receive_Enable_1,

      pUdp1Receive_Data    => pUdp1Receive_Data_1,
      pUdp1Receive_Request => pUdp1Receive_Request_1,
      pUdp1Receive_Ack     => pUdp1Receive_Ack_1,
      pUdp1Receive_Enable  => pUdp1Receive_Enable_1,

      -- Setup
      pMyIpAddr       => MyIpAddr_1,
      pMyMacAddr      => MyMacAddr_1,
      pMyNetmask      => MyNetMask_1,
      pDefaultGateway => DefaultGateway_1,
      pTargetIPAddr   => TargetIPAddr_1,
      pMyUdpPort0     => MyUdpPort_1_0,
      pMyUdpPort1     => MyUdpPort_1_1,

      -- Status
      pStatus_clk                     => clk250mhz,
      pStatus_RxByteCount             => open,
      pStatus_RxPacketCount           => open,
      pStatus_RxErrorPacketCount      => open,
      pStatus_RxDropPacketCount       => open,
      pStatus_RxARPRequestPacketCount => open,
      pStatus_RxARPReplyPacketCount   => open,
      pStatus_RxICMPPacketCount       => open,
      pStatus_RxUDP0PacketCount       => open,
      pStatus_RxUDP1PacketCount       => open,
      pStatus_RxIPErrorPacketCount    => open,
      pStatus_RxUDPErrorPacketCount   => open,

      pStatus_TxByteCount             => open,
      pStatus_TxPacketCount           => open,
      pStatus_TxARPRequestPacketCount => open,
      pStatus_TxARPReplyPacketCount   => open,
      pStatus_TxICMPReplyPacketCount  => open,
      pStatus_TxUDP0PacketCount       => open,
      pStatus_TxUDP1PacketCount       => open,
      pStatus_TxMulticastPacketCount  => open,

      pdebug => open
      );

  ----------------------------------------------------------------------
  -- #2
  ----------------------------------------------------------------------
  e7udpip10G_i_2 : e7udpip10G_independent_clk port map
    (
      -- Xilinx 10G PCS/PMAモジュールと、XGMIIインターフェースで接続する
      xgmii_rx_clk => rx_core_clk_2,
      xgmii_tx_clk => tx_mii_clk_2,
      xgmii_txd    => tx_mii_d_2,
      xgmii_txc    => tx_mii_c_2,
      xgmii_rxd    => rx_mii_d_2,
      xgmii_rxc    => rx_mii_c_2,
      linkup       => '1',

      -- Asynchronous Reset
      Reset_n => sys_reset_n,
      
      -- UPL interface
      pUPLGlobalClk     => clk250mhz,
      -- UDP tx input
      pUdp0Send_Data    => pUdp0Send_Data_2,
      pUdp0Send_Request => pUdp0Send_Request_2,
      pUdp0Send_Ack     => pUdp0Send_Ack_2,
      pUdp0Send_Enable  => pUdp0Send_Enable_2,

      pUdp1Send_Data    => pUdp1Send_Data_2,
      pUdp1Send_Request => pUdp1Send_Request_2,
      pUdp1Send_Ack     => pUdp1Send_Ack_2,
      pUdp1Send_Enable  => pUdp1Send_Enable_2,

      -- UDP rx output
      pUdp0Receive_Data    => pUdp0Receive_Data_2,
      pUdp0Receive_Request => pUdp0Receive_Request_2,
      pUdp0Receive_Ack     => pUdp0Receive_Ack_2,
      pUdp0Receive_Enable  => pUdp0Receive_Enable_2,

      pUdp1Receive_Data    => pUdp1Receive_Data_2,
      pUdp1Receive_Request => pUdp1Receive_Request_2,
      pUdp1Receive_Ack     => pUdp1Receive_Ack_2,
      pUdp1Receive_Enable  => pUdp1Receive_Enable_2,

      -- Setup
      pMyIpAddr       => MyIpAddr_2,
      pMyMacAddr      => MyMacAddr_2,
      pMyNetmask      => MyNetMask_2,
      pDefaultGateway => DefaultGateway_2,
      pTargetIPAddr   => TargetIPAddr_2,
      pMyUdpPort0     => MyUdpPort_2_0,
      pMyUdpPort1     => MyUdpPort_2_1,

      -- Status
      pStatus_clk                     => clk250mhz,
      pStatus_RxByteCount             => open,
      pStatus_RxPacketCount           => open,
      pStatus_RxErrorPacketCount      => open,
      pStatus_RxDropPacketCount       => open,
      pStatus_RxARPRequestPacketCount => open,
      pStatus_RxARPReplyPacketCount   => open,
      pStatus_RxICMPPacketCount       => open,
      pStatus_RxUDP0PacketCount       => open,
      pStatus_RxUDP1PacketCount       => open,
      pStatus_RxIPErrorPacketCount    => open,
      pStatus_RxUDPErrorPacketCount   => open,

      pStatus_TxByteCount             => open,
      pStatus_TxPacketCount           => open,
      pStatus_TxARPRequestPacketCount => open,
      pStatus_TxARPReplyPacketCount   => open,
      pStatus_TxICMPReplyPacketCount  => open,
      pStatus_TxUDP0PacketCount       => open,
      pStatus_TxUDP1PacketCount       => open,
      pStatus_TxMulticastPacketCount  => open,

      pdebug => open
      );

  ----------------------------------------------------------------------
  -- #3
  ----------------------------------------------------------------------
  e7udpip10G_i_3 : e7udpip10G_independent_clk port map
    (
      -- Xilinx 10G PCS/PMAモジュールと、XGMIIインターフェースで接続する
      xgmii_rx_clk => rx_core_clk_3,
      xgmii_tx_clk => tx_mii_clk_3,
      xgmii_txd    => tx_mii_d_3,
      xgmii_txc    => tx_mii_c_3,
      xgmii_rxd    => rx_mii_d_3,
      xgmii_rxc    => rx_mii_c_3,
      linkup       => '1',

      -- Asynchronous Reset
      Reset_n => sys_reset_n,
      
      -- UPL interface
      pUPLGlobalClk     => clk250mhz,
      -- UDP tx input
      pUdp0Send_Data    => pUdp0Send_Data_3,
      pUdp0Send_Request => pUdp0Send_Request_3,
      pUdp0Send_Ack     => pUdp0Send_Ack_3,
      pUdp0Send_Enable  => pUdp0Send_Enable_3,

      pUdp1Send_Data    => pUdp1Send_Data_3,
      pUdp1Send_Request => pUdp1Send_Request_3,
      pUdp1Send_Ack     => pUdp1Send_Ack_3,
      pUdp1Send_Enable  => pUdp1Send_Enable_3,

      -- UDP rx output
      pUdp0Receive_Data    => pUdp0Receive_Data_3,
      pUdp0Receive_Request => pUdp0Receive_Request_3,
      pUdp0Receive_Ack     => pUdp0Receive_Ack_3,
      pUdp0Receive_Enable  => pUdp0Receive_Enable_3,

      pUdp1Receive_Data    => pUdp1Receive_Data_3,
      pUdp1Receive_Request => pUdp1Receive_Request_3,
      pUdp1Receive_Ack     => pUdp1Receive_Ack_3,
      pUdp1Receive_Enable  => pUdp1Receive_Enable_3,

      -- Setup
      pMyIpAddr       => MyIpAddr_3,
      pMyMacAddr      => MyMacAddr_3,
      pMyNetmask      => MyNetMask_3,
      pDefaultGateway => DefaultGateway_3,
      pTargetIPAddr   => TargetIPAddr_3,
      pMyUdpPort0     => MyUdpPort_3_0,
      pMyUdpPort1     => MyUdpPort_3_1,

      -- Status
      pStatus_clk                     => clk250mhz,
      pStatus_RxByteCount             => open,
      pStatus_RxPacketCount           => open,
      pStatus_RxErrorPacketCount      => open,
      pStatus_RxDropPacketCount       => open,
      pStatus_RxARPRequestPacketCount => open,
      pStatus_RxARPReplyPacketCount   => open,
      pStatus_RxICMPPacketCount       => open,
      pStatus_RxUDP0PacketCount       => open,
      pStatus_RxUDP1PacketCount       => open,
      pStatus_RxIPErrorPacketCount    => open,
      pStatus_RxUDPErrorPacketCount   => open,

      pStatus_TxByteCount             => open,
      pStatus_TxPacketCount           => open,
      pStatus_TxARPRequestPacketCount => open,
      pStatus_TxARPReplyPacketCount   => open,
      pStatus_TxICMPReplyPacketCount  => open,
      pStatus_TxUDP0PacketCount       => open,
      pStatus_TxUDP1PacketCount       => open,
      pStatus_TxMulticastPacketCount  => open,

      pdebug => open
      );

  ila_2_i : ila_2 port map(
    clk     => clk250mhz,
    probe0  => pStatus_RxByteCount_0,
    probe1  => pStatus_RxPacketCount_0,
    probe2  => pStatus_RxErrorPacketCount_0,
    probe3  => pStatus_RxDropPacketCount_0,
    probe4  => pStatus_RxARPRequestPacketCount_0,
    probe5  => pStatus_RxARPReplyPacketCount_0,
    probe6  => pStatus_RxICMPPacketCount_0,
    probe7  => pStatus_RxUDP0PacketCount_0,
    probe8  => pStatus_RxUDP1PacketCount_0,
    probe9  => pStatus_RxIPErrorPacketCount_0,
    probe10 => pStatus_RxUDPErrorPacketCount_0,
    probe11 => pStatus_TxByteCount_0,
    probe12 => pStatus_TxPacketCount_0,
    probe13 => pStatus_TxARPRequestPacketCount_0,
    probe14 => pStatus_TxARPReplyPacketCount_0,
    probe15 => pStatus_TxICMPReplyPacketCount_0,
    probe16 => pStatus_TxUDP0PacketCount_0,
    probe17 => pStatus_TxUDP1PacketCount_0,
    probe18 => pStatus_TxMulticastPacketCount_0
    );

end RTL;
