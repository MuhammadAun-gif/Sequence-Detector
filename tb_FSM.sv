module tb_FSM;

    // Testbench signals
    logic clk;
    logic reset;
    logic w;
    logic y;

    // Instantiate the FSM module
    FSM dut (
        .clk(clk),
        .reset(reset),
        .w(w),
        .y(y)
    );

    // Clock generation (50 MHz, period = 20 ns)
    always #50 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        w = 0;

        // Apply reset
        #100;
        reset = 0;

        // Test case 1: Input pattern that doesn’t match (00000000)
        w = 0; #100;
        w = 0; #100;
        w = 0; #100;
        w = 0; #100;
        w = 0; #100;
        w = 0; #100;
        w = 0; #100;
        w = 0; #100;
    

        // Test case 2: Apply the pattern 01111110 (should detect here)
        w = 0; #100;
        w = 1; #100;
        w = 1; #100;
        w = 1; #100;
        w = 1; #100;
        w = 1; #100;
        w = 1; #100;
        w = 0; #100;
    
        // Test case 3: Apply a similar pattern (01111111) (should not detect)
        w = 0; #100;
        w = 1; #100;
        w = 1; #100;
        w = 1; #100;
        w = 1; #100;
        w = 1; #100;
        w = 1; #100;
        w = 1; #100;

        // Test case 4: Random sequence
        w = 1; #100;
        w = 0; #100;
        w = 1; #100;
        w = 1; #100;
        w = 0; #100;
        w = 1; #100;
        w = 1; #100;
        w = 0; #100;
        
        // Test case 5: Apply the pattern 01111110 again to verify detection
        w = 0; #100; 
        w = 1; #100;
        w = 1; #100;
        w = 1; #100;
        w = 1; #100;
        w = 1; #100;
        w = 1; #100;
        w = 0; #100;


        // End simulation
        #1000;
        $finish;
    end

endmodule
