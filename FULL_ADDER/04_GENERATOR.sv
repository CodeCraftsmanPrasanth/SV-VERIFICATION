class generator;
  transaction trans;
  mailbox gen_mail;
  
  function new(mailbox gen_mail);
    
    this.gen_mail=gen_mail;
  endfunction
  
  task main();
    
    repeat(2)
      begin
        trans=new();
        
        trans.randomize();
        $display("Memory Created");
        $display($time);
        
        trans.display("start randomize value ");
        gen_mail.put(trans);
        $display("value Assigned");
        #3;
        
      end
  endtask
endclass
