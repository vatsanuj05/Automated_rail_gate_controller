`include "rail_gate_control.v"
module control_tb;
    wire [1:0] road, track;
    reg train, clk, clr;

  
    rail_gate_controller sig(road, track, train, clk, clr);

    
    initial
        $monitor($time, " Train detected=%b | Road=%b | Track=%b", train, road, track);

    // Generate a clock with a period of 20 time units
    initial begin 
        clk = 1'b0;
        forever #10 clk = ~clk;
    end

   
    initial begin
        clr = 1'b1;  
        repeat(5) @(negedge clk); 
        clr = 1'b0; 
    end

    // Generate train signal at specific intervals
    initial begin
        train = 1'b0;
        #200 train = 1'b1;  
        #100 train = 1'b0;  
        #200 train = 1'b1;  
        #100 train = 1'b0;
        #200 train = 1'b1;
        #100 train = 1'b0;
        #200 train = 1'b1;
        #100 train = 1'b0;
        #100 $finish;  
    end

    
    initial begin
        $dumpfile("rail.vcd");
        $dumpvars(0, control_tb);
    end
endmodule
