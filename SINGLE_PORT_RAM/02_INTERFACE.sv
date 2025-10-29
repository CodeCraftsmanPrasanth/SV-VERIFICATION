interface interf #(parameter data_width =5, data_addr=8);
  logic clk;
  logic rst;
  logic [$clog2(data_addr)-1:0]addr;
  logic en;
  logic [data_width-1:0] data_in;
  logic [data_width-1:0] data_out;
endinterface
