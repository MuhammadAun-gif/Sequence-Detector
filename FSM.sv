module FSM(input logic clk,reset,w,
            output logic y);
    
    //                        assigns S0 = 0000, S1 = 0001 and so on.
    typedef enum logic [3:0] {S0,S1,S2,S3,S4,S5,S6,S7,S8} statetype;
    statetype state, nextstate;

    // Creating State Register.
    always_ff @(posedge clk) begin 
        if(reset)   state <= S0;
        else        state <= nextstate;
    end

    // Creating Next State Logic

    always_comb begin
        y = 1'b0;
        case(state)
            S0: if(w)   nextstate = S0;
                else    nextstate = S1;

            S1: if(w)   nextstate = S2;
                else    nextstate = S1;

            S2: if(w)   nextstate = S3;
                else    nextstate = S1;

            S3: if(w)   nextstate = S4;
                else    nextstate = S1;

            S4: if(w)   nextstate = S5;
                else    nextstate = S1;

            S5: if(w)   nextstate = S6;
                else    nextstate = S1;

            S6: if(w)   nextstate = S7;
                else    nextstate = S1;

            S7: if(w)   nextstate = S0;
                else    nextstate = S8;
                         

            S8: begin
                y = 1'b1;
                if(w)   nextstate = S0;
                else    nextstate = S1; 
                end
            
        endcase
    end
    
endmodule
