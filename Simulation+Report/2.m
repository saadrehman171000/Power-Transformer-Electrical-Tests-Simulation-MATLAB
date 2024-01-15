% 6. Develop Case Scenarios:

% Scenario 1: No Faults (Normal Operation)
I1_scenario1 = zeros(size(t));
I2_scenario1 = zeros(size(t));

for i = 2:length(t)
    dI1 = (V_in(i-1) - R1 * I1_scenario1(i-1) - M * dI2) / L1;
    dI2 = (M * dI1 - R2 * I2_scenario1(i-1)) / L2;

    I1_scenario1(i) = I1_scenario1(i-1) + dI1 * timestep;
    I2_scenario1(i) = I2_scenario1(i-1) + dI2 * timestep;
end

% Plot Scenario 1
figure;
subplot(2, 1, 1);
plot(t, I1_scenario1, 'r', 'LineWidth', 2);
title('Scenario 1: No Faults (Normal Operation)');
xlabel('Time (s)');
ylabel('Current (A)');

subplot(2, 1, 2);
plot(t, I2_scenario1, 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Current (A)');

% Scenario 2: Winding Fault in Primary Winding
I1_scenario2 = zeros(size(t));
I2_scenario2 = zeros(size(t));

for i = 2:length(t)
    % Introduce winding fault in primary winding
    if t(i) > 0.02 && t(i) < 0.03
        V_in(i) = 0;  % Simulate a short circuit in the primary winding
    end

    dI1 = (V_in(i-1) - R1 * I1_scenario2(i-1) - M * dI2) / L1;
    dI2 = (M * dI1 - R2 * I2_scenario2(i-1)) / L2;

    I1_scenario2(i) = I1_scenario2(i-1) + dI1 * timestep;
    I2_scenario2(i) = I2_scenario2(i-1) + dI2 * timestep;
end

% Plot Scenario 2
figure;
subplot(2, 1, 1);
plot(t, I1_scenario2, 'r', 'LineWidth', 2);
title('Scenario 2: Winding Fault in Primary Winding');
xlabel('Time (s)');
ylabel('Current (A)');

subplot(2, 1, 2);
plot(t, I2_scenario2, 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Current (A)');

% Scenario 3: Core Fault
I1_scenario3 = zeros(size(t));
I2_scenario3 = zeros(size(t));

for i = 2:length(t)
    % Introduce core fault
    if t(i) > 0.05 && t(i) < 0.06
        M = 0;  % Simulate a breakdown in the core
    end

    dI1 = (V_in(i-1) - R1 * I1_scenario3(i-1) - M * dI2) / L1;
    dI2 = (M * dI1 - R2 * I2_scenario3(i-1)) / L2;

    I1_scenario3(i) = I1_scenario3(i-1) + dI1 * timestep;
    I2_scenario3(i) = I2_scenario3(i-1) + dI2 * timestep;
end

% Plot Scenario 3
figure;
subplot(2, 1, 1);
plot(t, I1_scenario3, 'r', 'LineWidth', 2);
title('Scenario 3: Core Fault');
xlabel('Time (s)');
ylabel('Current (A)');

subplot(2, 1, 2);
plot(t, I2_scenario3, 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Current (A)');
