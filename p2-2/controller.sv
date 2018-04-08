
module controller(input logic [2:0] op,
                  output logic wr_e, wr_tap, data_src_lfs, mem_to_reg,
                  output logic lfs_seed_src_mem);
  // change theses:
  maindec md(op, memtoreg, memwrite, branch, zneg, alusrc, regdst, regwrite, jump,
    aluop);
  aludec ad(funct, aluop, alucontrol);

  assign pcsrc = branch & zero;
endmodule
