`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator gen;
  driver dr;
  monitor mon;
  scoreboard sco;
  
  mailbox gen_mail;
  mailbox gen2_mail;
  
 virtual interf vir;
  function new (virtual interf vir);
    this.vir=vir;
    
    gen_mail=new();
    gen2_mail=new();
    gen =new(gen_mail);
    dr=new(vir,gen_mail);
    mon=new(vir,gen2_mail);
    sco=new(gen2_mail);
    
  endfunction
  
  task testrun();
    fork
      gen.main();
      dr.main();
      mon.main();
      sco.main();
    join
  endtask
endclass
