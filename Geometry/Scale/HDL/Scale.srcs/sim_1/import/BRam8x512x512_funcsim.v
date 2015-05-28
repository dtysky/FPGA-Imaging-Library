`timescale 1 ps / 1 ps
module BRam8x512x512(
  clka,
  wea,
  addra,
  dina,
  clkb,
  addrb,
  doutb);
  input clka;
  input [0:0]wea;
  input [17:0]addra;
  input [7:0]dina;
  input clkb;
  input [17:0]addrb;
  output reg [7:0]doutb;

  reg[7 : 0] mem[0 : 2 ** 18 - 1];
  always @(posedge clka) begin
    if(wea)
      mem[addra] <= dina;
    else
      mem[addra] <= mem[addra];
  end

  always @(posedge clkb)
      doutb <= mem[addrb];

endmodule