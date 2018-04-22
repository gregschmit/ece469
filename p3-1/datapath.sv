module datapath(input logic clk, reset,
                input logic pcen, irwrite, regwrite,
                input logic alusrca, iord, memtoreg, regdst,
                input logic [1:0] alusrcb, pcsrc,
                input logic [2:0] alucontrol,
                output logic [5:0] op, funct,
                output logic zero,
                output logic [31:0] adr, writedata,
                input logic [31:0] readdata);

  // Below are the internal signals of the datapath module.

  logic [4:0] writereg;
  logic [31:0] pcnext, pc;
  logic [31:0] instr, data, srca, srcb;
  logic [31:0] a;
  logic [31:0] aluresult, aluout;
  logic [31:0] signimm; // the sign-extended immediate
  logic [31:0] signimmsh; // the sign-extended immediate shifted left by 2
  logic [31:0] wd3, rd1, rd2;

  // op and funct fields to controller
  assign op = instr[31:26];
  assign funct = instr[5:0];

  // Your datapath hardware goes below. Instantiate each of the submodules
  // that you need. Remember that alu's, mux's and various other
  // versions of parameterizable modules are available in textbook 7.6

  // Here, parameterizable 3:1 and 4:1 muxes are provided below for your use.

  // Remember to give your instantiated modules applicable names
  // such as pcreg (PC register), wdmux (Write Data Mux), etc.
  // so it's easier to understand.

  // pc
  always_ff @(posedge clk, posedge reset) begin
    if (reset) pc <= 0;
    else pc <= pcnext;
  end



  // datapath
endmodule
