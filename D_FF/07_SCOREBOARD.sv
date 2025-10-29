class scoreboard;
  
  mailbox m2s;
  virtual interf vinte;
  event g1;
  
  function new(virtual interf vinte,mailbox m2s);
    this.vinte=vinte;
    this.m2s=m2s;
  endfunction
  
  task main();
    repeat (6) begin
      transaction trans;
      m2s.get(trans);
      $display("------------------SCOREBOARD CLASS DATA-------------");
      $display("time =%0t,clk=%0b,rst=%0b,d=%0b,q=%0b",$time,vinte.clk,vinte.rst,trans.d,trans.q);
      if(((vinte.rst == 0)&&(trans.q == trans.d))||((vinte.rst  == 1)&&(trans.q == 0)))
        	$display("		PASS		");
      else 
        	$display("		FAIL		");
      ->g1;
      $display("-----------------------------------------------		");
      end
    
  endtask
endclass
