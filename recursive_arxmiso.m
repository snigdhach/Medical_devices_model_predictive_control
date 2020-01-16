na = 10;
nb = [10 10];
nk = [1 1];
load iddata1 z1;
output = z1.y;
input = [z1.u;z1.u];
obj = recursiveARX([na nb nk],'EstimationMethod','Kalmanfilter');
for i = 1:numel(input)/2
[A,B,EstimatedOutput] = step(obj,output(i),[input(i);input(i+300)]);
Estimatedoutput(i)=EstimatedOutput;
end
hold on
numSample = 1:numel(input)/2;
plot(numSample,output,'r--',numSample,Estimatedoutput,'b');
legend('Measured Output','Estimated Output');