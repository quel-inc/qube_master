set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property BITSTREAM.CONFIG.CONFIGFALLBACK Enable [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 85.0 [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN disable [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR Yes [current_design]

set_property PACKAGE_PIN U3  [get_ports {gt_rxn_in[0]}]; # Bank 230  - MGTYRXN0_230
set_property PACKAGE_PIN U4  [get_ports {gt_rxp_in[0]}]; # Bank 230  - MGTYRXP0_230
set_property PACKAGE_PIN T1  [get_ports {gt_rxn_in[1]}]; # Bank 230  - MGTYRXN1_230
set_property PACKAGE_PIN T2  [get_ports {gt_rxp_in[1]}]; # Bank 230  - MGTYRXP1_230
set_property PACKAGE_PIN R3  [get_ports {gt_rxn_in[2]}]; # Bank 230  - MGTYRXN2_230
set_property PACKAGE_PIN R4  [get_ports {gt_rxp_in[2]}]; # Bank 230  - MGTYRXP2_230
set_property PACKAGE_PIN P1  [get_ports {gt_rxn_in[3]}]; # Bank 230  - MGTYRXN3_230
set_property PACKAGE_PIN P2  [get_ports {gt_rxp_in[3]}]; # Bank 230  - MGTYRXP3_230
set_property PACKAGE_PIN U8  [get_ports {gt_txn_out[0]}]; # Bank 230  - MGTYTXN0_230
set_property PACKAGE_PIN U9  [get_ports {gt_txp_out[0]}]; # Bank 230  - MGTYTXP0_230
set_property PACKAGE_PIN T6  [get_ports {gt_txn_out[1]}]; # Bank 230  - MGTYTXN1_230
set_property PACKAGE_PIN T7  [get_ports {gt_txp_out[1]}]; # Bank 230  - MGTYTXP1_230
set_property PACKAGE_PIN R8  [get_ports {gt_txn_out[2]}]; # Bank 230  - MGTYTXN2_230
set_property PACKAGE_PIN R9  [get_ports {gt_txp_out[2]}]; # Bank 230  - MGTYTXP2_230
set_property PACKAGE_PIN P6  [get_ports {gt_txn_out[3]}]; # Bank 230  - MGTYTXN3_230
set_property PACKAGE_PIN P7  [get_ports {gt_txp_out[3]}]; # Bank 230  - MGTYTXP3_230

set_property PACKAGE_PIN N3  [get_ports {gt_rxn_in[4]}]; # Bank 231  - MGTYRXN0_231
set_property PACKAGE_PIN N4  [get_ports {gt_rxp_in[4]}]; # Bank 231  - MGTYRXP0_231
set_property PACKAGE_PIN M1  [get_ports {gt_rxn_in[5]}]; # Bank 231  - MGTYRXN1_231
set_property PACKAGE_PIN M2  [get_ports {gt_rxp_in[5]}]; # Bank 231  - MGTYRXP1_231
set_property PACKAGE_PIN L3  [get_ports {gt_rxn_in[6]}]; # Bank 231  - MGTYRXN2_231
set_property PACKAGE_PIN L4  [get_ports {gt_rxp_in[6]}]; # Bank 231  - MGTYRXP2_231
set_property PACKAGE_PIN K1  [get_ports {gt_rxn_in[7]}]; # Bank 231  - MGTYRXN3_231
set_property PACKAGE_PIN K2  [get_ports {gt_rxp_in[7]}]; # Bank 231  - MGTYRXP3_231
set_property PACKAGE_PIN N8  [get_ports {gt_txn_out[4]}]; # Bank 231  - MGTYTXN0_231
set_property PACKAGE_PIN N9  [get_ports {gt_txp_out[4]}]; # Bank 231  - MGTYTXP0_231
set_property PACKAGE_PIN M6  [get_ports {gt_txn_out[5]}]; # Bank 231  - MGTYTXN1_231
set_property PACKAGE_PIN M7  [get_ports {gt_txp_out[5]}]; # Bank 231  - MGTYTXP1_231
set_property PACKAGE_PIN L8  [get_ports {gt_txn_out[6]}]; # Bank 231  - MGTYTXN2_231
set_property PACKAGE_PIN L9  [get_ports {gt_txp_out[6]}]; # Bank 231  - MGTYTXP2_231
set_property PACKAGE_PIN K6  [get_ports {gt_txn_out[7]}]; # Bank 231  - MGTYTXN3_231
set_property PACKAGE_PIN K7  [get_ports {gt_txp_out[7]}]; # Bank 231  - MGTYTXP3_231

set_property PACKAGE_PIN BC21 [get_ports QSFP28_0_ACTIVITY_LED]
set_property IOSTANDARD LVCMOS12 [get_ports QSFP28_0_ACTIVITY_LED]
set_property PACKAGE_PIN BB21 [get_ports QSFP28_0_STATUS_LEDG]
set_property IOSTANDARD LVCMOS12 [get_ports QSFP28_0_STATUS_LEDG]
set_property PACKAGE_PIN BA20 [get_ports QSFP28_0_STATUS_LEDY]
set_property IOSTANDARD LVCMOS12 [get_ports QSFP28_0_STATUS_LEDY]

set_property PACKAGE_PIN M10 [get_ports gt_refclk_n[1]]; # MGT_SI570_CLOCK0_P (156.25MHz)
set_property PACKAGE_PIN M11 [get_ports gt_refclk_p[1]]; # MGT_SI570_CLOCK0_N (156.25MHz)

set_property PACKAGE_PIN T10 [get_ports gt_refclk_n[0]]; # MGT_SI570_CLOCK0_P (156.25MHz)
set_property PACKAGE_PIN T11 [get_ports gt_refclk_p[0]]; # MGT_SI570_CLOCK0_N (156.25MHz)

set_property PACKAGE_PIN AW20 [get_ports SYSCLK3_P]
set_property IOSTANDARD LVDS [get_ports SYSCLK3_P]
set_property PACKAGE_PIN AW19 [get_ports SYSCLK3_N]
set_property IOSTANDARD LVDS [get_ports SYSCLK3_N]
## set_property DQS_BIAS TRUE [get_ports SYSCLK3_P]
# create_clock -period 10.000 -name sysclk3 [get_ports "SYSCLK3_P"]

set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]] -to [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]] -to [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_2/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_2_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]] -to [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_3/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_3_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]] -to [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]]

