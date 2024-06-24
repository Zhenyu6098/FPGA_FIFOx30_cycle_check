`timescale 1ns/1ps
module generate_FIFO_tb();

reg         clk           ;
reg         rst_n         ;
reg [29:0]  fifo_wrreq    ;
reg [959:0] fifo_data_in  ;

wire        data_valid    ;
wire [63:0] up_data       ;  

initial begin
clk   = 0;
rst_n = 0;
#200
rst_n = 1;
end

always #10 clk = ~clk;
reg [5:0] cnt[1:30];

genvar t;
generate for(t=1;t<=30;t=t+1)
begin:t4

always@(posedge clk or negedge rst_n)
    if(~rst_n)
        cnt[t] <= 0;
    else if(cnt[t]==t*2)
        cnt[t] <= 0;
    else 
        cnt[t] <= cnt[t] + t;

always@(posedge clk or negedge rst_n)
    if(~rst_n)begin
            fifo_data_in[(31+t*32):t*32] <= 0;
            fifo_wrreq[t] <= 0;end
    else if(cnt[t]==t*2)begin
            fifo_data_in[(31+t*32):t*32] <= {$random}%5000;
            fifo_wrreq[t] <= 1;end
    else begin
            fifo_data_in[(31+t*32):t*32] <= 0;
            fifo_wrreq[t] <= 0;end
end 
endgenerate


FIFO_30_cycle_check FIFO_30_cycle_check_1(
    .   clk          (clk         ) ,
    .   rst_n        (rst_n       ) ,
    .   fifo_wrreq   (fifo_wrreq  ) ,
    .   fifo_data_in (fifo_data_in) ,

    .   data_valid   (data_valid  ) ,
    .   up_data      (up_data     )   
);

endmodule