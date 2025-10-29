class scoreboard;
  mailbox m2s;
  transaction trans;
  virtual interf vinte;
  localparam int WIDTH = 5;
  localparam int ADDR = 9;
  int count;
  bit full,empty;
  bit [WIDTH-1:0] temp[$] ;
  bit [WIDTH-1:0] ch ;
  event trigger;
  
  function new(virtual interf vinte,mailbox m2s);
    this.m2s=m2s;
    this.vinte=vinte;
  endfunction
  
  task main();
    repeat(19) begin
      trans = new();
      m2s.get(trans);
      $display("SCO time=%0t,rst=%0b,wr_en=%0b,rd_en=%0b,data_in=%0d,data_out=%0d,full=%0d,empty=%0d", $time,trans.rst,trans.wr_en,trans.rd_en,trans.data_in,trans.data_out,trans.full,trans.empty);
      if(trans.wr_en && !full) begin
        temp.push_back(trans.data_in);
        count = count + 1;
      end
      if( trans.rd_en && !empty ) begin
        if (temp.size() > 0) begin
    		ch = temp.pop_front();
        	count = count - 1 ;
        end
  		else begin
    		ch = 0;
        end
        if( trans.data_out  == ch) begin   
          $display("*****************PASS************************");
        end
        else begin
              $display("****************FAIL*************************");
               
        end
      end      
      full = (count == 8);
      empty = (count == 0);
       
      ->trigger; 
    end
  endtask
  
endclass
