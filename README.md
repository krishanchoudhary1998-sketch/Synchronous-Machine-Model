# Synchronous-Machine-Model
Modeled a high-power synchronous machine using dq0 transformation to capture both electrical and mechanical dynamics. I analyzed torque, speed, flux, and the machine’s behavior during transients and steady operation under different excitation levels.

This repository contains three main components:

**1. Project Report**
Located in the report/ folder.
This document explains the system design, modeling approach, control strategies, simulation workflow and key results. It provides the theory and methodology behind the model.

**2. Parameter File**

Located in the Parameter synchronous machine submission.m file.
It stores all the constants used in the simulation, such as Parameters used for the controller, Motor Parameters, Internal backstepping control, sliding mode observer contrant etc.
You can modify these values to test different configurations without changing the main model.

**3. MATLAB Simulink Model**

Located in Synchronous Machine model Simulation.slx.
This is the complete Simulink implementation of the system.
Run the model directly in Simulink after loading the parameter file.
