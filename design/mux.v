// This module describes a 1-bit 2x1 multiplexor

module mux (
  input  wire     a  ,
  input  wire     b  ,
  input  wire     sel,
  output  reg     out
);

assign out = sel? b:a; 

endmodule
