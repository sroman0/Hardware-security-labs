all: simulate

simulate: counter_4bit.v tb_counter.v
	iverilog -o counter_4bit_tb counter_4bit.v tb_counter.v
	vvp counter_4bit_tb

clean:
	rm -f counter_4bit_tb
	rm -f *.vcd
