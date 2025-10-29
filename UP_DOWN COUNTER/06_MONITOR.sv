class monitor;
  mailbox m2s;
  transaction trans;
  virtual interf vinte;
  
  function new(virtual interf vinte,mailbox m2s);
    this.m2s=m2s;
    this.vinte=vinte;
  endfunction
  
  task main();
    repeat(8) begin
      trans = new();
      @(posedge vinte.clk) begin
        trans.ud = vinte.ud;
        #1
        trans.data_out = vinte.data_out;
        m2s.put(trans);
        vinte.display("MON");
      end
    end
  endtask
endclass
        
        
        
