
module imem(input logic [7:0] a,
            output logic [31:0] rd);
  logic [10:0] RAM[256:0];
  initial
    $readmemb("./prog1", RAM);

  assign rd = RAM[a]; // word aligned
endmodule

module top(input logic clk, reset,
           output logic halt);

  logic [7:0] pc;
  logic [10:0] instr;
  logic reg_wr, add, lfsr_seed, lfsr_tap, lfsr_lmem, lfsr_run, mem_wr;
  prpg prpg(clk, reset, pc, instr, reg_wr, add, lfsr_seed, lfsr_tap, lfsr_lmem, lfsr_run, mem_wr, halt);
  imem imem(pc, instr);
endmodule

module prpg_testbench();
  logic clk;
  logic reset;
  logic halt;

  // instantiate device to be tested
  top dut (clk, reset, halt);

  // initialize test
  initial begin
    reset <= 1; # 22; reset <= 0;
  end

  // generate clock to sequence tests
  always begin
    clk <= 1; # 5; clk <= 0; # 5;
  end

  // check results
  always @(negedge clk) begin
    if (halt) begin
      $display("Simulation halted");
      $stop;
    end
  end
endmodule
