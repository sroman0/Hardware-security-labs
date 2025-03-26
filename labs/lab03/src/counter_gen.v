
module counter_gen
  #(
    parameter NBIT = 4)
   (
    input                clk,
    input                rstn,
    output reg [NBIT-1:0] out);

   // Watermark logic
   (* keep = "true" *) reg [2:0] watermark_shift;
   (* keep = "true" *) wire detect;

   assign detect = (watermark_shift == 3'b101);

   always @ (posedge clk, negedge rstn) begin
      if (! rstn) begin
         out <= 0;
         watermark_shift <= 3'b001; // seed value
      end else begin
         out <= out + 1;
         watermark_shift <= {watermark_shift[1:0], ~watermark_shift[2]}; // Feedback inverter
      end
   end

endmodule
