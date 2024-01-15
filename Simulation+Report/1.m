
% Simulation Exercise of Power Transformer Electrical Tests
% Define transformer parameters
R1 = 0.01;  % Resistance of primary winding (ohms)
L1 = 0.1;   % Inductance of primary winding (H)
R2 = 0.02;  % Resistance of secondary winding (ohms)
L2 = 0.15;  % Inductance of secondary winding (H)
M = 0.05;   % Mutual inductance (H)
C = 1e-6;   % Capacitance (F)

% Define transformer specifications
nominal_voltage = 110;  % Nominal voltage (kV)
nominal_power = 50;     % Nominal power (MVA)
frequency = 50;         % Frequency (Hz)

% Simulation parameters
timestep = 1e-5;  % Simulation time step
total_time = 0.1;  % Total simulation time

% Create a time vector
t = 0:timestep:total_time;

% Define input voltage (can be modified based on your scenario)
V_in = sin(2*pi*frequency*t);  % Sine wave input voltage

% Initialize matrices to store simulation results
I1 = zeros(size(t));
I2 = zeros(size(t));

% Initialize derivatives
dI1 = 0;
dI2 = 0;

% Simulation loop
for i = 2:length(t)
    % Calculate voltages and currents using differential equations
    dI1 = (V_in(i-1) - R1 * I1(i-1) - M * dI2) / L1;
    dI2 = (M * dI1 - R2 * I2(i-1)) / L2;

    I1(i) = I1(i-1) + dI1 * timestep;
    I2(i) = I2(i-1) + dI2 * timestep;
end

% Plot the results
figure;
subplot(2, 1, 1);
plot(t, I1, 'r', 'LineWidth', 2);
title('Current in Primary Winding');
xlabel('Time (s)');
ylabel('Current (A)');

subplot(2, 1, 2);
plot(t, I2, 'b', 'LineWidth', 2);
title('Current in Secondary Winding');
xlabel('Time (s)');
ylabel('Current (A)');
