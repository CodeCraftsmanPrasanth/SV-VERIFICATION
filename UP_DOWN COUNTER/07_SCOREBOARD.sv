class scoreboard;
  mailbox m2s;
  transaction trans;
  virtual interf vinte;
  bit [3:0] count;
  event g1;
  
  function new(virtual interf vinte,mailbox m2s);
    this.m2s=m2s;
    this.vinte=vinte;
  endfunction
  
  task main();
    repeat(8) begin
      trans = new();
      m2s.get(trans);
      vinte.display("SCO");
      if (vinte.rst) 
        count=0;
      else if (trans.ud) 
        count++;
      else  
        count--;
      if (trans.data_out==count) 
        $display("pass = %d",count);
      else $display("fail = %d",count);
      $display("--------------------------------------");
      ->g1;
    end
  endtask
  
endclass
