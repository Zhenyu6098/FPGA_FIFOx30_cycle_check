`timescale 1ns/1ps
module lunxun30_tb();

reg        clk       ;
reg        rst_n     ;

reg[30:1]  wrreq     ;
reg[959:0] data_in   ;

wire         data_valid ;
wire [63:0]  up_data    ;
 
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
begin:t30

always@(posedge clk or negedge rst_n)
    if(~rst_n)
        cnt[t] <= 0;
    else if(cnt[t]==t*3)
        cnt[t] <= 0;
    else 
        cnt[t] <= cnt[t] + 1;

always@(posedge clk or negedge rst_n)
    if(~rst_n)begin
            data_in[(t*32-1):(t-1)*32] <= 0;
            wrreq[t] <= 0;end
            
            
    else if(cnt[t]==t*3)begin
            data_in[(t*32-1):(t-1)*32] <= {$random}%5000;
            wrreq[t] <= 1;end
    else begin
            data_in[(t*32-1):(t-1)*32] <= 0;
            wrreq[t] <= 0;end
end 
endgenerate

lunxun30 lunxun30_1(
    .   clk        (clk        ) ,
    .   rst_n      (rst_n      ) ,
    // .   clk_wr     (clk_wr     ) ,
    .   wrreq      (wrreq      ) ,
    .   data_in    (data_in    ) ,
                            
    .   data_valid (data_valid ) ,
    .   up_data    (up_data    )
); 

endmodule