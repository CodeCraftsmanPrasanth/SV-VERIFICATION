class scoreboard;
  
  mailbox gen2_mail;
  
  function new(mailbox gen2_mail);
    this.gen2_mail=gen2_mail;
  endfunction
  
  task main();
    
    transaction trans;
    repeat(2)
      begin
        gen2_mail.get(trans);
        
        trans.display("scoreboard signal");
        $display("Expected output = Original output");
        
        if ((trans.a^trans.b^trans.cin)==trans.sum && ((trans.a & trans.b )|(trans.b & trans.cin)|(trans.cin & trans.a)) == trans.carry)
           $display("correct");
           else
             $display("Incorrect");
           end
           endtask
           endclass
