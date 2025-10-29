class driver;
  mailbox g2d;
  transaction trans;
  virtual interf vinte;
  
  function new(virtual interf vinte,mailbox g2d);
    this.g2d=g2d;
    this.vinte=vinte;
  endfunction
  
  task main();
    repeat(20) begin
      trans = new();
      g2d.get(trans);
      @(posedge vinte.clk) begin
        vinte.en = trans.en;
        vinte.addr = trans.addr;
        vinte.data_in = trans.data_in;
        $display("DRI time=%0t,rst=%0b,en=%0b,addr=%0d,data_in=%0d,data_out=%0d",$time,vinte.rst,vinte.en,vinte.addr,vinte.data_in,vinte.data_out);
      end
    end
  endtask
endclass
      
