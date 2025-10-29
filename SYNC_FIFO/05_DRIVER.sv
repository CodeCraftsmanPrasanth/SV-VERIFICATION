class driver;
  mailbox g2d;
  transaction trans;
  virtual interf vinte;
  
  function new(virtual interf vinte,mailbox g2d);
    this.g2d=g2d;
    this.vinte=vinte;
  endfunction
  
  task main();
    repeat(19) begin
      trans = new();
      g2d.get(trans);
      @(posedge vinte.clk) begin
        vinte.wr_en = trans.wr_en;
        vinte.rd_en = trans.rd_en;
        vinte.data_in = trans.data_in;
        $display("DRI time=%0t,rst=%0b,wr_en=%0b,rd_en=%0b,data_in=%0d,data_out=%0d,full=%0d,empty=%0d", $time,vinte.rst,trans.wr_en,trans.rd_en,trans.data_in,trans.data_out,trans.full,trans.empty);
      end
    end
  endtask
endclass
      
        
