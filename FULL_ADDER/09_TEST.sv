`include "environment.sv"
program test(interf intff);
  environment env;
  
  initial begin
    env=new(intff);
    env.testrun();
  end
endprogram
