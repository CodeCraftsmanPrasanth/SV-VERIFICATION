interface interf #(parameter DATA_BIT=4);
  logic ud;
  logic clk;
  logic rst;
  logic [DATA_BIT-1:0] data_out;
  
  function display(string name);
    $display("%s time=%0t,rst=%0b,ud=%0b,data_out=%0d",name,$time,rst,ud,data_out);
  endfunction
  
endinterface
