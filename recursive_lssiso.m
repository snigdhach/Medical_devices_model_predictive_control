obj = recursiveLS(2);
% Load the estimation data, which for this example is a static data set.

load('Uea_data.mat') 
input =TemperProfile(:,2);
output = TemperProfile(:,3);
% Create a variable to store u(t-1). This variable is updated at each time step.

oldInput = 0;
% Estimate the parameters and output using step and input-output data, maintaining the current regressor pair in H. Invoke the step function implicitly by calling the obj system object with input arguments.

for i = 1:numel(input)
    H = [input(i) oldInput];
    [theta, EstimatedOutput] = obj(output(i),H);
    estimatedOut(i)= EstimatedOutput;
    theta_est(i,:) = theta;
    oldInput = input(i);
end
% Plot the measured and estimated output data.
hold on
numSample = 1:numel(input);
plot(numSample,output,'b',numSample,estimatedOut,'r--');
legend('Measured Output','Estimated Output');