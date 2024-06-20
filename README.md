# Automated_rail_gate_controller

Overview
This project involves the design and simulation of an Automated Rail Gate Controller using Verilog. The purpose of this system is to manage the opening and closing of a railway gate based on the presence or absence of a train, ensuring safety at railway crossings.

**Project Structure**
The project consists of two main components:

Main Module (rail_gate_controller.v)
1.Testbench Module (rail_gate_controller_tb.v)

2.Main Module: rail_gate_controller.v


The main module implements the logic for the automated rail gate controller. It takes inputs from sensors placed at strategic points on the track to detect an approaching or departing train. Based on these inputs, the module controls the gate's position—opening it when no train is present and closing it when a train is detected.

**Features:**

Detection of approaching and departing trains.
Control signals for opening and closing the gate.
Safety mechanisms to ensure the gate operates correctly.


Testbench Module: rail_gate_controller_tb.v
The testbench module is used to verify the functionality of the main module. It simulates different scenarios such as a train approaching, a train passing, and a train departing. The testbench checks if the gate controller responds correctly to each scenario.

Features:

Simulates various train scenarios.
Verifies the gate controller's response.
Uses $monitor and other system tasks to observe the behavior of the main module during simulation.
Simulation and Verification
The design was simulated using Icarus Verilog and the results were verified using GTKWave. The simulation confirmed that the rail gate controller correctly responds to train detection inputs and operates the gate as expected.
