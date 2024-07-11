`timescale 1ns / 1ps
`include "conway.v"

module conway_tb();
    localparam N = 16;
    reg clk;
    reg reset;
    reg [N*N-1:0] first;
    wire [N*N-1:0] cells;
    wire [N-1:0] wcells [N-1:0];
    
    genvar i;
    generate
        for (i = 0; i < N; i = i+1) begin
            assign wcells[i] = cells[N*(N-i)-1 : N*(N-1-i)];
        end
    endgenerate
        
    conway #(.N(N)) conway_test(.clk(clk),.reset(reset),.first(first),.cells(cells));
    
    always #1 clk = ~clk;
    
    initial begin
        
        $monitor("%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n",
            cells[N*N    -1 : N*(N-1)],
            cells[N*(N-1)-1 : N*(N-2)],
            cells[N*(N-2)-1 : N*(N-3)],
            cells[N*(N-3)-1 : N*(N-4)],
            cells[N*(N-4)-1 : N*(N-5)],
            cells[N*(N-5)-1 : N*(N-6)],
            cells[N*(N-6)-1 : N*(N-7)],
            cells[N*(N-7)-1 : N*(N-8)],
            cells[N*(N-8)-1 : N*(N-9)],
            cells[N*(N-9)-1 : N*(N-10)],
            cells[N*(N-10)-1 : N*(N-11)],
            cells[N*(N-11)-1 : N*(N-12)],
            cells[N*(N-12)-1 : N*(N-13)],
            cells[N*(N-13)-1 : N*(N-14)],
            cells[N*(N-14)-1 : N*(N-15)],
            cells[N*(N-15)-1 : N*(N-16)]
        );
        
        clk <= 0;
        reset <= 0;
        //first <= 64'b01000000_00100000_11100000_00000000_00000000_00000000_00000000_00000000;
        first <= 256'b0100000000000000_0010000000000000_1110000000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000;
        #7;
        reset <= 1;     
        #5000;
        $finish;
    end
endmodule