`include "TRANSACTION.sv"
class generator;
  mailbox g2d;
  transaction trans;
  virtual interf vinte;
  event trigger;
  int count =0;
  
  function new(virtual interf vinte,mailbox g2d);
    this.g2d=g2d;
    this.vinte=vinte;
  endfunction
  
  task main();
    repeat (19) begin
      trans = new();
      trans.value(count);
      void'(trans.randomize());
      g2d.put(trans);
      $display("---------------------------------");
      $display("GEN time=%0t,rst=%0b,wr_en=%0b,rd_en=%0b,data_in=%0d,data_out=%0d,full=%0d,empty=%0d", $time,vinte.rst,trans.wr_en,trans.rd_en,trans.data_in,trans.data_out,trans.full,trans.empty);
      @trigger;
      count++;
    end
  endtask
endclass

