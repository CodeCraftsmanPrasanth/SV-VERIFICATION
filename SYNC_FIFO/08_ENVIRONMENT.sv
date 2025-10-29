`include "GENERATOR.sv"
`include "DRIVER.sv"
`include "MONITOR.sv"
`include "SCOREBOARD.sv"


class environment;
  virtual interf vinte;
  event trigger;
  
  generator gen;
  driver dri;
  monitor mon;
  scoreboard sco;
  
  mailbox g2d;
  mailbox m2s;
  
  function new(virtual interf vinte);
    g2d=new();
    m2s=new();
    this.vinte=vinte;
    
    gen=new(vinte,g2d);
    dri=new(vinte,g2d);
    mon=new(vinte,g2d);
    sco=new(vinte,g2d);
    
    gen.trigger=this.trigger;
    sco.trigger=this.trigger;
  endfunction
  
  task main();
    fork
      gen.main();
      dri.main();
      mon.main();
      sco.main();
    join
  endtask
endclass

    
  
