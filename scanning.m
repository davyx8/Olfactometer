function [done]= scanning()
global mydata
global valveOpen 
valveOpen=0;
mydata=[]
vec=fix(clock)
str=sprintf('LOG%d_%d_%d_%d_%d_%d.csv',[fliplr(vec(1:3)) vec(4:6)])
x=daq.createSession('ni');
y=daq.createSession('ni');
x.addAnalogInputChannel('Dev1',{'ai0', 'ai8','ai4','ai12'},'Voltage');
y.addDigitalChannel('Dev1','port0/line3' , 'InputOnly');
%z.addDigitalChannel('Dev1','port2/line0' , 'OutputOnly');
x.DurationInSeconds=23;
%pause(10)
iterations=18;
for i=1:iterations
while(true)
q=y.inputSingleScan();
if(q==1)
    break;
end
end
[DATA,TIMESTAMPS,TRIGGERTIME]=x.startForeground();
mydata=[DATA];
dlmwrite(str,mydata, '-append');
end