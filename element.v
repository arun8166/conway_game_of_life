`timescale 1ns / 1ps

module element(input clk,input reset,input start,input [7:0] local,output reg live);
    reg [2:0] state;
    reg [1:0] sum;
    reg done;
     
	always @ (posedge clk) 
		if (reset == 0) state <= 3'b000;
		else 
			case(state)
				3'b000: begin
				    live <= start;
				    state <= 3'b001;
				end
				3'b001: begin
				    done <= 0;
				    sum <= local[0] + local[1] + local[2];
				    state <= 3'b010;
				end
				3'b010: begin
				    if(sum==2'd3 && local[3]) done <= 1;
				    else sum <= sum + local[3];
				    state <= 3'b011;
				end
				3'b011: begin
				    if(sum==2'd3 && local[4] && !done) done <= 1;
				    else sum <= sum + local[4];
				    state <= 3'b100;
				end
				3'b100: begin
				    if(sum==2'd3 && local[5] && !done) done <= 1;
				    else sum <= sum + local[5];
				    state <= 3'b101;
				end
				3'b101: begin
				    if(sum==2'd3 && local[6] && !done) done <= 1;
				    else sum <= sum + local[6];
				    state <= 3'b110;
				end
				3'b110: begin
				    if(sum==2'd3 && local[7] && !done) done <= 1;
				    else sum <= sum + local[7];
				    state <= 3'b111;
				end
				3'b111: begin
				    if(!done) begin
                        		if(sum == 2'd3) live <= 1;
                        		if(sum < 2'd2) live <= 0;
				    end
				    else live <= 0;
				    state <= 3'b001;
				end
			endcase
endmodule
