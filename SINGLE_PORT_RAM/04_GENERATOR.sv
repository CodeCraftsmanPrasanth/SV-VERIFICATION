class generator;
  mailbox g2d;
  virtual interf vinte;
  transaction trans;
  event g1;
  
  function new(virtual interf vinte,mailbox g2d);
    this.g2d=g2d;
    this.vinte=vinte;
  endfunction
  
  task main();
    repeat (20) begin
      trans=new();
      void'(trans.randomize());
      g2d.put(trans);
      $display("GEN time=%0t,rst=%0b,en=%0b,addr=%0d,data_in=%0d,data_out=%0d",$time,trans.rst,trans.en,trans.addr,trans.data_in,trans.data_out);
      @g1;
    end
  endtask
endclass
