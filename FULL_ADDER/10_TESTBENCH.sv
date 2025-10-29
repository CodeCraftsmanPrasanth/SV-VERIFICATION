`include "test.sv"
`include "interface.sv"

module testbench;
   interf intff(); 
  test tff(intff); 
  	
  full_adder fa(.a(intff.a),.b(intff.b),.cin(intff.cin),.sum(intff.sum),.carry(intff.carry));
  initial begin
    $dumpfile("dumpwave.vcd");
    $dumpvars;
    #1000
    $finish;
  end
endmodule
