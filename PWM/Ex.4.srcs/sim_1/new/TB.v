`timescale 1ns / 1ps

module TB();

    reg clk, reset;
    wire out;
    
    PWM #(.LIMIT_NR_REPETITIONS(10),
          .LIMIT_PERIOD(4)
          )
          DUT(
              .clk(clk),
              .reset(reset),
              .out(out)  
              );
              
    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end  
    
    initial begin
            reset = 1;
        #10
            reset = 0;
        #1000
            $stop();
    end                  
              
endmodule
