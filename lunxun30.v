module lunxun30(
    input wire             clk          ,
    input wire             rst_n        ,
    // input wire [30:1]      clk_wr       ,
    input wire [30:1]      wrreq        ,
    input wire [959:0]     data_in      ,
    
    output reg             data_valid   ,
    output reg [63:0]      up_data
);

// wire  [31:0] data    [1:30];
wire         rdreq   [1:30];

wire  [63:0] q_out   [1:30];
wire  [11:0] rdusedw [1:30];


genvar i;
generate 
for(i=1;i<=30;i=i+1)begin:FIFO30
    fifo_32in_64out	fifo (
	.rdclk   ( clk        ),
	.wrclk   ( clk/*_wr[i]*/  ),
	.rdreq   ( rdreq[i]   ),
	.wrreq   ( wrreq[i]   ),
	.data    ( data_in[(32*i-1):(32*i-32)]    ),
    
	.q       ( q_out[i]   ),
	.rdusedw ( rdusedw[i] )
);
end
endgenerate


wire [31:0]tongdao[1:30];
generate 
for(i=1;i<=30;i=i+1) begin:tongdao_gen
    assign tongdao[i]= i;
end 
endgenerate

reg         start          [1:30];
wire        over           [1:30];
wire        data_valid_reg [1:30];
wire [63:0] up_data_reg    [1:30];


generate 
for(i=1;i<=30;i=i+1)begin:ck30
check_out#(
    .   YUZHI(128),//128;
    .   HEAD (32'hadf90c00) //32'hadf90c00;
)
check_out_1(
    .     clk          (clk               ) , //       
    .     rst_n        (rst_n             ) , //       
    .     rdusedw      (rdusedw[i]        ) , // [12:0]
    .     fifo_out     (q_out[i]          ) , // [63:0]
    .     tongdao      (tongdao[i]        ) , // [6:0] 
    .     start        (start[i]          ) , //       
  
    .     over         (over[i]           ) , //          
    .     rdreq        (rdreq[i]          ) , //       
    .     data_valid   (data_valid_reg[i] ) , //       
    .     up_data      (up_data_reg[i]    )   // [63:0]
);
end
endgenerate



reg [6:0]t;
always@(posedge clk or negedge rst_n)
    if(~rst_n)
        t <= 1;
    else if((t==30)&&(over[t]==1))
        t <= 1;
    else if(over[t]==1)
        t <= t +1;



always@(*)
    if(~rst_n)
    begin
        start[ 1] <= 1;
        start[ 2] <= 0;
        start[ 3] <= 0;
        start[ 4] <= 0;
        start[ 5] <= 0;
        start[ 6] <= 0;
        start[ 7] <= 0;
        start[ 8] <= 0;
        start[ 9] <= 0;
        start[10] <= 0;
        start[11] <= 0;
        start[12] <= 0;
        start[13] <= 0;
        start[14] <= 0;
        start[15] <= 0;
        start[16] <= 0;
        start[17] <= 0;
        start[18] <= 0;
        start[19] <= 0;
        start[20] <= 0;
        start[21] <= 0;
        start[22] <= 0;
        start[23] <= 0;
        start[24] <= 0;
        start[25] <= 0;
        start[26] <= 0;
        start[27] <= 0;
        start[28] <= 0;
        start[29] <= 0;
        start[30] <= 0;end
    else if((t>=1&&t<=29)&&(over[t]==1))begin
         start[t+1] <= 1;
         start[t] <= 0;end
    else if((t==30)&&(over[t]==1))begin
         start[1] <= 1;
         start[30] <= 0;end    
        

always@(*)
    case(t)
        1: begin up_data <= up_data_reg[ 1];  data_valid <= data_valid_reg[ 1]; end
        2: begin up_data <= up_data_reg[ 2];  data_valid <= data_valid_reg[ 2]; end
        3: begin up_data <= up_data_reg[ 3];  data_valid <= data_valid_reg[ 3]; end
        4: begin up_data <= up_data_reg[ 4];  data_valid <= data_valid_reg[ 4]; end
        5: begin up_data <= up_data_reg[ 5];  data_valid <= data_valid_reg[ 5]; end
        6: begin up_data <= up_data_reg[ 6];  data_valid <= data_valid_reg[ 6]; end
        7: begin up_data <= up_data_reg[ 7];  data_valid <= data_valid_reg[ 7]; end
        8: begin up_data <= up_data_reg[ 8];  data_valid <= data_valid_reg[ 8]; end
        9: begin up_data <= up_data_reg[ 9];  data_valid <= data_valid_reg[ 9]; end
       10: begin up_data <= up_data_reg[10];  data_valid <= data_valid_reg[10]; end
       11: begin up_data <= up_data_reg[11];  data_valid <= data_valid_reg[11]; end
       12: begin up_data <= up_data_reg[12];  data_valid <= data_valid_reg[12]; end
       13: begin up_data <= up_data_reg[13];  data_valid <= data_valid_reg[13]; end
       14: begin up_data <= up_data_reg[14];  data_valid <= data_valid_reg[14]; end
       15: begin up_data <= up_data_reg[15];  data_valid <= data_valid_reg[15]; end
       16: begin up_data <= up_data_reg[16];  data_valid <= data_valid_reg[16]; end
       17: begin up_data <= up_data_reg[17];  data_valid <= data_valid_reg[17]; end
       18: begin up_data <= up_data_reg[18];  data_valid <= data_valid_reg[18]; end
       19: begin up_data <= up_data_reg[19];  data_valid <= data_valid_reg[19]; end
       20: begin up_data <= up_data_reg[20];  data_valid <= data_valid_reg[20]; end
       21: begin up_data <= up_data_reg[21];  data_valid <= data_valid_reg[21]; end
       22: begin up_data <= up_data_reg[22];  data_valid <= data_valid_reg[22]; end
       23: begin up_data <= up_data_reg[23];  data_valid <= data_valid_reg[23]; end
       24: begin up_data <= up_data_reg[24];  data_valid <= data_valid_reg[24]; end
       25: begin up_data <= up_data_reg[25];  data_valid <= data_valid_reg[25]; end
       26: begin up_data <= up_data_reg[26];  data_valid <= data_valid_reg[26]; end
       27: begin up_data <= up_data_reg[27];  data_valid <= data_valid_reg[27]; end
       28: begin up_data <= up_data_reg[28];  data_valid <= data_valid_reg[28]; end
       29: begin up_data <= up_data_reg[29];  data_valid <= data_valid_reg[29]; end
       30: begin up_data <= up_data_reg[30];  data_valid <= data_valid_reg[30]; end
  default: begin up_data <= 0              ;  data_valid <= 0                 ; end
endcase    


endmodule