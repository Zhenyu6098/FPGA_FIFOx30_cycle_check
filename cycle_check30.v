module cycle_check30(
input wire            clk            ,
input wire            rst_n          ,
input wire   [389:0]   fifo_rdusedw   , 

input wire   [1919:0]  fifo_out       , 
output reg   [29:0]    fifo_rdreq     ,




// input wire  [12:0] fifo_rdusedw  ,  
// input wire  [12:0] fifo_rdusedw1  ,  
// input wire  [12:0] fifo_rdusedw2  ,  
// input wire  [12:0] fifo_rdusedw3  ,  
// input wire  [12:0] fifo_rdusedw4  ,  
// input wire  [12:0] fifo_rdusedw5  ,  
// input wire  [12:0] fifo_rdusedw6  ,  
// input wire  [12:0] fifo_rdusedw7  ,  
// input wire  [12:0] fifo_rdusedw8  ,  
// input wire  [12:0] fifo_rdusedw9  ,  
// input wire  [12:0] fifo_rdusedw10 ,  
// input wire  [12:0] fifo_rdusedw11 ,  
// input wire  [12:0] fifo_rdusedw12 ,  
// input wire  [12:0] fifo_rdusedw13 ,  
// input wire  [12:0] fifo_rdusedw14 ,  
// input wire  [12:0] fifo_rdusedw15 ,  
// input wire  [12:0] fifo_rdusedw16 ,  
// input wire  [12:0] fifo_rdusedw17 ,  
// input wire  [12:0] fifo_rdusedw18 ,  
// input wire  [12:0] fifo_rdusedw19 ,  
// input wire  [12:0] fifo_rdusedw20 ,  
// input wire  [12:0] fifo_rdusedw21 ,  
// input wire  [12:0] fifo_rdusedw22 ,  
// input wire  [12:0] fifo_rdusedw23 ,  
// input wire  [12:0] fifo_rdusedw24 ,  
// input wire  [12:0] fifo_rdusedw25 ,  
// input wire  [12:0] fifo_rdusedw26 ,  
// input wire  [12:0] fifo_rdusedw27 ,  
// input wire  [12:0] fifo_rdusedw28 ,  
// input wire  [12:0] fifo_rdusedw29 ,  

// input wire  [63:0] fifo_out0      ,  
// input wire  [63:0] fifo_out1      ,  
// input wire  [63:0] fifo_out2      ,  
// input wire  [63:0] fifo_out3      ,  
// input wire  [63:0] fifo_out4      ,  
// input wire  [63:0] fifo_out5      ,  
// input wire  [63:0] fifo_out6      ,  
// input wire  [63:0] fifo_out7      ,  
// input wire  [63:0] fifo_out8      ,  
// input wire  [63:0] fifo_out9      ,  
// input wire  [63:0] fifo_out10     ,  
// input wire  [63:0] fifo_out11     ,  
// input wire  [63:0] fifo_out12     ,  
// input wire  [63:0] fifo_out13     ,  
// input wire  [63:0] fifo_out14     ,  
// input wire  [63:0] fifo_out15     ,  
// input wire  [63:0] fifo_out16     ,  
// input wire  [63:0] fifo_out17     ,  
// input wire  [63:0] fifo_out18     ,  
// input wire  [63:0] fifo_out19     ,  
// input wire  [63:0] fifo_out20     ,  
// input wire  [63:0] fifo_out21     ,  
// input wire  [63:0] fifo_out22     ,  
// input wire  [63:0] fifo_out23     ,  
// input wire  [63:0] fifo_out24     ,  
// input wire  [63:0] fifo_out25     ,  
// input wire  [63:0] fifo_out26     ,  
// input wire  [63:0] fifo_out27     ,  
// input wire  [63:0] fifo_out28     ,  
// input wire  [63:0] fifo_out29     ,  

// input wire         fifo_rdreq0    ,
// input wire         fifo_rdreq1    ,
// input wire         fifo_rdreq2    ,
// input wire         fifo_rdreq3    ,
// input wire         fifo_rdreq4    ,
// input wire         fifo_rdreq5    ,    
// input wire         fifo_rdreq6    ,    
// input wire         fifo_rdreq7    ,    
// input wire         fifo_rdreq8    ,
// input wire         fifo_rdreq9    ,    
// input wire         fifo_rdreq10   ,    
// input wire         fifo_rdreq11   ,    
// input wire         fifo_rdreq12   ,
// input wire         fifo_rdreq13   ,    
// input wire         fifo_rdreq14   ,    
// input wire         fifo_rdreq15   ,    
// input wire         fifo_rdreq16   ,
// input wire         fifo_rdreq17   ,    
// input wire         fifo_rdreq18   ,    
// input wire         fifo_rdreq19   ,    
// input wire         fifo_rdreq20   ,
// input wire         fifo_rdreq21   ,
// input wire         fifo_rdreq22   ,
// input wire         fifo_rdreq23   ,
// input wire         fifo_rdreq24   ,
// input wire         fifo_rdreq25   ,
// input wire         fifo_rdreq26   ,
// input wire         fifo_rdreq27   ,
// input wire         fifo_rdreq28   ,
// input wire         fifo_rdreq29   ,

output reg         data_valid     ,
output reg [63:0]  up_data     
);

