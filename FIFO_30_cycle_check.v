//多比特实现生成30次例化
module FIFO_30_cycle_check(
input  wire         clk           ,
input  wire         rst_n         ,
input  wire [29:0]  fifo_wrreq    ,//30*1=30
input  wire [959:0] fifo_data_in  ,//30*32=960

output wire         data_valid    ,
output wire [63:0]  up_data         
);

wire  [389:0] fifo_rdusedw;//13*30=390

wire  [29:0]  fifo_rdreq;//30*1=30

wire  [1919:0] fifo_q;//64*30=1920


 cycle_check30 cycle_check30_1(
    .   clk            ( clk                   ) ,
    .   rst_n          ( rst_n                 ) ,

    // .   fifo_rdusedw0  ( fifo_rdusedw[12 :0  ] ) ,   // [(12+13*0 ): (13*0 )]
    // .   fifo_rdusedw1  ( fifo_rdusedw[25 :13 ] ) ,   // [(25+13*1 ): (13*1 )]
    // .   fifo_rdusedw2  ( fifo_rdusedw[38 :26 ] ) ,   // [(38+13*2 ): (13*2 )]
    // .   fifo_rdusedw3  ( fifo_rdusedw[51 :39 ] ) ,   // [(51+13*3 ): (13*3 )]
    // .   fifo_rdusedw4  ( fifo_rdusedw[64 :52 ] ) ,   // [(12+13*4 ): (13*4 )]
    // .   fifo_rdusedw5  ( fifo_rdusedw[77 :65 ] ) ,   // [(12+13*5 ): (13*5 )]
    // .   fifo_rdusedw6  ( fifo_rdusedw[90 :78 ] ) ,   // [(12+13*6 ): (13*6 )]
    // .   fifo_rdusedw7  ( fifo_rdusedw[103:91 ] ) ,   // [(12+13*7 ): (13*7 )]
    // .   fifo_rdusedw8  ( fifo_rdusedw[116:104] ) ,   // [(12+13*8 ): (13*8 )]
    // .   fifo_rdusedw9  ( fifo_rdusedw[129:117] ) ,   // [(12+13*9 ): (13*9 )]
    // .   fifo_rdusedw10 ( fifo_rdusedw[142:130] ) ,   // [(12+13*10): (13*10)]
    // .   fifo_rdusedw11 ( fifo_rdusedw[155:143] ) ,   // [(12+13*11): (13*11)]
    // .   fifo_rdusedw12 ( fifo_rdusedw[168:156] ) ,   // [(12+13*12): (13*12)]
    // .   fifo_rdusedw13 ( fifo_rdusedw[181:169] ) ,   // [(12+13*13): (13*13)]
    // .   fifo_rdusedw14 ( fifo_rdusedw[194:182] ) ,   // [(12+13*14): (13*14)]
    // .   fifo_rdusedw15 ( fifo_rdusedw[207:195] ) ,   // [(12+13*15): (13*15)]
    // .   fifo_rdusedw16 ( fifo_rdusedw[220:208] ) ,   // [(12+13*16): (13*16)]
    // .   fifo_rdusedw17 ( fifo_rdusedw[233:221] ) ,   // [(12+13*17): (13*17)]
    // .   fifo_rdusedw18 ( fifo_rdusedw[246:234] ) ,   // [(12+13*18): (13*18)]
    // .   fifo_rdusedw19 ( fifo_rdusedw[259:247] ) ,   // [(12+13*19): (13*19)]
    // .   fifo_rdusedw20 ( fifo_rdusedw[272:260] ) ,   // [(12+13*20): (13*20)]
    // .   fifo_rdusedw21 ( fifo_rdusedw[285:273] ) ,   // [(12+13*21): (13*21)]
    // .   fifo_rdusedw22 ( fifo_rdusedw[298:286] ) ,   // [(12+13*22): (13*22)]
    // .   fifo_rdusedw23 ( fifo_rdusedw[311:299] ) ,   // [(12+13*23): (13*23)]
    // .   fifo_rdusedw24 ( fifo_rdusedw[324:312] ) ,   // [(12+13*24): (13*24)]
    // .   fifo_rdusedw25 ( fifo_rdusedw[337:325] ) ,   // [(12+13*25): (13*25)]
    // .   fifo_rdusedw26 ( fifo_rdusedw[350:338] ) ,   // [(12+13*26): (13*26)]
    // .   fifo_rdusedw27 ( fifo_rdusedw[363:351] ) ,   // [(12+13*27): (13*27)]
    // .   fifo_rdusedw28 ( fifo_rdusedw[376:364] ) ,   // [(12+13*28): (13*28)]
    // .   fifo_rdusedw29 ( fifo_rdusedw[389:377] ) ,   // [(12+13*29): (13*29)]

    // .   fifo_out0      ( fifo_q[63  :0   ] )     ,   // [(63+64*0 ): (64*0 )]
    // .   fifo_out1      ( fifo_q[127 :64  ] )     ,   // [(63+64*1 ): (64*1 )]
    // .   fifo_out2      ( fifo_q[191 :128 ] )     ,   // [(63+64*2 ): (64*2 )]
    // .   fifo_out3      ( fifo_q[255 :192 ] )     ,   // [(63+64*3 ): (64*3 )]
    // .   fifo_out4      ( fifo_q[319 :256 ] )     ,   // [(63+64*4 ): (64*4 )]
    // .   fifo_out5      ( fifo_q[383 :320 ] )     ,   // [(63+64*5 ): (64*5 )]
    // .   fifo_out6      ( fifo_q[447 :384 ] )     ,   // [(63+64*6 ): (64*6 )]
    // .   fifo_out7      ( fifo_q[511 :448 ] )     ,   // [(63+64*7 ): (64*7 )]
    // .   fifo_out8      ( fifo_q[575 :512 ] )     ,   // [(63+64*8 ): (64*8 )]
    // .   fifo_out9      ( fifo_q[639 :576 ] )     ,   // [(63+64*9 ): (64*9 )]
    // .   fifo_out10     ( fifo_q[703 :640 ] )     ,   // [(63+64*10): (64*10)]
    // .   fifo_out11     ( fifo_q[767 :704 ] )     ,   // [(63+64*11): (64*11)]
    // .   fifo_out12     ( fifo_q[831 :768 ] )     ,   // [(63+64*12): (64*12)]
    // .   fifo_out13     ( fifo_q[895 :832 ] )     ,   // [(63+64*13): (64*13)]
    // .   fifo_out14     ( fifo_q[959 :896 ] )     ,   // [(63+64*14): (64*14)]
    // .   fifo_out15     ( fifo_q[1023:960 ] )     ,   // [(63+64*15): (64*15)]
    // .   fifo_out16     ( fifo_q[1087:1024] )     ,   // [(63+64*16): (64*16)]
    // .   fifo_out17     ( fifo_q[1151:1088] )     ,   // [(63+64*17): (64*17)]
    // .   fifo_out18     ( fifo_q[1215:1152] )     ,   // [(63+64*18): (64*18)]
    // .   fifo_out19     ( fifo_q[1279:1216] )     ,   // [(63+64*19): (64*19)]
    // .   fifo_out20     ( fifo_q[1343:1280] )     ,   // [(63+64*20): (64*20)]
    // .   fifo_out21     ( fifo_q[1407:1344] )     ,   // [(63+64*21): (64*21)]
    // .   fifo_out22     ( fifo_q[1471:1408] )     ,   // [(63+64*22): (64*22)]
    // .   fifo_out23     ( fifo_q[1535:1472] )     ,   // [(63+64*23): (64*23)]
    // .   fifo_out24     ( fifo_q[1599:1536] )     ,   // [(63+64*24): (64*24)]
    // .   fifo_out25     ( fifo_q[1663:1600] )     ,   // [(63+64*25): (64*25)]
    // .   fifo_out26     ( fifo_q[1727:1664] )     ,   // [(63+64*26): (64*26)]
    // .   fifo_out27     ( fifo_q[1791:1728] )     ,   // [(63+64*27): (64*27)]
    // .   fifo_out28     ( fifo_q[1855:1792] )     ,   // [(63+64*28): (64*28)]
    // .   fifo_out29     ( fifo_q[1919:1856] )     ,   // [(63+64*29): (64*29)]

    // .   fifo_rdreq0    ( fifo_rdreq[0 ] ) ,
    // .   fifo_rdreq1    ( fifo_rdreq[1 ] ) ,
    // .   fifo_rdreq2    ( fifo_rdreq[2 ] ) ,
    // .   fifo_rdreq3    ( fifo_rdreq[3 ] ) ,
    // .   fifo_rdreq4    ( fifo_rdreq[4 ] ) ,
    // .   fifo_rdreq5    ( fifo_rdreq[5 ] ) ,    
    // .   fifo_rdreq6    ( fifo_rdreq[6 ] ) ,    
    // .   fifo_rdreq7    ( fifo_rdreq[7 ] ) ,    
    // .   fifo_rdreq8    ( fifo_rdreq[8 ] ) ,
    // .   fifo_rdreq9    ( fifo_rdreq[9 ] ) ,    
    // .   fifo_rdreq10   ( fifo_rdreq[10] ) ,    
    // .   fifo_rdreq11   ( fifo_rdreq[11] ) ,    
    // .   fifo_rdreq12   ( fifo_rdreq[12] ) ,
    // .   fifo_rdreq13   ( fifo_rdreq[13] ) ,    
    // .   fifo_rdreq14   ( fifo_rdreq[14] ) ,    
    // .   fifo_rdreq15   ( fifo_rdreq[15] ) ,    
    // .   fifo_rdreq16   ( fifo_rdreq[16] ) ,
    // .   fifo_rdreq17   ( fifo_rdreq[17] ) ,    
    // .   fifo_rdreq18   ( fifo_rdreq[18] ) ,    
    // .   fifo_rdreq19   ( fifo_rdreq[19] ) ,    
    // .   fifo_rdreq20   ( fifo_rdreq[20] ) ,
    // .   fifo_rdreq21   ( fifo_rdreq[21] ) ,
    // .   fifo_rdreq22   ( fifo_rdreq[22] ) ,
    // .   fifo_rdreq23   ( fifo_rdreq[23] ) ,
    // .   fifo_rdreq24   ( fifo_rdreq[24] ) ,
    // .   fifo_rdreq25   ( fifo_rdreq[25] ) ,
    // .   fifo_rdreq26   ( fifo_rdreq[26] ) ,
    // .   fifo_rdreq27   ( fifo_rdreq[27] ) ,
    // .   fifo_rdreq28   ( fifo_rdreq[28] ) ,
    // .   fifo_rdreq29   ( fifo_rdreq[29] ) ,

    .   fifo_rdusedw  ( fifo_rdusedw )    , 
    .   fifo_out      ( fifo_q       )    , 
    .   fifo_rdreq    ( fifo_rdreq   )    ,


    .   data_valid    ( data_valid      ) ,
    .   up_data       ( up_data         )  
);


