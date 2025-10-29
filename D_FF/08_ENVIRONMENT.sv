`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator gen;
  driver dri;
  monitor mon;
  scoreboard sco;
  
  mailbox g2d;
  mailbox m2s;
  
  event g1;
  
  virtual interf vinte;
  
  function new(virtual interf vinte);
    
    this.vinte = vinte;
    
    g2d=new();
    m2s=new();
    
    gen=new(vinte,g2d);
 	dri=new(vinte,g2d);
    mon=new(vinte,m2s);
    sco=new(vinte,m2s);
    
    gen.g1=this.g1;
    sco.g1=this.g1;
  endfunction
  
  task run();
    fork
      gen.main();
      dri.main();
      mon.main();
      sco.main();
    join
  endtask
endclass