// wire [12:0] fifo_rdusedw[0:29];
// assign fifo_rdusedw[0 ] = fifo_rdusedw0   ;
// assign fifo_rdusedw[1 ] = fifo_rdusedw1   ;
// assign fifo_rdusedw[2 ] = fifo_rdusedw2   ;
// assign fifo_rdusedw[3 ] = fifo_rdusedw3   ;
// assign fifo_rdusedw[4 ] = fifo_rdusedw4   ;
// assign fifo_rdusedw[5 ] = fifo_rdusedw5   ;
// assign fifo_rdusedw[6 ] = fifo_rdusedw6   ;
// assign fifo_rdusedw[7 ] = fifo_rdusedw7   ;
// assign fifo_rdusedw[8 ] = fifo_rdusedw8   ;
// assign fifo_rdusedw[9 ] = fifo_rdusedw9   ;
// assign fifo_rdusedw[10] = fifo_rdusedw10  ;
// assign fifo_rdusedw[11] = fifo_rdusedw11  ;
// assign fifo_rdusedw[12] = fifo_rdusedw12  ;
// assign fifo_rdusedw[13] = fifo_rdusedw13  ;
// assign fifo_rdusedw[14] = fifo_rdusedw14  ;
// assign fifo_rdusedw[15] = fifo_rdusedw15  ;
// assign fifo_rdusedw[16] = fifo_rdusedw16  ;
// assign fifo_rdusedw[17] = fifo_rdusedw17  ;
// assign fifo_rdusedw[18] = fifo_rdusedw18  ;
// assign fifo_rdusedw[19] = fifo_rdusedw19  ;
// assign fifo_rdusedw[20] = fifo_rdusedw20  ;
// assign fifo_rdusedw[21] = fifo_rdusedw21  ;
// assign fifo_rdusedw[22] = fifo_rdusedw22  ;
// assign fifo_rdusedw[23] = fifo_rdusedw23  ;
// assign fifo_rdusedw[24] = fifo_rdusedw24  ;
// assign fifo_rdusedw[25] = fifo_rdusedw25  ;
// assign fifo_rdusedw[26] = fifo_rdusedw26  ;
// assign fifo_rdusedw[27] = fifo_rdusedw27  ;
// assign fifo_rdusedw[28] = fifo_rdusedw28  ;
// assign fifo_rdusedw[29] = fifo_rdusedw29  ;

