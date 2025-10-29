class monitor;
  
  mailbox m2s;
  virtual interf vinte;
  
  function new(virtual interf vinte,mailbox m2s);
    this.vinte=vinte;
    this.m2s=m2s;
  endfunction
  
  task main();
    transaction trans;
    trans=new();
    
    repeat(6) begin
      @(posedge vinte.cjavascript:void(0)lk) begin
        trans.d=vinte.d;
        #1
        trans.q=vinte.q;
        m2s.put(trans);
        $display("------------------MONITOR CLASS DATA-------------");
        $display("%0t,clk=%0b,rst=%0b,d=%0b,q=%0b",$time,vinte.clk,vinte.rst,trans.d,trans.q);
      end
    end
    endtask
endclass