set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_2/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_2_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_2/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_2_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_3/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_3_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_3/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_3_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]

set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_2/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_2_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_3/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_3_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_2/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_2_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_3/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_3_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]

set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]] -to [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]] -to [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_2/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_2_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]] -to [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_3/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_3_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]] -to [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_3/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_3_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]] -to [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {e7udpip10G_au200_test_bank230_i/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {e7udpip10G_au200_test_bank230_i/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_2/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_2_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {e7udpip10G_au200_test_bank230_i/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_3/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_3_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {e7udpip10G_au200_test_bank230_i/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_3/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_3_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {e7udpip10G_au200_test_bank230_i/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {e7udpip10G_au200_test_bank230_i/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {e7udpip10G_au200_test_bank230_i/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {e7udpip10G_au200_test_bank230_i/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_2/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_2_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {e7udpip10G_au200_test_bank230_i/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_2/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_2_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {e7udpip10G_au200_test_bank230_i/xxv_ethernet_0_i/inst/i_xxv_ethernet_0_gt_3/inst/gen_gtwizard_gtye4_top.xxv_ethernet_0_gt_3_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[35].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_2/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_2_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_3/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_3_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_2/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_2_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_3/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_3_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_2/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_2_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_2/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_2_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_3/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_3_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/TXOUTCLK}]] -to [get_clocks -of_objects [get_pins {*/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_3/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_3_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]

set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {e7udpip10g_au200_dual_i/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {e7udpip10g_au200_dual_i/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_1/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_1_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {e7udpip10g_au200_dual_i/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_2/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_2_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]
set_false_path -from [get_clocks -of_objects [get_pins clk_wiz_0_i/inst/mmcme4_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins {e7udpip10g_au200_dual_i/xxv_ethernet_1_i/inst/i_xxv_ethernet_1_gt_3/inst/gen_gtwizard_gtye4_top.xxv_ethernet_1_gt_3_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[36].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST/RXOUTCLK}]]

# PCIe
create_clock -name pcie_refclk_clk_p -period 10 [get_ports pcie_refclk_clk_p]

set_property PACKAGE_PIN AF1 [get_ports pci_express_x1_rxn];
set_property PACKAGE_PIN AF2 [get_ports pci_express_x1_rxp];
set_property PACKAGE_PIN AF6 [get_ports pci_express_x1_txn];
set_property PACKAGE_PIN AF7 [get_ports pci_express_x1_txp];
set_property PACKAGE_PIN AM10 [get_ports pcie_refclk_clk_n];
set_property PACKAGE_PIN AM11 [get_ports pcie_refclk_clk_p];

set_property -dict { PACKAGE_PIN BD21 IOSTANDARD LVCMOS12 } [get_ports pcie_perstn];