// wire [63:0] fifo_out[0:29];
// assign fifo_out[0 ] = fifo_out0   ;
// assign fifo_out[1 ] = fifo_out1   ;
// assign fifo_out[2 ] = fifo_out2   ;
// assign fifo_out[3 ] = fifo_out3   ;
// assign fifo_out[4 ] = fifo_out4   ;
// assign fifo_out[5 ] = fifo_out5   ;
// assign fifo_out[6 ] = fifo_out6   ;
// assign fifo_out[7 ] = fifo_out7   ;
// assign fifo_out[8 ] = fifo_out8   ;
// assign fifo_out[9 ] = fifo_out9   ;
// assign fifo_out[10] = fifo_out10  ;
// assign fifo_out[11] = fifo_out11  ;
// assign fifo_out[12] = fifo_out12  ;
// assign fifo_out[13] = fifo_out13  ;
// assign fifo_out[14] = fifo_out14  ;
// assign fifo_out[15] = fifo_out15  ;
// assign fifo_out[16] = fifo_out16  ;
// assign fifo_out[17] = fifo_out17  ;
// assign fifo_out[18] = fifo_out18  ;
// assign fifo_out[19] = fifo_out19  ;
// assign fifo_out[20] = fifo_out20  ;
// assign fifo_out[21] = fifo_out21  ;
// assign fifo_out[22] = fifo_out22  ;
// assign fifo_out[23] = fifo_out23  ;
// assign fifo_out[24] = fifo_out24  ;
// assign fifo_out[25] = fifo_out25  ;
// assign fifo_out[26] = fifo_out26  ;
// assign fifo_out[27] = fifo_out27  ;
// assign fifo_out[28] = fifo_out28  ;
// assign fifo_out[29] = fifo_out29  ;

// wire  fifo_rdreq[0:29];
// assign fifo_rdreq[0 ] = fifo_rdreq0   ;
// assign fifo_rdreq[1 ] = fifo_rdreq1   ;
// assign fifo_rdreq[2 ] = fifo_rdreq2   ;
// assign fifo_rdreq[3 ] = fifo_rdreq3   ;
// assign fifo_rdreq[4 ] = fifo_rdreq4   ;
// assign fifo_rdreq[5 ] = fifo_rdreq5   ;
// assign fifo_rdreq[6 ] = fifo_rdreq6   ;
// assign fifo_rdreq[7 ] = fifo_rdreq7   ;
// assign fifo_rdreq[8 ] = fifo_rdreq8   ;
// assign fifo_rdreq[9 ] = fifo_rdreq9   ;
// assign fifo_rdreq[10] = fifo_rdreq10  ;
// assign fifo_rdreq[11] = fifo_rdreq11  ;
// assign fifo_rdreq[12] = fifo_rdreq12  ;
// assign fifo_rdreq[13] = fifo_rdreq13  ;
// assign fifo_rdreq[14] = fifo_rdreq14  ;
// assign fifo_rdreq[15] = fifo_rdreq15  ;
// assign fifo_rdreq[16] = fifo_rdreq16  ;
// assign fifo_rdreq[17] = fifo_rdreq17  ;
// assign fifo_rdreq[18] = fifo_rdreq18  ;
// assign fifo_rdreq[19] = fifo_rdreq19  ;
// assign fifo_rdreq[20] = fifo_rdreq20  ;
// assign fifo_rdreq[21] = fifo_rdreq21  ;
// assign fifo_rdreq[22] = fifo_rdreq22  ;
// assign fifo_rdreq[23] = fifo_rdreq23  ;
// assign fifo_rdreq[24] = fifo_rdreq24  ;
// assign fifo_rdreq[25] = fifo_rdreq25  ;
// assign fifo_rdreq[26] = fifo_rdreq26  ;
// assign fifo_rdreq[27] = fifo_rdreq27  ;
// assign fifo_rdreq[28] = fifo_rdreq28  ;
// assign fifo_rdreq[29] = fifo_rdreq29  ;



parameter YUZHI       = 1024;//超过阈值开始读出数据
parameter YUZHI_POINT = YUZHI/8;//即为(阈值*8)/64

parameter HEAD        = 32'hadf90c00;
parameter IDLE = 6'd100;

