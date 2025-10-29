class monitor;
  virtual interf vir;
  mailbox gen2_mail;
  transaction trans;
  
  function new( virtual interf vir,mailbox gen2_mail);
    this.vir=vir;
    this.gen2_mail=gen2_mail;
  endfunction
  
  task main();
    repeat(2)
      
      begin
        #2;
        
        trans=new();
        
        trans.a=vir.a;
        trans.b=vir.b;
        trans.cin=vir.cin;
        trans.sum=vir.sum;
        trans.carry=vir.carry;
        
        gen2_mail.put(trans);
        
        trans.display("monitor block");
        $display("Full adder opertion");
        #1;
        end
  endtask
endclass
