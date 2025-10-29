`include "TEST.sv"
`include "INTERFACE.sv"
module testbench;

  interf inte();
  test tesst(inte);
  initial begin
    inte.clk=0;
    forever #5 inte.clk =~inte.clk;
  end
  initial begin
    inte.rst=1;
    #4 inte.rst=0;
  end
  SYNCHRONOUS_FIFO #(.FIFO_Depth(inte.FIFO_Depth),.DATA_WIDTH(inte.DATA_WIDTH)) uut( .clk(inte.clk), .rst(inte.rst),.wr_en(inte.wr_en),.rd_en(inte.rd_en),.data_in(inte.data_in),.data_out(inte.data_out),.full(inte.full), .empty(inte.empty));

  
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars;
    #10000;
    $finish();
  end
  
endmodule
