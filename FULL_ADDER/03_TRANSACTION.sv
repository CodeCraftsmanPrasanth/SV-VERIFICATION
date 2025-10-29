class transaction;
  rand bit a;
  rand bit b;
  rand bit cin;
  
  bit sum;
  bit carry;

  function void display (string name);
    $display("%s",name);
    $display($time,"  a=%b,b=%b, cin=%b, sum=%b, carry=%b",a,b,cin,sum,carry);
  endfunction
endclass
