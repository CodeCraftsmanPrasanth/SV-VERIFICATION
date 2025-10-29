`include "environment.sv"

program test(interf vinte);
  environment env;
  initial begin
    env=new(vinte);
    env.run();
  end
endprogram
