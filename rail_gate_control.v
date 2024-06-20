`define RED 2'd0
`define YELLOW 2'd1
`define GREEN 2'd2

// define states
`define S0 2'd0
`define S1 2'd1
`define S2 2'd2
`define S3 2'd3

//delay
`define DELAY 2

module rail_gate_controller(output reg [1:0] road,track,input train,clk,clr);
reg [1:0] state,next_state;

initial begin
    state=`S0;
    next_state=`S0;
    road=`GREEN;
    track=`RED;
end

always @(posedge clk)
state=next_state;

always @(state)
begin
    case(state)

    `S0:begin
        road=`GREEN;
        track=`RED;
        end

    `S1:begin
        road=`YELLOW;
        track=`RED;
        end

    `S2:begin
        road=`RED;
        track=`GREEN;
        end
      
    `S3:begin
        road=`RED;
        track=`YELLOW;
        end
        
    endcase
end

always @(state or train or clr) begin
    if(clr)
    next_state=`S0;
    else
    case(state)

    `S0:if(train)
    next_state=`S1;
    else
    next_state=`S0;

    `S1:begin
        repeat(`DELAY)@(posedge clk);
        next_state=`S2;
    end

    `S2:if(train)
    next_state=`S2;
    else
    next_state=`S3;

    `S3:begin
        repeat(`DELAY)@(posedge clk);
        next_state=`S0;
    end
    default : next_state=`S0;
    endcase
end
endmodule