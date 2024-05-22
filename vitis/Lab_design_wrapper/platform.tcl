# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/jefferyli/Project/ReactionTester/vitis/Lab_design_wrapper/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/jefferyli/Project/ReactionTester/vitis/Lab_design_wrapper/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {Lab_design_wrapper}\
-hw {/home/jefferyli/Project/ReactionTester/HW_Platform/Lab_design_wrapper.xsa}\
-out {/home/jefferyli/Project/ReactionTester/vitis}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {Lab_design_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
platform clean
platform clean
platform clean
platform generate
platform active {Lab_design_wrapper}
platform config -updatehw {/home/jefferyli/Project/ReactionTester/HW_Platform/Lab_design_wrapper.xsa}
platform generate -domains 
platform active {Lab_design_wrapper}
platform config -updatehw {/home/jefferyli/Project/ReactionTester/HW_Platform/Lab_design_wrapper.xsa}
bsp reload
domain active {zynq_fsbl}
bsp reload
bsp reload
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform active {Lab_design_wrapper}
platform active {Lab_design_wrapper}
platform config -updatehw {/home/jefferyli/Project/ReactionTester/HW_Platform/Lab_design_wrapper.xsa}
platform generate -domains 
platform config -updatehw {/home/jefferyli/Project/ReactionTester/HW_Platform/Lab_design_wrapper.xsa}
platform generate -domains 
platform active {Lab_design_wrapper}
bsp reload
domain active {zynq_fsbl}
bsp reload
platform generate -domains 
platform clean
platform generate
platform clean
platform generate
platform active {Lab_design_wrapper}
platform config -updatehw {/home/jefferyli/Project/ReactionTester/HW_Platform/Lab_design_wrapper.xsa}
platform generate
platform active {Lab_design_wrapper}
platform config -updatehw {/home/jefferyli/Project/ReactionTester/HW_Platform/Lab_design_wrapper.xsa}
platform generate -domains 
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform config -updatehw {/home/jefferyli/Project/ReactionTester/HW_Platform/Lab_design_wrapper.xsa}
platform generate -domains 
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform config -updatehw {/home/jefferyli/Project/ReactionTester/HW_Platform/Lab_design_wrapper.xsa}
platform generate -domains 
platform config -updatehw {/home/jefferyli/Project/ReactionTester/HW_Platform/Lab_design_wrapper.xsa}
platform generate -domains 
platform clean
platform clean
