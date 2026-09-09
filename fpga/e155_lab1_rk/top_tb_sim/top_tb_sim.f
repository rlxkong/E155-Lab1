-L work
-reflib pmi_work
-reflib ovi_ice40up


"C:/Users/rkong/Documents/GitHub/E155-Lab1/fpga/e155_lab1_rk/source/impl_1/lab1_rk.sv" 
"C:/Users/rkong/Documents/GitHub/E155-Lab1/fpga/e155_lab1_rk/source/impl_1/counter.sv" 
"C:/Users/rkong/Documents/GitHub/E155-Lab1/fpga/e155_lab1_rk/source/impl_1/sevenseg.sv" 
"C:/Users/rkong/Documents/GitHub/E155-Lab1/fpga/e155_lab1_rk/source/impl_1/lab1_rk_tb.sv" 
-sv
-optionset VOPTDEBUG
+noacc+pmi_work.*
+noacc+ovi_ice40up.*

-vopt.options
  -suppress vopt-7033
-end

-gui
-top lab1_rk_tb
-vsim.options
  -suppress vsim-7033,vsim-8630,3009,3389
-end

-do "view wave"
-do "add wave /*"
-do "run -all"