reg [5:0] state;
reg [15:0] cnt_work;

reg [5:0] Scheck[0:29];
reg [5:0] Sout[0:29];

// parameter Scheck[0 ]    = 6'd1 ;
// parameter Scheck[1 ]    = 6'd2 ;
// parameter Scheck[2 ]    = 6'd3 ;
// parameter Scheck[3 ]    = 6'd4 ;
// parameter Scheck[4 ]    = 6'd5 ;
// parameter Scheck[5 ]    = 6'd6 ;
// parameter Scheck[6 ]    = 6'd7 ;
// parameter Scheck[7 ]    = 6'd8 ;
// parameter Scheck[8 ]    = 6'd9 ;
// parameter Scheck[9 ]    = 6'd10;
// parameter Scheck[10]    = 6'd11;
// parameter Scheck[11]    = 6'd12;
// parameter Scheck[12]    = 6'd13;
// parameter Scheck[13]    = 6'd14;
// parameter Scheck[14]    = 6'd15;
// parameter Scheck[15]    = 6'd16;
// parameter Scheck[16]    = 6'd17;
// parameter Scheck[17]    = 6'd18;
// parameter Scheck[18]    = 6'd19;
// parameter Scheck[19]    = 6'd20;
// parameter Scheck[20]    = 6'd21;
// parameter Scheck[21]    = 6'd22;
// parameter Scheck[22]    = 6'd23;
// parameter Scheck[23]    = 6'd24;
// parameter Scheck[24]    = 6'd25;
// parameter Scheck[25]    = 6'd26;
// parameter Scheck[26]    = 6'd27;
// parameter Scheck[27]    = 6'd28;
// parameter Scheck[28]    = 6'd29;
// parameter Scheck[29]    = 6'd30;
// parameter Sout[0 ]      = 6'd31;
// parameter Sout[1 ]      = 6'd32;
// parameter Sout[2 ]      = 6'd33;
// parameter Sout[3 ]      = 6'd34;
// parameter Sout[4 ]      = 6'd35;
// parameter Sout[5 ]      = 6'd36;
// parameter Sout[6 ]      = 6'd37;
// parameter Sout[7 ]      = 6'd38;
// parameter Sout[8 ]      = 6'd39;
// parameter Sout[9 ]      = 6'd40;
// parameter Sout[10]      = 6'd41;
// parameter Sout[11]      = 6'd42;
// parameter Sout[12]      = 6'd43;
// parameter Sout[13]      = 6'd44;
// parameter Sout[14]      = 6'd45;
// parameter Sout[15]      = 6'd46;
// parameter Sout[16]      = 6'd47;
// parameter Sout[17]      = 6'd48;
// parameter Sout[18]      = 6'd49;
// parameter Sout[19]      = 6'd50;
// parameter Sout[20]      = 6'd51;
// parameter Sout[21]      = 6'd52;
// parameter Sout[22]      = 6'd53;
// parameter Sout[23]      = 6'd54;
// parameter Sout[24]      = 6'd55;
// parameter Sout[25]      = 6'd56;
// parameter Sout[26]      = 6'd57;
// parameter Sout[27]      = 6'd58;
// parameter Sout[28]      = 6'd59;
// parameter Sout[29]      = 6'd60;
initial begin
 Scheck[0 ]    = 6'd1 ;
 Scheck[1 ]    = 6'd2 ;
 Scheck[2 ]    = 6'd3 ;
 Scheck[3 ]    = 6'd4 ;
 Scheck[4 ]    = 6'd5 ;
 Scheck[5 ]    = 6'd6 ;
 Scheck[6 ]    = 6'd7 ;
 Scheck[7 ]    = 6'd8 ;
 Scheck[8 ]    = 6'd9 ;
 Scheck[9 ]    = 6'd10;
 Scheck[10]    = 6'd11;
 Scheck[11]    = 6'd12;
 Scheck[12]    = 6'd13;
 Scheck[13]    = 6'd14;
 Scheck[14]    = 6'd15;
 Scheck[15]    = 6'd16;
 Scheck[16]    = 6'd17;
 Scheck[17]    = 6'd18;
 Scheck[18]    = 6'd19;
 Scheck[19]    = 6'd20;
 Scheck[20]    = 6'd21;
 Scheck[21]    = 6'd22;
 Scheck[22]    = 6'd23;
 Scheck[23]    = 6'd24;
 Scheck[24]    = 6'd25;
 Scheck[25]    = 6'd26;
 Scheck[26]    = 6'd27;
 Scheck[27]    = 6'd28;
 Scheck[28]    = 6'd29;
 Scheck[29]    = 6'd30;
 Sout[0 ]      = 6'd31;
 Sout[1 ]      = 6'd32;
 Sout[2 ]      = 6'd33;
 Sout[3 ]      = 6'd34;
 Sout[4 ]      = 6'd35;
 Sout[5 ]      = 6'd36;
 Sout[6 ]      = 6'd37;
 Sout[7 ]      = 6'd38;
 Sout[8 ]      = 6'd39;
 Sout[9 ]      = 6'd40;
 Sout[10]      = 6'd41;
 Sout[11]      = 6'd42;
 Sout[12]      = 6'd43;
 Sout[13]      = 6'd44;
 Sout[14]      = 6'd45;
 Sout[15]      = 6'd46;
 Sout[16]      = 6'd47;
 Sout[17]      = 6'd48;
 Sout[18]      = 6'd49;
 Sout[19]      = 6'd50;
 Sout[20]      = 6'd51;
 Sout[21]      = 6'd52;
 Sout[22]      = 6'd53;
 Sout[23]      = 6'd54;
 Sout[24]      = 6'd55;
 Sout[25]      = 6'd56;
 Sout[26]      = 6'd57;
 Sout[27]      = 6'd58;
 Sout[28]      = 6'd59;
 Sout[29]      = 6'd60;
