class transaction #(parameter FIFO_Depth = 12, DATA_WIDTH=5);
  bit rst;
  bit wr_en;
  bit rd_en;
  rand bit [DATA_WIDTH-1:0] data_in;
  bit [DATA_WIDTH-1:0] data_out;
  bit full;
  bit empty;
  
  function void value(int count);
    if (count < FIFO_Depth) begin
      wr_en = 1;
      rd_en =0;
    end
    else begin
      wr_en = 0;
      rd_en =1;
    end
  endfunction
endclass
