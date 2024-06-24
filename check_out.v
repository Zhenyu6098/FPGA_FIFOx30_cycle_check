module check_out#(
    parameter YUZHI = 128,
    parameter HEAD  = 32'hadf90c00
)
(
    input wire         clk            ,
    input wire         rst_n          ,
    input wire  [11:0] rdusedw        ,
    input wire  [63:0] fifo_out       ,
    input wire  [31:0] tongdao        ,
    input wire         start          ,
    
    output reg         over           ,
    output reg         rdreq          ,
    output reg         data_valid     ,
    output reg  [63:0] up_data     

);

reg [63:0] cnt_packeg[1:30];
reg [15:0] cnt_work;

reg [3:0]state ;
parameter IDLE   = 1;
parameter Scheck = 2;
parameter Sout   = 3;
parameter Sover  = 4;

//状态转移
always@(posedge clk or negedge rst_n)
    if(~rst_n)
        state <= IDLE;
    else case(state)
        IDLE: if(start==1)
            state <= Scheck;
              
      Scheck: if(rdusedw >= YUZHI)
                  state <= Sout;
              else         
                  state <= Sover;
                  
        Sout: if(cnt_work == (YUZHI + 10))
                  state <= Sover;
                  
       Sover: state <= IDLE;
	endcase

//输出
always@(posedge clk or negedge rst_n)
    if(~rst_n)begin
          over       <= 0;
          cnt_work   <= 16'b0;
          rdreq      <= 1'b0;
          data_valid <= 1'b0;
          up_data    <= 64'b0;
          cnt_packeg[tongdao]<= 64'b0;end
    else case(state)
        IDLE:begin
               over       <= 0;
               cnt_work   <= 16'b0;
               rdreq      <= 1'b0;
               data_valid <= 1'b0;
               up_data    <= 64'b0;

             end
        Sout:begin
              if(cnt_work == (YUZHI + 10))
                      cnt_work <= 0;
                  else 
                      cnt_work <= cnt_work + 1;
              
              if(cnt_work == 1)
                      cnt_packeg[tongdao] <= cnt_packeg[tongdao] +1;
                  else
                      cnt_packeg[tongdao] <= cnt_packeg[tongdao];
                       
              if(cnt_work == 2)
                      up_data <= {HEAD,tongdao};
                  else if(cnt_work == 3)
                      up_data <= cnt_packeg[tongdao];
                  else
                      up_data <= fifo_out;
              
              if(cnt_work>= 2 && cnt_work<=(YUZHI +1))
                      rdreq <= 1;  
                  else                   
                      rdreq <= 0;  
              
              if(cnt_work>=(2) && cnt_work<=(YUZHI +3))
                      data_valid <= 1;
                  else
                      data_valid <= 0;
             end       
       Sover: over  <= 1;
	endcase

endmodule