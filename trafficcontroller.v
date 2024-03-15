// This module implements a traffic light controller with 5 states.
module traffic (x, clk, highway, country, start);

// Input signals
input x, clk, start;

// Parameters
parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
parameter red1 = 100, yellow1 = 010, green1 = 001;

// Output signals
output reg [2:0] highway, country;
reg [2:0] state;

// Always block that updates the state of the traffic light controller
always @(posedge clk)
begin
  if (start)
  begin
    // Case statement that updates the state of the traffic light controller
    case (state)
      s0: state <= x ? s1 : s0;
      s1: state <= s2;
      s2: state <= s3;
      s3: state <= x ? s3 : s4;
      s4: state <= s0;
      default: state <= s0;
    endcase
  end
end

// Always block that sets the values of the highway and country lights
always @(state)
begin
  case (state)
    s0: begin
      // Set the highway and country lights to green and red, respectively
      highway <= green1;
      country <= red1;
    end
    s1: begin
      // Set the highway light to yellow and the country light to red
      highway <= yellow1;
      country <= red1;
    end
    s2: begin
      // Set the highway and country lights to red
      highway <= red1;
      country <= red1;
    end
    s3: begin
      // Set the country light to green and the highway light to red
      highway <= red1;
      country <= green1;
    end
    s4: begin
      // Set the country light to yellow and the highway light to red
      highway <= red1;
      country <= yellow1;
    end
    default: begin
      // Set the highway and country lights to green
      highway <= green1;
      country <= red1;
    end
  endcase
end

endmodule