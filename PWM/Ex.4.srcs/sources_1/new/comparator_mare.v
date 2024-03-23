`timescale 1ns / 1ps

module comparator_mare(
                       input [6:0] in0,
                       input [6:0] in1,
                       output reg out
                       );
                       
    always@(*)begin
        if(in0 > in1)
            out = 1;
        else out = 0;
    end                       
endmodule
