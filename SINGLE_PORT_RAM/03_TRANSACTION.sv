class transaction;
  parameter data_width =5, data_addr=8;
  bit clk;
  bit rst;
  rand bit [$clog2(data_addr)-1:0]addr;
  rand bit en;
  rand bit [data_width-1:0] data_in;
  bit [data_width-1:0] data_out;
endclass
