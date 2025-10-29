class driver;
  mailbox g2d;
  transaction trans;
  virtual interf vinte;
  
  function new(virtual interf vinte,mailbox g2d);
    this.g2d=g2d;
    this.vinte=vinte;
  endfunction
  
  task main();
    repeat(8) begin
      trans = new();
      g2d.get(trans);
      @(posedge vinte.clk) begin
        vinte.ud = trans.ud;
        trans.display("DRI");
        
      end
    end
  endtask
endclass
      
        
