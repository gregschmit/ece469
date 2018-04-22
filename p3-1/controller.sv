module controller(input logic clk, reset,
            input logic [5:0] op, funct,
            input logic zero,
            output logic pcen, memwrite, irwrite, regwrite,
            output logic alusrca, iord, memtoreg, regdst,
            output logic [1:0] alusrcb, pcsrc,
            output logic [2:0] alucontrol);
 logic [1:0] aluop;
 logic branch, pcwrite;

 // Main Decoder and ALU Decoder subunits.
 maindec md(clk, reset, op,
            pcwrite, memwrite, irwrite, regwrite,
            alusrca, branch, iord, memtoreg, regdst,
            alusrcb, pcsrc, aluop);
            aludec ad(funct, aluop, alucontrol);

 // ADD CODE HERE
 // Add combinational logic (i.e. an assign statement)
 // to produce the PCEn signal (pcen) from the branch,
 // zero, and pcwrite signals
endmodule

