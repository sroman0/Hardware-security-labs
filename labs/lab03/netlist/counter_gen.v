/* Generated by Yosys 0.33 (git sha1 2584903a060) */

(* hdlname = "\\counter_gen" *)
(* dynports =  1  *)
(* top =  1  *)
(* src = "../src/counter_gen.v:2.1-26.10" *)
module counter_gen(clk, rstn, out);
  (* src = "../src/counter_gen.v:16.4-24.7" *)
  wire [2:0] _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  (* src = "../src/counter_gen.v:16.4-24.7" *)
  wire _10_;
  (* src = "../src/counter_gen.v:21.17-21.24|/usr/bin/../share/yosys/techmap.v:270.23-270.24" *)
  wire _11_;
  (* src = "../src/counter_gen.v:21.17-21.24|/usr/bin/../share/yosys/techmap.v:270.26-270.27" *)
  wire _12_;
  (* src = "../src/counter_gen.v:21.17-21.24|/usr/bin/../share/yosys/techmap.v:270.26-270.27" *)
  wire _13_;
  (* src = "../src/counter_gen.v:21.17-21.24|/usr/bin/../share/yosys/techmap.v:270.26-270.27" *)
  wire _14_;
  (* src = "../src/counter_gen.v:21.17-21.24|/usr/bin/../share/yosys/techmap.v:270.26-270.27" *)
  wire _15_;
  (* src = "../src/counter_gen.v:21.17-21.24|/usr/bin/../share/yosys/techmap.v:270.26-270.27" *)
  wire _16_;
  (* src = "../src/counter_gen.v:21.17-21.24|/usr/bin/../share/yosys/techmap.v:270.26-270.27" *)
  wire _17_;
  (* src = "../src/counter_gen.v:21.17-21.24|/usr/bin/../share/yosys/techmap.v:270.26-270.27" *)
  wire _18_;
  (* src = "../src/counter_gen.v:12.29-12.35" *)
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  wire _24_;
  wire _25_;
  wire _26_;
  (* src = "../src/counter_gen.v:8.27-8.30" *)
  wire _27_;
  (* src = "../src/counter_gen.v:8.27-8.30" *)
  wire _28_;
  (* src = "../src/counter_gen.v:8.27-8.30" *)
  wire _29_;
  (* src = "../src/counter_gen.v:8.27-8.30" *)
  wire _30_;
  (* src = "../src/counter_gen.v:8.27-8.30" *)
  wire _31_;
  (* src = "../src/counter_gen.v:8.27-8.30" *)
  wire _32_;
  (* src = "../src/counter_gen.v:8.27-8.30" *)
  wire _33_;
  (* src = "../src/counter_gen.v:8.27-8.30" *)
  wire _34_;
  (* src = "../src/counter_gen.v:11.34-11.49" *)
  wire _35_;
  (* src = "../src/counter_gen.v:11.34-11.49" *)
  wire _36_;
  (* src = "../src/counter_gen.v:11.34-11.49" *)
  wire _37_;
  (* force_downto = 32'd1 *)
  (* src = "../src/counter_gen.v:21.17-21.24|/usr/bin/../share/yosys/techmap.v:270.23-270.24" *)
  wire [7:0] _38_;
  (* force_downto = 32'd1 *)
  (* src = "../src/counter_gen.v:21.17-21.24|/usr/bin/../share/yosys/techmap.v:270.26-270.27" *)
  wire [7:0] _39_;
  (* src = "../src/counter_gen.v:6.26-6.29" *)
  input clk;
  wire clk;
  (* keep = "true" *)
  (* src = "../src/counter_gen.v:12.29-12.35" *)
  (* unused_bits = "0" *)
  wire detect;
  (* src = "../src/counter_gen.v:8.27-8.30" *)
  output [7:0] out;
  reg [7:0] out;
  (* src = "../src/counter_gen.v:7.26-7.30" *)
  input rstn;
  wire rstn;
  (* keep = "true" *)
  (* src = "../src/counter_gen.v:11.34-11.49" *)
  reg [2:0] watermark_shift;
  sky130_fd_sc_hd__clkinv_1 _40_ (
    .A(_37_),
    .Y(_10_)
  );
  sky130_fd_sc_hd__clkinv_1 _41_ (
    .A(_27_),
    .Y(_11_)
  );
  sky130_fd_sc_hd__nand2_1 _42_ (
    .A(_37_),
    .B(_35_),
    .Y(_20_)
  );
  sky130_fd_sc_hd__nor2_1 _43_ (
    .A(_36_),
    .B(_20_),
    .Y(_19_)
  );
  sky130_fd_sc_hd__nand2_1 _44_ (
    .A(_27_),
    .B(_28_),
    .Y(_21_)
  );
  sky130_fd_sc_hd__xor2_1 _45_ (
    .A(_27_),
    .B(_28_),
    .X(_12_)
  );
  sky130_fd_sc_hd__xnor2_1 _46_ (
    .A(_29_),
    .B(_21_),
    .Y(_13_)
  );
  sky130_fd_sc_hd__and4_1 _47_ (
    .A(_27_),
    .B(_28_),
    .C(_29_),
    .D(_30_),
    .X(_22_)
  );
  sky130_fd_sc_hd__a31oi_1 _48_ (
    .A1(_27_),
    .A2(_28_),
    .A3(_29_),
    .B1(_30_),
    .Y(_23_)
  );
  sky130_fd_sc_hd__nor2_1 _49_ (
    .A(_22_),
    .B(_23_),
    .Y(_14_)
  );
  sky130_fd_sc_hd__nand2_1 _50_ (
    .A(_31_),
    .B(_22_),
    .Y(_24_)
  );
  sky130_fd_sc_hd__xor2_1 _51_ (
    .A(_31_),
    .B(_22_),
    .X(_15_)
  );
  sky130_fd_sc_hd__xnor2_1 _52_ (
    .A(_32_),
    .B(_24_),
    .Y(_16_)
  );
  sky130_fd_sc_hd__nand4_1 _53_ (
    .A(_31_),
    .B(_32_),
    .C(_33_),
    .D(_22_),
    .Y(_25_)
  );
  sky130_fd_sc_hd__a31oi_1 _54_ (
    .A1(_31_),
    .A2(_32_),
    .A3(_22_),
    .B1(_33_),
    .Y(_26_)
  );
  sky130_fd_sc_hd__lpflow_isobufsrc_1 _55_ (
    .A(_25_),
    .SLEEP(_26_),
    .X(_17_)
  );
  sky130_fd_sc_hd__xnor2_1 _56_ (
    .A(_34_),
    .B(_25_),
    .Y(_18_)
  );
  (* src = "../src/counter_gen.v:16.4-24.7" *)
  always @(posedge clk, negedge rstn)
    if (!rstn) out[7] <= 1'h0;
    else out[7] <= _39_[7];
  (* src = "../src/counter_gen.v:16.4-24.7" *)
  always @(posedge clk, negedge rstn)
    if (!rstn) watermark_shift[0] <= 1'h1;
    else watermark_shift[0] <= _00_[0];
  (* src = "../src/counter_gen.v:16.4-24.7" *)
  always @(posedge clk, negedge rstn)
    if (!rstn) watermark_shift[1] <= 1'h0;
    else watermark_shift[1] <= watermark_shift[0];
  (* src = "../src/counter_gen.v:16.4-24.7" *)
  always @(posedge clk, negedge rstn)
    if (!rstn) watermark_shift[2] <= 1'h0;
    else watermark_shift[2] <= watermark_shift[1];
  (* src = "../src/counter_gen.v:16.4-24.7" *)
  always @(posedge clk, negedge rstn)
    if (!rstn) out[0] <= 1'h0;
    else out[0] <= _38_[0];
  (* src = "../src/counter_gen.v:16.4-24.7" *)
  always @(posedge clk, negedge rstn)
    if (!rstn) out[1] <= 1'h0;
    else out[1] <= _39_[1];
  (* src = "../src/counter_gen.v:16.4-24.7" *)
  always @(posedge clk, negedge rstn)
    if (!rstn) out[2] <= 1'h0;
    else out[2] <= _39_[2];
  (* src = "../src/counter_gen.v:16.4-24.7" *)
  always @(posedge clk, negedge rstn)
    if (!rstn) out[3] <= 1'h0;
    else out[3] <= _39_[3];
  (* src = "../src/counter_gen.v:16.4-24.7" *)
  always @(posedge clk, negedge rstn)
    if (!rstn) out[4] <= 1'h0;
    else out[4] <= _39_[4];
  (* src = "../src/counter_gen.v:16.4-24.7" *)
  always @(posedge clk, negedge rstn)
    if (!rstn) out[5] <= 1'h0;
    else out[5] <= _39_[5];
  (* src = "../src/counter_gen.v:16.4-24.7" *)
  always @(posedge clk, negedge rstn)
    if (!rstn) out[6] <= 1'h0;
    else out[6] <= _39_[6];
  assign _00_[2:1] = watermark_shift[1:0];
  assign _38_[7:1] = out[7:1];
  assign _39_[0] = _38_[0];
  assign _37_ = watermark_shift[2];
  assign _00_[0] = _10_;
  assign _36_ = watermark_shift[1];
  assign _35_ = watermark_shift[0];
  assign detect = _19_;
  assign _27_ = out[0];
  assign _38_[0] = _11_;
  assign _28_ = out[1];
  assign _39_[1] = _12_;
  assign _29_ = out[2];
  assign _39_[2] = _13_;
  assign _30_ = out[3];
  assign _39_[3] = _14_;
  assign _31_ = out[4];
  assign _39_[4] = _15_;
  assign _32_ = out[5];
  assign _39_[5] = _16_;
  assign _33_ = out[6];
  assign _39_[6] = _17_;
  assign _34_ = out[7];
  assign _39_[7] = _18_;
endmodule
