module traffic_controller (x, clk, highway, country, start);

// Input signals
input x, clk, start;

// Parameters (States and Light Encodings)
parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
parameter red1 = 3'b100, yellow1 = 3'b010, green1 = 3'b001;

// Outputs
output reg [2:0] highway, country;
reg [2:0] state;

// State transition logic (FSM)
always @(posedge clk) begin
  if (start) begin
    case (state)
      s0: state <= x ? s1 : s0;   // Highway green → if request, go to yellow
      s1: state <= s2;           // Highway yellow
      s2: state <= s3;           // All red → switching
      s3: state <= x ? s3 : s4;  // Country green
      s4: state <= s0;           // Country yellow → back to highway
      default: state <= s0;
    endcase
  end
end

// Output logic
always @(state) begin
  case (state)
    s0: begin highway <= green1;  country <= red1;    end // Highway green, Country red
    s1: begin highway <= yellow1; country <= red1;    end // Highway yellow, Country red
    s2: begin highway <= red1;    country <= red1;    end // All red
    s3: begin highway <= red1;    country <= green1;  end // Country green, Highway red
    s4: begin highway <= red1;    country <= yellow1; end // Country yellow, Highway red
    default: begin highway <= green1; country <= red1; end
  endcase
end

endmodule
