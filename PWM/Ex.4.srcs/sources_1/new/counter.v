`timescale 1ns / 1ps

module counter(
               input clk,
               input reset,
               input en,
               output reg [6:0] out 
               );
    always@(posedge clk)begin
        if(reset == 1)
            out <= 0;
        else begin  
            if(en == 1)
                out <= out +1;
            else 
                out <= out;
        end    
    end               
endmodule
