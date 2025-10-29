class monitor;
  mailbox m2s;
  transaction trans;
  virtual interf vinte;
  
  function new(virtual interf vinte,mailbox m2s);
    this.m2s=m2s;
    this.vinte=vinte;
  endfunction
  
  task main();
    repeat(19) begin
      trans = new();
      @(posedge vinte.clk) begin
        trans.wr_en = vinte.wr_en;
        trans.rd_en = vinte.rd_en;
        trans.data_in = vinte.data_in;
        #1
        trans.data_out = vinte.data_out;
        trans.full = vinte.full;
        trans.empty = vinte.empty;
        m2s.put(trans);
        $display("MON time=%0t,rst=%0b,wr_en=%0b,rd_en=%0b,data_in=%0d,data_out=%0d,full=%0d,empty=%0d", $time,trans.rst,trans.wr_en,trans.rd_en,trans.data_in,trans.data_out,trans.full,trans.empty);
      end
    end
  endtask
endclass
        
        
        
