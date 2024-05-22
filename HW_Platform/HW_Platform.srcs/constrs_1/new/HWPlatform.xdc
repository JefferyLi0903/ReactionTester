set_property PACKAGE_PIN N15 [get_ports confirm_button]
set_property PACKAGE_PIN N16 [get_ports start_button]
set_property PACKAGE_PIN M14 [get_ports {hint_o[0]}]
set_property PACKAGE_PIN M15 [get_ports {hint_o[1]}]
set_property PACKAGE_PIN K16 [get_ports {hint_o[2]}]
set_property PACKAGE_PIN J16 [get_ports {hint_o[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports confirm_button]
set_property IOSTANDARD LVCMOS33 [get_ports {hint_o[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hint_o[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hint_o[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hint_o[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports start_button]


set_property IOSTANDARD LVCMOS33 [get_ports pl_rstn]

set_property PACKAGE_PIN T17 [get_ports pl_rstn]
set_property MARK_DEBUG true [get_nets Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/hint_reg]

set_property DRIVE 12 [get_ports hint]
set_property SLEW SLOW [get_ports hint]
connect_debug_port u_ila_0/probe9 [get_nets [list hint_OBUF]]



connect_debug_port u_ila_0/probe1 [get_nets [list {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg[0]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg[1]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg[2]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg[3]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg[4]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg[5]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg[6]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg[7]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg[8]}]]




set_property MARK_DEBUG false [get_nets Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S_AXI_INTR_inst/irq]
connect_debug_port u_ila_0/probe1 [get_nets [list {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/res[0]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/res[1]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/res[2]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/res[3]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/res[4]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/res[5]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/res[6]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/res[7]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/res[8]}]]
connect_debug_port u_ila_0/probe7 [get_nets [list Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S_AXI_INTR_inst/irq]]



connect_debug_port u_ila_0/probe1 [get_nets [list {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg__0[0]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg__0[1]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg__0[2]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg__0[3]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg__0[4]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg__0[5]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg__0[6]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg__0[7]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg__0[8]}]]
connect_debug_port u_ila_0/probe3 [get_nets [list {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg[9]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg[10]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg[11]} {Lab1_design_i/TesterHW_0/inst/TesterHW_v1_0_S00_AXI_inst/tester_inst/timer_reg[12]}]]

