# Read the design
read_verilog your_design.v

# Generic synthesis
synth -top your_top_module

# Map to some standard cell library
dfflibmap -liberty your_std_cell_lib.lib
abc -liberty your_std_cell_lib.lib

# Write the output netlist
write_verilog -noattr synthesized_design.v
