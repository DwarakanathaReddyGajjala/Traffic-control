# traffic-light-controller

## Overview
This project implements a traffic light controller using a Finite State Machine (FSM) in Verilog HDL.

The controller manages two roads: a highway (main road) and a country road (side road).
- Default behavior: Highway remains green, country remains red.
- If a vehicle is detected on the country road (x=1), the controller transitions through safe states to allow country road traffic.
- The design ensures smooth transitions and prevents collisions using 5 FSM states. 

FSM States:
- **s0**: Highway Green, Country Red (default, highway free flow)
- **s1**: Highway Yellow, Country Red (highway cars warned)  
- **s2**: Highway Red, Country Red (all stop for safety) 
- **s3**: Highway Red, Country Green (country traffic moves)
- **s4**: Highway Red, Country Yellow (country cars warned before switching back)

---

##  Files
1. `traffic_controller.v` – Verilog design of the traffic light controller (FSM-based)
2. `test_traffic.v` – Testbench for simulating the traffic controller operation

---

##  How to Run
### Option 1: Locally with Icarus Verilog
1. Install **Icarus Verilog (iverilog)** and **GTKWave** (for waveform viewing).  
2. Compile and run with:  
```sh

iverilog -o traffic  traffic_controller.v test_traffic.v
vvp traffic

```
### Option 2: Online with EDA Playground
1.  Go to [EDA Playground](https://www.edaplayground.com/)  
2. Paste the code from traffic_controller.v and test_traffic.v.
3. Select Icarus Verilog (iverilog) as the simulator.
4. Run the simulation to see console output and waveforms.
