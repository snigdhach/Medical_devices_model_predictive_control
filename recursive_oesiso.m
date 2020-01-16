load('Uea_data.mat');
data=[TemperProfile(:,3)];
obj = recursiveOE([20 20 1],'EstimationMethod','Kalmanfilter');
input=[TemperProfile(:,2)];
bodytemperature=37;
Estimatedoutput=zeros(numel(input),1);
temp=zeros(1010,1);
for i = 1:numel(input)
if abs(input(i))==0
    temp(i)=0;
else
    temp(i)=input(i)./abs(input(i));
end
[B,F,EstimatedOutput] = step(obj,data(i),temp(i));
Estimatedoutput(i)=EstimatedOutput;
end
figure()
 plot([TemperProfile(:,1)],Estimatedoutput)
hold on
plot([TemperProfile(:,1)],[TemperProfile(:,3)],'r--')
legend('Estimated Output','Measured Output');