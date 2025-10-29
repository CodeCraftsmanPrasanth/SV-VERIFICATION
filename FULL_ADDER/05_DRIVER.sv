class driver;
  virtual interf vir;
  
  mailbox gen_maild;
  transaction trans;
  
  function new(virtual interf vir,mailbox gen_maild);
    this.vir=vir;
    this.gen_maild=gen_maild;
  endfunction
  
  task main;
    repeat(2)begin
      trans=new();
      gen_maild.get(trans);
      vir.a=trans.a;
      vir.b=trans.b;
      vir.cin=trans.cin;
      
      trans.display("driver class");
      $display("Value passed to interface");
      #2;
    end
  endtask
endclass
