# Autonomous-Altitude-of-Tello-drone
A research-driven project integrating system identification, computer vision, and embedded control to model drone dynamics, compensate Wi-Fi and vision delays, and implement PD, I-PD, and Smith Predictor controllers for stable real-time autonomous flight.

#Overview
The Ryze Tello is a lightweight educational drone with a built-in camera, barometer, and Wi-Fi-based SDK. In this project, altitude-related motion is controlled using an vision-based feedback loop, where the drone’s state is observed through a camera feed and processed on an external computer.

The project focuses on:

Real flight data collection and system identification.

Mathematical modeling of drone altitude dynamics.

Delay analysis caused by Wi-Fi communication and vision processing.

Design of PD, I-PD, and Smith Predictor-based controllers.

Simulation and validation in MATLAB/Simulink.

Real-time autonomous control using Python and YOLO.

This work connects control theory with practical autonomous drone implementation under real-world delay constraints.

Key Features
Real-world system identification using flight test data.

Transfer function modeling of the Tello altitude dynamics.

Time-delay modeling for communication and vision-processing latency.

Controller design using:

PD control

I-PD control

Smith Predictor-based I-PD control

MATLAB/Simulink-based simulation and validation.

Python implementation for real-time execution.

YOLO-based visual tracking for feedback generation.

Tello SDK integration for autonomous command sending.

Disturbance rejection and tracking performance evaluation.

System Architecture
The system follows an off-board closed-loop control architecture:

A visual target is detected in the camera stream using YOLO.

The target’s pixel position is compared with a reference position.

The error is used by the controller to compute a control signal.

The command is transmitted to the drone through Wi-Fi using the Tello SDK.

The drone adjusts its altitude accordingly.

The process repeats continuously in closed loop.

Because the loop includes wireless transmission and external computation, delay compensation is essential for stable performance.

Project Objectives
Develop an autonomous altitude control system for the Ryze Tello drone.

Derive a mathematical model of the drone using experimental data.

Analyze and compensate for communication and processing delays.

Design controllers that improve tracking and stability.

Validate controller behavior through simulation and real flight tests.

Demonstrate the transition from theoretical control design to live implementation.

Hardware and Tools Used
Hardware
Ryze Tello drone

Laptop / PC for off-board processing

Indoor test setup

Visual reference target

Software and Libraries
Python

MATLAB / Simulink

YOLOv8

Tello SDK

CSV-based logging and analysis tools

Control and Modeling Methods
System identification

Frequency-response analysis

Pole placement

PD and I-PD control

Smith Predictor

Closed-loop simulation

Disturbance rejection analysis

Experimental Setup
The drone was tested in a controlled indoor environment. A visual reference target was placed in front of the camera, and the onboard video stream was processed in real time.

Data Collection Methods
Step response test: a constant throttle command was applied and the altitude response was recorded.

Non-periodic input test: varying throttle commands were applied to excite a wider frequency range of the drone dynamics.

The collected data was saved as CSV and used for system identification in MATLAB.

System Identification
The measured flight data was used to identify a transfer function model of the Tello altitude dynamics.

Important observations
Real data showed a noticeable time delay caused by:

Wi-Fi communication

YOLO-based processing

The delay was measured from experimental response plots.

The identified model achieved a strong fit with the recorded data.

Identified model characteristics
First/second-order dynamic behavior

Transport delay term

Good agreement between measured and modeled response

Sufficient accuracy for controller design and validation

Controller Design
1. PD Controller
The PD controller was designed to improve transient response and reduce oscillations.

Advantages

Simple structure

Better damping

Improved stability

Limitation

Cannot eliminate steady-state error under constant disturbances

2. I-PD Controller
The I-PD controller adds integral action to remove steady-state offset.

Advantages

Better disturbance rejection

Eliminates steady-state error

Improved tracking performance

Limitation

Performance degrades when time delay becomes significant

3. I-PD with Smith Predictor
To handle delay effects, a Smith Predictor was added.

Why it was needed

Delay caused sluggish response, oscillation, and instability

Standard feedback reacts to outdated measurements

Smith Predictor uses an internal model to estimate the near-future output

Benefits

Reduces impact of delay in the feedback loop

Improves smoothness and tracking

Enhances stability in real-time autonomous flight

Simulation Results
The controller designs were tested in MATLAB/Simulink under different conditions:

Step tracking

Disturbance rejection

Delay-free control

Control with transport delay

Control with Smith Predictor

Observed behavior
PD control improved damping but left steady-state error.

I-PD improved reference tracking and rejected disturbances better.

Delay introduced performance degradation.

Smith Predictor significantly improved delayed-system behavior.

Real-Time Implementation
The final system was implemented in Python using:

YOLO object detection for visual tracking

Tello SDK for drone command transmission

Control logic for autonomous altitude adjustment

Delay-aware feedback correction

This implementation demonstrated how a model-based controller can be moved from simulation to live autonomous control in a real drone system.

Results Summary
The project showed that:

A data-driven transfer function can model drone altitude dynamics effectively.

Standard controllers work well only when delay is small.

Delay severely affects stability and tracking performance.

Smith Predictor-based control provides a practical solution for delayed systems.

Visual-feedback control is feasible for low-cost autonomous drone platforms.

What This Project Demonstrates
This project is useful for anyone studying or working in:

Drone control systems

Autonomous robotics

Vision-based feedback systems

System identification

Real-time embedded control

Delay compensation in control engineering

It demonstrates how theoretical ideas from control engineering can be applied to a real drone using accessible tools and a lightweight hardware platform.
