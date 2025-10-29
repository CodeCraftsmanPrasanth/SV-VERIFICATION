`include "transaction.sv"
class generator;
  mailbox g2d;
  transaction trans;
  virtual interf vinte;
  event g1;
    
  function new(virtual interf vinte,mailbox g2d);
    this.g2d=g2d;
    this.vinte=vinte;
  endfunction
  
  task main();
    repeat (8) begin
      trans = new();
      void'(trans.randomize());
      g2d.put(trans);
      trans.display("GEN");
      
      @g1;
    end
  endtask
endclass
