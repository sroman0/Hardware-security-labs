# Makefile for building and running Verilog files with iverilog and gtkwave

# Variables
IVERILOG = iverilog
VVP = vvp
GTKWAVE = gtkwave

# Source files
SRC_AND = And/and.v And/tb_and.v
SRC_FF = dff/dff.v dff/tb_dff.v
SRC_MUX = mux_4to1/mux_4to1.v mux_4to1/tb_mux_4to1.v

# Output files
OUT_AND = And/tb_and.out
OUT_FF = dff/tb_dff.out
OUT_MUX = mux_4to1/tb_mux_4to1.out

# Waveform files
WAVES_AND = and.vcd
WAVES_FF = dff.vcd
WAVES_MUX = mux_4to1.vcd

# Default target
all: run_and run_dff run_mux

# Compile the Verilog files
$(OUT_AND): $(SRC_AND)
	$(IVERILOG) -o $(OUT_AND) $(SRC_AND)

$(OUT_FF): $(SRC_FF)
	$(IVERILOG) -o $(OUT_FF) $(SRC_FF)

$(OUT_MUX): $(SRC_MUX)
	$(IVERILOG) -o $(OUT_MUX) $(SRC_MUX)

# Run the simulations
run_and: $(OUT_AND)
	$(VVP) $(OUT_AND)

run_dff: $(OUT_FF)
	$(VVP) $(OUT_FF)

run_mux: $(OUT_MUX)
	$(VVP) $(OUT_MUX)

# View the waves
view_and: $(OUT_AND)
	$(GTKWAVE) $(WAVES_AND)

view_dff: $(OUT_FF)
	$(GTKWAVE) $(WAVES_FF)

view_mux: $(OUT_MUX)
	$(GTKWAVE) $(WAVES_MUX)

# Clean up generated files
clean:
	rm -f $(OUT_AND) $(WAVES_AND) $(OUT_FF) $(WAVES_FF) $(OUT_MUX) $(WAVES_MUX)

.PHONY: all run_and run_dff run_mux view_and view_dff view_mux clean
