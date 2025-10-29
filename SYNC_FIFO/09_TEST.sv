`include "ENVIRONMENT.sv"

program test(interf inte);
  environment env;
  initial begin
    env=new(inte);
    env.main();
  end
endprogram
