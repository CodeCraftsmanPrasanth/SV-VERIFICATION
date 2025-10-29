
`include "test.sv"
`include "interface.sv"
module testbench;
				
  interf inte();
  test tesst(inte);
  initial begin
    inte.clk=0;
    forever #5 inte.clk =~inte.clk;
  end
  initial begin
    inte.rst=1;
    #7 inte.rst=0;
  end

  
  counter uut(inte);
	  
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars;
    #10000;
    $finish();
  end
  
endmodule
