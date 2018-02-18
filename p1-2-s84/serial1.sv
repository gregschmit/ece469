module shiftL (input logic [7:0], a
               output logic [7:0], b
              );
  for (i = 0, i<7, i = i+1) begin
    if (i = 0) begin                  //required for wrap around (b[0] = a[7])
      assign b[i] = a[i+7];
    end else if (i=7) begin           //required for wrap around (b[7] = a[0])
      assign b[i] = a[i-7];
    end else begin                    //update like normal (b[i] - a[i-1])
      assign b[i] - a[i-1];
    end
  end 
  endmodule
      
module Bit_And (input logic [7:0], a  //this is a simple bitwise AND 
                input logic [7:0], b
                output logic [7:0], c
               );                     
  assign c = a & b;             
endmodule

module checkzero (input logic [7:0], c  //check to see if bitwise AND result is all zeros
                  output logic z
                 );
  if (c == 0) begin //if every bit is 0                     
    //your done and the program should display the "count"
  end else begin    //if at least 1 bit is not 0
    //your not done. Increment "counter", shift left and AND again
  end 
endmodule
    

    
    