end

reg [63:0] cnt[0:29] ;


reg [31:0] CHXX_NUM;
always@(*)
    case(state)
    Sout[0 ] :CHXX_NUM = 0 ;
    Sout[1 ] :CHXX_NUM = 1 ;
    Sout[2 ] :CHXX_NUM = 2 ;
    Sout[3 ] :CHXX_NUM = 3 ;
    Sout[4 ] :CHXX_NUM = 4 ;
    Sout[5 ] :CHXX_NUM = 5 ;
    Sout[6 ] :CHXX_NUM = 6 ;
    Sout[7 ] :CHXX_NUM = 7 ;
    Sout[8 ] :CHXX_NUM = 8 ;
    Sout[9 ] :CHXX_NUM = 9 ;
    Sout[10] :CHXX_NUM = 10;
    Sout[11] :CHXX_NUM = 11;
    Sout[12] :CHXX_NUM = 12;
    Sout[13] :CHXX_NUM = 13;
    Sout[14] :CHXX_NUM = 14;
    Sout[15] :CHXX_NUM = 15;
    Sout[16] :CHXX_NUM = 16;
    Sout[17] :CHXX_NUM = 17;
    Sout[18] :CHXX_NUM = 18;
    Sout[19] :CHXX_NUM = 19;
    Sout[20] :CHXX_NUM = 20;
    Sout[21] :CHXX_NUM = 21;
    Sout[22] :CHXX_NUM = 22;
    Sout[23] :CHXX_NUM = 23;
    Sout[24] :CHXX_NUM = 24;
    Sout[25] :CHXX_NUM = 25;
    Sout[26] :CHXX_NUM = 26;
    Sout[27] :CHXX_NUM = 27;
    Sout[28] :CHXX_NUM = 28;
    Sout[29] :CHXX_NUM = 29;
    default:CHXX_NUM = 0;
    
    endcase


genvar i;
generate 
for(i=0;i<=29;i=i+1)begin:FIFO30

