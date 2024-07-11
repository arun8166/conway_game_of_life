`timescale 1ns / 1ps

`include "element.v"
module conway #(parameter N=16)(input clk,input reset,input  [(N*N)-1:0] first,output [(N*N)-1:0] cells);
    genvar i,j;
    generate
        for (i = 0; i < N; i=i+1) begin 
            for (j = 0; j < N; j=j+1) begin 
                element lc(.clk(clk),.reset(reset),.start(first[i*N + j]),
                    .local({cells[((!i)?N-1:i-1)*N + ((!j)?N-1:j-1)],
                                cells[((!i)?N-1:i-1)*N + j %N],
                                cells[((!i)?N-1:i-1)*N + ((j==N-1)?0:j+1)],
                                cells[(i%N)*N + ((!j)?N-1:j-1)],
                                cells[(i%N)*N + (j+1)%N],
                                cells[((i==N-1)?0:i+1)*N + ((!j)?N-1:j-1)],
                                cells[((i==N-1)?0:i+1)*N + j ],
                                cells[((i==N-1)?0:i+1)*N + ((j==N-1)?0:j+1)]                   
                              }),
                    .live(cells[i*N + j])
                );
            end
        end
    endgenerate   
endmodule