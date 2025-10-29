class generator;
  transaction trans;
  mailbox g2d;
  virtual interf vinte;
  event g1;
  
  function new(virtual interf vinte, mailbox g2d);
    this.vinte=vinte;
    this.g2d=g2d;
  endfunction
  
  task main();
    trans=new();
    repeat (6) begin
      if (trans.randomize()) begin
        $display("------------------GENERATE-------------");
        $display("TIME=%0t randomize is done in generator,clk=%0b,rst=%0b, d=%0b,q=%0b",$time,vinte.clk,vinte.rst, trans.d,trans.q);
      end
      
      g2d.put(trans);
      @(g1);
    end
  endtask
endclass
      