always@(posedge clk or negedge rst_n)
    if(~rst_n)
        begin
            state        <= IDLE;
            cnt_work     <= 0;
            data_valid   <= 0;
            up_data      <= 0;
            fifo_rdreq[i] <= 0;
            cnt[i]         <= 0;

        end
    else case(state)
    IDLE:state <= Sout[0];
    Scheck[i]:
        begin
            if(fifo_rdusedw[12+i*13:i*13] >= YUZHI_POINT)
                state <= Sout[i];
            else 
                state <= Scheck[i+1];
        end
    Sout[i]:
        begin
            if(cnt_work == (YUZHI_POINT +10))
                begin
                    cnt_work <= 0;
                    state <= Scheck[i+1];
                end
            else 
                cnt_work <= cnt_work + 1;

            if(state==Sout[i] && cnt_work == 1)
                cnt[i] <= cnt[i] +1;
            else
                cnt[i] <= cnt[i];
                
            if(cnt_work == 2)
                up_data <= {HEAD,CHXX_NUM};
            else if(cnt_work == 3)
                up_data <= cnt[i];
            else
                up_data <= fifo_out[63+i*64:i*64];
                
            if(cnt_work>=(2) && cnt_work<=(YUZHI_POINT+1))
                fifo_rdreq[i] <= 1;  
            else                   
                fifo_rdreq[i] <= 0;  

            if(cnt_work>=(2) && cnt_work<=(YUZHI_POINT+3))
                data_valid <= 1;
            else
                data_valid <= 0;
        end

   // Scheck[29]:
        // begin
            // if(fifo_rdusedw[389:377] >= YUZHI_POINT)
                // state <= Sout[29];
            // else 
                // state <= IDLE;
        // end
    // Sout[29]:
        // begin
            // if(cnt_work == (YUZHI_POINT +10))
                // begin
                    // cnt_work <= 0;
                    // state <= IDLE;
                // end
            // else 
                // cnt_work <= cnt_work + 1;

            // if(state==Sout[29] && cnt_work == 1)
                // cnt[29] <= cnt[29] +1;
            // else
                // cnt[29] <= cnt[29];
                
            // if(cnt_work == 2)
                // up_data <= {HEAD,CHXX_NUM};
            // else if(cnt_work == 3)
                // up_data <= cnt[29];
            // else
                // up_data <= fifo_out[1919:1856];
                
            // if(cnt_work>=(2) && cnt_work<=(YUZHI_POINT+1))
                // fifo_rdreq[29] <= 1;  
            // else                   
                // fifo_rdreq[29] <= 0;  

            // if(cnt_work>=(2) && cnt_work<=(YUZHI_POINT+3))
                // data_valid <= 1;
            // else
                // data_valid <= 0;
        // end

	endcase
end

endgenerate










endmodule