genvar i;
generate 
for(i=0;i<=29;i=i+1)begin:FIFO4
    fifo_32in_64out	fifo (
	.data    ( fifo_data_in[31+i*32:i*32] ),
	.rdclk   ( clk                        ),
	.rdreq   ( fifo_rdreq[i]              ),
	.wrclk   ( clk                        ),
	.wrreq   ( fifo_wrreq[i]              ),
	.q       ( fifo_q[63+i*64:i*64]       ),
	.rdusedw ( fifo_rdusedw[12+i*13:i*13] )
	);
end
endgenerate


endmodule
















































/* //数组实现生成多次例化
module FIFO_30_cycle_check(
input  wire        clk            ,
input  wire        rst_n          ,
input  wire        fifo_wrreq1    ,
input  wire        fifo_wrreq2    ,
input  wire        fifo_wrreq3    ,
input  wire        fifo_wrreq4    ,
input  wire        fifo_wrreq5    ,
input  wire        fifo_wrreq6    ,
input  wire        fifo_wrreq7    ,
input  wire        fifo_wrreq8    ,
input  wire        fifo_wrreq9    ,
input  wire        fifo_wrreq10   ,
input  wire        fifo_wrreq11   ,
input  wire        fifo_wrreq12   ,
input  wire        fifo_wrreq13   ,
input  wire        fifo_wrreq14   ,
input  wire        fifo_wrreq15   ,
input  wire        fifo_wrreq16   ,
input  wire        fifo_wrreq17   ,
input  wire        fifo_wrreq18   ,
input  wire        fifo_wrreq19   ,
input  wire        fifo_wrreq20   ,
input  wire        fifo_wrreq21   ,
input  wire        fifo_wrreq22   ,
input  wire        fifo_wrreq23   ,
input  wire        fifo_wrreq24   ,
input  wire        fifo_wrreq25   ,
input  wire        fifo_wrreq26   ,
input  wire        fifo_wrreq27   ,
input  wire        fifo_wrreq28   ,
input  wire        fifo_wrreq29   ,
input  wire        fifo_wrreq30   ,

input  wire [31:0] data_in1       ,
input  wire [31:0] data_in2       ,
input  wire [31:0] data_in3       ,
input  wire [31:0] data_in4       ,
input  wire [31:0] data_in5       ,
input  wire [31:0] data_in6       ,
input  wire [31:0] data_in7       ,
input  wire [31:0] data_in8       ,
input  wire [31:0] data_in9       ,
input  wire [31:0] data_in10      ,
input  wire [31:0] data_in11      ,
input  wire [31:0] data_in12      ,
input  wire [31:0] data_in13      ,
input  wire [31:0] data_in14      ,
input  wire [31:0] data_in15      ,
input  wire [31:0] data_in16      ,
input  wire [31:0] data_in17      ,
input  wire [31:0] data_in18      ,
input  wire [31:0] data_in19      ,
input  wire [31:0] data_in20      ,
input  wire [31:0] data_in21      ,
input  wire [31:0] data_in22      ,
input  wire [31:0] data_in23      ,
input  wire [31:0] data_in24      ,
input  wire [31:0] data_in25      ,
input  wire [31:0] data_in26      ,
input  wire [31:0] data_in27      ,
input  wire [31:0] data_in28      ,
input  wire [31:0] data_in29      ,
input  wire [31:0] data_in30      ,

output wire        data_valid     ,
output wire [63:0] up_data         
);

wire       fifo_wrreq[1:30];
assign     fifo_wrreq[1 ] = fifo_wrreq1  ;
assign     fifo_wrreq[2 ] = fifo_wrreq2  ;
assign     fifo_wrreq[3 ] = fifo_wrreq3  ;
assign     fifo_wrreq[4 ] = fifo_wrreq4  ;
assign     fifo_wrreq[5 ] = fifo_wrreq5  ;
assign     fifo_wrreq[6 ] = fifo_wrreq6  ;
assign     fifo_wrreq[7 ] = fifo_wrreq7  ;
assign     fifo_wrreq[8 ] = fifo_wrreq8  ;
assign     fifo_wrreq[9 ] = fifo_wrreq9  ;
assign     fifo_wrreq[10] = fifo_wrreq10 ;
assign     fifo_wrreq[11] = fifo_wrreq11 ;
assign     fifo_wrreq[12] = fifo_wrreq12 ;
assign     fifo_wrreq[13] = fifo_wrreq13 ;
assign     fifo_wrreq[14] = fifo_wrreq14 ;
assign     fifo_wrreq[15] = fifo_wrreq15 ;
assign     fifo_wrreq[16] = fifo_wrreq16 ;
assign     fifo_wrreq[17] = fifo_wrreq17 ;
assign     fifo_wrreq[18] = fifo_wrreq18 ;
assign     fifo_wrreq[19] = fifo_wrreq19 ;
assign     fifo_wrreq[20] = fifo_wrreq20 ;
assign     fifo_wrreq[21] = fifo_wrreq21 ;
assign     fifo_wrreq[22] = fifo_wrreq22 ;
assign     fifo_wrreq[23] = fifo_wrreq23 ;
assign     fifo_wrreq[24] = fifo_wrreq24 ;
assign     fifo_wrreq[25] = fifo_wrreq25 ;
assign     fifo_wrreq[26] = fifo_wrreq26 ;
assign     fifo_wrreq[27] = fifo_wrreq27 ;
assign     fifo_wrreq[28] = fifo_wrreq28 ;
assign     fifo_wrreq[29] = fifo_wrreq29 ;
assign     fifo_wrreq[30] = fifo_wrreq30 ;

wire [31:0] data_in[1:30];
assign      data_in[1 ] = data_in1  ;
assign      data_in[2 ] = data_in2  ;
assign      data_in[3 ] = data_in3  ;
assign      data_in[4 ] = data_in4  ;
assign      data_in[5 ] = data_in5  ;
assign      data_in[6 ] = data_in6  ;
assign      data_in[7 ] = data_in7  ;
assign      data_in[8 ] = data_in8  ;
assign      data_in[9 ] = data_in9  ;
assign      data_in[10] = data_in10 ;
assign      data_in[11] = data_in11 ;
assign      data_in[12] = data_in12 ;
assign      data_in[13] = data_in13 ;
assign      data_in[14] = data_in14 ;
assign      data_in[15] = data_in15 ;
assign      data_in[16] = data_in16 ;
assign      data_in[17] = data_in17 ;
assign      data_in[18] = data_in18 ;
assign      data_in[19] = data_in19 ;
assign      data_in[20] = data_in20 ;
assign      data_in[21] = data_in21 ;
assign      data_in[22] = data_in22 ;
assign      data_in[23] = data_in23 ;
assign      data_in[24] = data_in24 ;
assign      data_in[25] = data_in25 ;
assign      data_in[26] = data_in26 ;
assign      data_in[27] = data_in27 ;
assign      data_in[28] = data_in28 ;
assign      data_in[29] = data_in29 ;
assign      data_in[30] = data_in30 ;


wire  [12:0] fifo_rdusedw[1:30];

wire         fifo_rdreq[1:30];

wire  [63:0] fifo_q[1:30];


 cycle_check cycle_check_1(
    .   clk           ( clk             ) ,
    .   rst_n         ( rst_n           ) ,
    .   fifo1_rdusedw ( fifo_rdusedw[1] ) ,
    .   fifo2_rdusedw ( fifo_rdusedw[2] ) ,
    .   fifo3_rdusedw ( fifo_rdusedw[3] ) ,
    .   fifo4_rdusedw ( fifo_rdusedw[4] ) ,
    .   fifo1_out     ( fifo_q[1]       ) ,
    .   fifo2_out     ( fifo_q[2]       ) ,
    .   fifo3_out     ( fifo_q[3]       ) ,
    .   fifo4_out     ( fifo_q[4]       ) ,
    
    .   fifo1_rdreq   ( fifo_rdreq[1]   ) ,
    .   fifo2_rdreq   ( fifo_rdreq[2]   ) ,
    .   fifo3_rdreq   ( fifo_rdreq[3]   ) ,
    .   fifo4_rdreq   ( fifo_rdreq[4]   ) ,
    .   data_valid    ( data_valid      ) ,
    .   up_data       ( up_data         )  
);

genvar i;
generate 
for(i=1;i<=30;i=i+1)begin:FIFO30
    fifo_32in_64out	fifo (
	.data    (data_in[i])       ,
	.rdclk   (clk)               ,
	.rdreq   (fifo_rdreq[i])     ,
	.wrclk   (clk_[i])           ,
	.wrreq   (fifo_wrreq[i])     ,
    
    .rdusedw (fifo_rdusedw[i])   ,
	.q       (fifo_q[i])        

	);
end
endgenerate



endmodule */