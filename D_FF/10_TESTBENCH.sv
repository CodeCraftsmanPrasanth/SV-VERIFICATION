`include "interface.sv"
`include "test.sv"

module testbench;
  logic clk;
  logic rst;
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1;#2
    rst=0;
  end
  interf vinte(clk,rst);
  test tesst(vinte);
  D_FF dut(.clk(vinte.clk),.rst(vinte.rst),.d(vinte.d),.q(vinte.q));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #1000;
    $finish;
  end
endmodule
  
