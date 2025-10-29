`timescale 1ns / 1ps
module counter(interf inte);
  always @(posedge inte.clk or posedge inte.rst) begin
    if (inte.rst) begin 
      inte.data_out<=0;
    end
    else if (inte.ud) begin
      inte.data_out<=inte.data_out+1;
    end
    else inte.data_out<=inte.data_out-1;
    
  end
endmodule
