// Code your design here
module SPRAM(interf inte);
  reg [inte.data_width-1:0] mem [0:inte.data_addr-1];
  always @(posedge inte.clk or posedge inte.rst) begin
    if (inte.rst) begin
      for (int a=0; a<inte.data_addr;a++) begin
        mem[a]<=0;
      end
      inte.data_out<=0;
    end
    
    else if (inte.en) begin
      mem[inte.addr] <= inte.data_in;
    end
    else inte.data_out <= mem[inte.addr];
  end
endmodule
