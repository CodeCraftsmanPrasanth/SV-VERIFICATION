// Code your design here
`timescale 1ns / 1ps
module SYNCHRONOUS_FIFO#(parameter FIFO_Depth = 12, DATA_WIDTH=5 )
    (input clk, rst,wr_en,rd_en,
     input [DATA_WIDTH-1:0] data_in,
     output reg [DATA_WIDTH-1:0] data_out,
     output full, empty);
     
     localparam addrwidth=$clog2(FIFO_Depth);
     reg [DATA_WIDTH-1:0] FIFO [FIFO_Depth-1:0];
     reg [addrwidth:0] read_pointer;
     reg [addrwidth:0] write_pointer;
     
     always @(posedge clk or posedge rst) begin
        if (rst) begin
            write_pointer<=0;          
        end
        else begin
            if ( wr_en & ~full ) begin
                FIFO[write_pointer[addrwidth-1:0]]<=data_in;
              if (write_pointer[addrwidth-1:0] == FIFO_Depth-2) begin
                    if (write_pointer[addrwidth]==1) begin
                       // write_pointer[addrwidth]<=1'b0;
                        write_pointer[addrwidth:0]<=0;
                    end
                    else begin
                        write_pointer[addrwidth-1:0]<=0;
                        write_pointer[addrwidth]<=1'b1;
                    end
                end
                else  write_pointer<=write_pointer+1;
            end   
        end
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            read_pointer<=0;
        end
        else begin
            if (rd_en & ~empty ) begin
              data_out<=FIFO[read_pointer[addrwidth-1:0]];
              if (read_pointer[addrwidth-1:0] == FIFO_Depth-1) begin
                if (read_pointer[addrwidth]==1) begin
                  //read_pointer[addrwidth]<=1'b0;
                  read_pointer[addrwidth:0]<=0;
                end
                else begin
                  read_pointer[addrwidth-1:0]<=0;
                  read_pointer[addrwidth]<=1'b1;
                end
              end
              else  read_pointer<=read_pointer+1;
            end            
        end
    end
  
    assign  full= ((~(write_pointer[addrwidth])==read_pointer[addrwidth]) & (write_pointer[addrwidth-1:0]==read_pointer[addrwidth-1:0]));
    assign empty=(read_pointer==write_pointer);
endmodule
