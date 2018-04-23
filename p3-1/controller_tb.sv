`include "controller.sv"

module controller(input logic clk, reset,
            input logic [5:0] op, funct,
            input logic zero,
            output logic pcen, memwrite, irwrite, regwrite,
            output logic alusrca, iord, memtoreg, regdst,
            output logic [1:0] alusrcb, pcsrc,
            output logic [2:0] alucontrol);

module controller_testbench();

  // input
  logic clk, reset, funct, zero;
  logic [5:0] op;

  // output
  logic pcen, memwrite, irwrite, regwrite, alusrca, iord, memtoreg, regdst;
  logic [1:0] alusrcb, pcsrc, [2:0] alucontrol;

  // change first bracket numbers to reflect size of line
  // change second bracket numbers to reflect the number of lines
  logic [12:0] testvector[59:0];
  integer num; // used for iterating through testvector
  controller dut(clk, reset, op, funct, zero, pcen, memwrite, irwrite,
    regwrite, alusrca, iord, memtoreg, regdst, alusrcb, pcsrc, alucontrol);

  initial begin
    reset <= 1; # 22; reset <= 0;
    $readmemh("./controller.tv", testvector);
  end

  always begin
    clk <= 1; # 5; clk <= 0; # 5;
  end

  for (num = 0; num<60; num++) begin
    {op, funct, zero} = testvector[num];#10;
    $display("testing op=%b funct=%b zero=%b", op, funct, zero);
  end

endmodule
