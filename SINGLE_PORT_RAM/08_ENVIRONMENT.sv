`include "transaction.sv"
`include "generate.sv"
`include "driver.sv"
`include "score.sv"
`include "monitor.sv"

class environment;
  virtual interf vinte;
  
  generator gen;
  driver dri;
  monitor mon;
  score sco;
  
  mailbox g2d;
  mailbox m2s;
  
  event g1;
  
  function new(virtual interf vinte);
    g2d=new();
    m2s=new();
    this.vinte=vinte;
    
    gen=new(vinte,g2d);
    dri=new(vinte,g2d);
    mon=new(vinte,m2s);
    sco=new(vinte,m2s);
    
    gen.g1=this.g1;
    sco.g1=this.g1;
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
    
