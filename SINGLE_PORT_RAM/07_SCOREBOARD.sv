class score;
  mailbox m2s;
  transaction trans;
  virtual interf vinte;
  event g1;
  bit[5-1:0]mem[0:8-1];
    
  function new(virtual interf vinte,mailbox m2s);
    this.m2s=m2s;
    this.vinte=vinte;
  endfunction
  
  task main();
    trans=new();
    
    foreach(mem[i])
      mem[i]=0;
    
    repeat(20)
      begin
        m2s.get(trans);
        $display("SCO time=%0t,rst=%0b,en=%0b,addr=%0d,data_in=%0d,data_out=%0d",$time,vinte.rst,trans.en,trans.addr,trans.data_in,trans.data_out);
        if(trans.en)begin
          mem[trans.addr]=trans.data_in;
        end
        else 
          begin
            if(trans.data_out==mem[trans.addr])begin
              $display("passed = %d",mem[trans.addr]);
            end
            else begin
              $display("Incorrect = %d",mem[trans.addr]);
            end
          end
        $display("------------------------------------------------");
        ->g1;
      end
  endtask
endclass
