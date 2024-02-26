# Initialize the design
read_lef your_tech.lef
read_def pre_pnr.def
read_liberty -min your_std_cell_lib.lib
read_liberty -max your_std_cell_lib.lib
read_verilog synthesized_design.v

# Place and Route
global_placement
detailed_placement
route

# Write the outputs
write_def post_pnr.def
write_gds final_layout.gds

# After routing
route

# Extract area and other metrics
set total_area [get_property top.area]
set total_wirelength [get_property top.wirelength]

# Write PPA results to a file
set results_file [open "results.txt" w]
puts $results_file "Area: $total_area"
puts $results_file "Wirelength: $total_wirelength"
close $results_file

# Continue with the rest of the script
write_def post_pnr.def
write_gds final_layout.gds