/* 

always@(posedge clk or negedge rst_n)
    if(~rst_n)
        begin
            state        <= S0check;
            cnt_work     <= 0;
            data_valid   <= 0;
            up_data      <= 0;
            fifo_rdreq0  <= 0;
            fifo_rdreq1  <= 0;
            fifo_rdreq2  <= 0;
            fifo_rdreq3  <= 0;
            fifo_rdreq4  <= 0;
            fifo_rdreq5  <= 0;
            fifo_rdreq6  <= 0;
            fifo_rdreq7  <= 0;
            fifo_rdreq8  <= 0;
            fifo_rdreq9  <= 0;
            fifo_rdreq10 <= 0;
            fifo_rdreq11 <= 0;
            fifo_rdreq12 <= 0;
            fifo_rdreq13 <= 0;
            fifo_rdreq14 <= 0;
            fifo_rdreq15 <= 0;
            fifo_rdreq16 <= 0;
            fifo_rdreq17 <= 0;
            fifo_rdreq18 <= 0;
            fifo_rdreq19 <= 0;
            fifo_rdreq20 <= 0;
            fifo_rdreq21 <= 0;
            fifo_rdreq22 <= 0;
            fifo_rdreq23 <= 0;
            fifo_rdreq24 <= 0;
            fifo_rdreq25 <= 0;
            fifo_rdreq26 <= 0;
            fifo_rdreq27 <= 0;
            fifo_rdreq28 <= 0;
            fifo_rdreq29 <= 0;
            cnt0         <= 0;
            cnt1         <= 0;
            cnt2         <= 0;
            cnt3         <= 0;
            cnt4         <= 0;
            cnt5         <= 0;
            cnt6         <= 0;
            cnt7         <= 0;
            cnt8         <= 0;
            cnt9         <= 0;
            cnt10        <= 0;
            cnt11        <= 0;
            cnt12        <= 0;
            cnt13        <= 0;
            cnt14        <= 0;
            cnt15        <= 0;
            cnt16        <= 0;
            cnt17        <= 0;
            cnt18        <= 0;
            cnt19        <= 0;
            cnt20        <= 0;
            cnt21        <= 0;
            cnt22        <= 0;
            cnt23        <= 0;
            cnt24        <= 0;
            cnt25        <= 0;
            cnt26        <= 0;
            cnt27        <= 0;
            cnt28        <= 0;
            cnt29        <= 0;
        end
    else case(state)
    S0check:
        begin
            if(fifo_rdusedw0 >= YUZHI_POINT)
                state <= S0out;
            else 
                state <= S1check;
        end
    S0out:
        begin
            if(cnt_work == (YUZHI_POINT +10))
                begin
                    cnt_work <= 0;
                    state <= S1check;
                end
            else 
                cnt_work <= cnt_work + 1;

            if(state==S0out && cnt_work == 1)
                cnt0 <= cnt0 +1;
            else
                cnt0 <= cnt0;
                
            if(cnt_work == 2)
                up_data <= {HEAD,CHXX_NUM};
            else if(cnt_work == 3)
                up_data <= cnt0;
            else
                up_data <= fifo_out0;
                
            if(cnt_work>=(2) && cnt_work<=(YUZHI_POINT+1))
                fifo_rdreq0 <= 1;  
            else                   
                fifo_rdreq0 <= 0;  
            //上面up_data的赋值使用了时序逻辑
            //在计数2产生请求则在3产生数据,则在4数据才能传入updata
            //所以req的产生提前了两个时钟,才能与有效信号的第3到第130位对应
            //
            //若up_data的赋值在后面使用组合逻辑
            //则上方的请求信号条件应为cnt_work>=(3) && cnt_work<=(YUZHI_POINT+2))
            //组合时的赋值条件应为
            //if(cnt_work == 3)
            //    up_data <= {HEAD,CHXX_NUM};
            //else if(cnt_work == 4)
            //    up_data <= cnt1;
            //else
            //    up_data <= fifo1_out;
            //
            if(cnt_work>=(2) && cnt_work<=(YUZHI_POINT+3))//1到x为x个数,2到x+1也为x个数
                data_valid <= 1;
            else
                data_valid <= 0;
        end
    S1check:
        begin
            if(fifo1_rdusedw >= YUZHI_POINT)
                state <= S1out;
            else 
                state <= S2check;
        end
    S1out:
        begin
            if(cnt_work == (YUZHI_POINT +10))
                begin
                    cnt_work <= 0;
                    state <= S2check;
                end
            else 
                cnt_work <= cnt_work + 1;

            if(state==S1out && cnt_work == 1)
                cnt1 <= cnt1 +1;
            else
                cnt1 <= cnt1;
                
            if(cnt_work == 2)
                up_data <= {HEAD,CHXX_NUM};
            else if(cnt_work == 3)
                up_data <= cnt1;
            else
                up_data <= fifo1_out;
                
            if(cnt_work>=(2) && cnt_work<=(YUZHI_POINT+1))
                fifo1_rdreq <= 1;  
            else                   
                fifo1_rdreq <= 0;  
            //上面up_data的赋值使用了时序逻辑
            //在计数2产生请求则在3产生数据,则在4数据才能传入updata
            //所以req的产生提前了两个时钟,才能与有效信号的第3到第130位对应
            //
            //
            //
            //若up_data的赋值在后面使用组合逻辑
            //则上方的请求信号条件应为cnt_work>=(3) && cnt_work<=(YUZHI_POINT+2))
            //组合时的赋值条件应为
            //if(cnt_work == 3)
            //    up_data <= {HEAD,CHXX_NUM};
            //else if(cnt_work == 4)
            //    up_data <= cnt1;
            //else
            //    up_data <= fifo1_out;
            //
            if(cnt_work>=(2) && cnt_work<=(YUZHI_POINT+3))//1到x为x个数,2到x+1也为x个数
                data_valid <= 1;
            else
                data_valid <= 0;
        end
    S2check:
        begin
            if(fifo2_rdusedw >= YUZHI_POINT)
                state <= S2out;
            else 
                state <= S3check;
        end
    S2out:
        begin
            if(cnt_work == (YUZHI_POINT +10))
                begin
                    cnt_work <= 0;
                    state <= S3check;
                end
            else 
                cnt_work <= cnt_work + 1;
                
            if(state==S2out && cnt_work == 1)
                cnt2 <= cnt2 +1;
            else
                cnt2 <= cnt2;
                
            if(cnt_work == 2)
                up_data <= {HEAD,CHXX_NUM};
            else if(cnt_work == 3)
                up_data <= cnt2;
            else 
                up_data <= fifo2_out;
            
            
            if(cnt_work>=(2) && cnt_work<=(YUZHI_POINT+1))
                fifo2_rdreq <= 1;
            else 
                fifo2_rdreq <= 0;
                
            if(cnt_work>=(2) && cnt_work<=(YUZHI_POINT+3))
                data_valid <= 1;
            else
                data_valid <= 0;
        end
    S3check:
        begin
            if(fifo3_rdusedw >= YUZHI_POINT)
                state <= S3out;
            else 
                state <= S4check;
        end
    S3out:
        begin
            if(cnt_work == (YUZHI_POINT +10))
                begin
                    cnt_work <= 0;
                    state <= S4check;
                end
            else 
                cnt_work <= cnt_work + 1;
                
            if(state==S3out && cnt_work == 1)
                cnt3 <= cnt3 +1;
            else
                cnt3 <= cnt3;
                
            if(cnt_work == 2)
                up_data <= {HEAD,CHXX_NUM};
            else if(cnt_work == 3)
                up_data <= cnt3;
            else 
                up_data <= fifo3_out;

            
            if(cnt_work>=(2) && cnt_work<=(YUZHI_POINT+1))
                fifo3_rdreq <= 1;
            else 
                fifo3_rdreq <= 0;
                
            if(cnt_work>=(2) && cnt_work<=(YUZHI_POINT+3))
                data_valid <= 1;
            else
                data_valid <= 0;
        end
    S4check:
        begin
            if(fifo4_rdusedw >= YUZHI_POINT)
                state <= S4out;
            else 
                state <= S1check;
        end
    S4out:
        begin
            if(cnt_work == (YUZHI_POINT +10))
                begin
                    cnt_work <= 0;
                    state <= S1check;          
                end
            else 
                cnt_work <= cnt_work + 1;
      
            if(state==S4out && cnt_work == 1)
                cnt4 <= cnt4 +1;
            else
                cnt4 <= cnt4;
     
            if(cnt_work == 2)
                up_data <= {HEAD,CHXX_NUM};
            else if(cnt_work == 3)
                up_data <= cnt4;
            else 
                up_data <= fifo4_out;

      
            if(cnt_work>=(2) && cnt_work<=(YUZHI_POINT+1))
                fifo4_rdreq <= 1;
            else 
                fifo4_rdreq <= 0;
         
            if(cnt_work>=(2) && cnt_work<=(YUZHI_POINT+3))
                data_valid <= 1;
            else
                data_valid <= 0;
        end
endcase


endmodule */