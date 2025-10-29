class transaction;
  rand bit ud;
  bit rst;
  bit [3:0] data_out;
  
  function display(string name);
    $display("TRANS %s time=%0t,rst=%0b,ud=%0b,data_out=%0d",name,$time,rst,ud,data_out);
  endfunction
endclass
