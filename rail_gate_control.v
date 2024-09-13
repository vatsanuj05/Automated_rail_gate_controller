`define RED 2'd0
`define YELLOW 2'd1
`define GREEN 2'd2

// Define states
`define S0 2'd0
`define S1 2'd1
`define S2 2'd2
`define S3 2'd3

module rail_gate_controller(
    output reg [1:0] road,
    output reg [1:0] track,
    input train, clk, clr
);

    reg [1:0] state, next_state;

    // Sequential state transition
    always @(posedge clk or posedge clr) begin
        if (clr) begin
            state <= `S0; 
        end else begin
            state <= next_state; 
        end
    end

    // Combinational logic for next state based on current state and train signal
    always @(*) begin
        case (state)
            `S0:
                next_state = train ? `S1 : `S0;

            `S1: begin
            
                next_state = `S2;
            end

            `S2:
                next_state = train ? `S2 : `S3;

            `S3: begin
               
                next_state = `S0;
            end

            default: next_state = `S0;  
        endcase
    end

    // Output logic based on current state
    always @(*) begin
        case (state)
            `S0: begin
                road = `GREEN; 
                track = `RED;
            end

            `S1: begin
                road = `YELLOW;  
                track = `RED;
            end

            `S2: begin
                road = `RED;  
                track = `GREEN;
            end

            `S3: begin
                road = `RED; 
                track = `YELLOW;
            end

            default: begin
                road = `GREEN;  
                track = `RED;
            end
        endcase
    end

endmodule
