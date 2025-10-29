module full_adder(
  input a,b,cin,
  output sum,carry);
  assign {carry,sum}=a+b+cin;  
endmodule
