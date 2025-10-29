class monitor;
   mailbox m2s;
  transaction trans;
  virtual interf vinte;
  
  function new(virtual interf vinte,mailbox m2s);
    this.m2s=m2s;
    this.vinte=vinte;
  endfunction
  
  task main();
    repeat(20) begin
      trans = new();
      @(posedge vinte.clk) begin
        trans.en = vinte.en;
        trans.addr = vinte.addr;
        trans.data_in = vinte.data_in;
        #1
        trans.data_out = vinte.data_out;
        m2s.put(trans);
        $display("MON time=%0t,rst=%0b,en=%0b,addr=%0d,data_in=%0d,data_out=%0d",$time,vinte.rst,trans.en,trans.addr,trans.data_in,vinte.data_out);
      end
    end
  endtask
endclass
