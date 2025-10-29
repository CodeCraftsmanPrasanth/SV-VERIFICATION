class driver;
  
  mailbox g2d;
  virtual interf vinte;
  
  function new(virtual interf vinte,mailbox g2d);
    this.vinte=vinte;
    this.g2d=g2d;
  endfunction
  
  task main();
    transaction trans;
    repeat(6) begin
      g2d.get(trans);
      @(posedge vinte.clk) begin
        vinte.d<=trans.d;
        $display("------------------DRIVER CLASS DATA-------------");
        $display("%0t,clk=%0b,rst=%0b,d=%0b,q=%0b",$time,vinte.clk,vinte.rst,trans.d,trans.q);
      end
    end
    endtask
endclass
      
