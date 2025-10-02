module test_traffic;
reg clk, x, start;
wire [2:0] highway, country;

// Instantiate the traffic controller
traffic_controller traffic(x, clk, highway, country, start);

// Clock generation
always #5 clk = ~clk;

// Stimulus
initial begin
  clk = 0; 
  start = 0;
  #2 start = 1;     // Start the system
  #10 x = 1;        // Country road request (highway must yield later)
  #70 x = 0;        // Request removed
end

// Monitoring and waveform dump
initial begin
  $dumpfile("traffic.vcd");        // Save waveform
  $dumpvars(0, test_traffic);      // Dump all signals
  $monitor("highway=%b, country=%b", highway, country); // Print values
  #500 $finish;                    // Stop simulation after 500 time units
end

endmodule
