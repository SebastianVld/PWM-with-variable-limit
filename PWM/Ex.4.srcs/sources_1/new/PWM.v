`timescale 1ns / 1ps

module PWM #(
             parameter LIMIT_NR_REPETITIONS = 25,
             parameter LIMIT_PERIOD = 100
             )
    (
    input clk,
    input reset,
    output out
    );
    
    wire w0, w1, w2, w3, w4, w5;
    wire [6:0] count0, count1, count2;
    
    comparator_miceg comp0(
                           .in0(LIMIT_PERIOD),
                           .in1(count0),
                           .out(w0)
                           );
    
    or gate0(w1, reset, w0);
    
    counter counter0(
                     .clk(clk),
                     .reset(w1),
                     .en(1),
                     .out(count0)
                     );
     
     comparator_mare comp1(
                           .in0(count2),
                           .in1(count0),
                           .out(out)
                           );                      
     
     or gate1(w2, reset, w3);
     
     counter counter1(
                     .clk(clk),
                     .reset(w2),
                     .en(w0),
                     .out(count1)
                     );
     
     comparator_miceg comp2(
                           .in0(LIMIT_NR_REPETITIONS),
                           .in1(count1),
                           .out(w3)
                           );
     
     or gate2(w5, reset, w4);
     
     counter counter2(
                     .clk(clk),
                     .reset(w5),
                     .en(w3),
                     .out(count2)
                     );
     
     comparator_miceg comp3(
                           .in0(LIMIT_PERIOD),
                           .in1(count2),
                           .out(w4)
                           );
     
endmodule
