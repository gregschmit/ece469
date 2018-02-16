module shiftL (input logic [7:0], a
               output logic [7:0], b);
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
      
    
    
    
