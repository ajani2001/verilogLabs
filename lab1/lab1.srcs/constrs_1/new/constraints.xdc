set_property PACKAGE_PIN M16 [get_ports l_door]
set_property PACKAGE_PIN M15 [get_ports r_door]
set_property PACKAGE_PIN J1 [get_ports lamp]
set_property IOSTANDARD LVCMOS33 [get_ports l_door]
set_property IOSTANDARD LVCMOS33 [get_ports lamp]
set_property IOSTANDARD LVCMOS33 [get_ports r_door]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property SLEW SLOW [get_ports lamp]

set_property PACKAGE_PIN A7 [get_ports toggle]
set_property PACKAGE_PIN A8 [get_ports {lights[7]}]
set_property PACKAGE_PIN A3 [get_ports {lights[5]}]
