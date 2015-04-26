z=daq.createSession('ni');
z.addDigitalChannel('Dev1','port2/line0' , 'OutputOnly');
z.addDigitalChannel('Dev1','port0/line4' , 'InputOnly');
done=true;
TrigLimit=10;
TrigNum=1;
nameS='test.csv'
while(true)
if(done)
   curr=z.inputSingleScan();
else
    continue;
end
if(curr==1)
    display(sprintf('Trigger number : %d',TrigNum))
    %return;
    done=false;
    z.outputSingleScan(1);
    pause(0.001);
    z.outputSingleScan(0);c
    done=Trial(TrigNum,nameS)
    TrigNum=TrigNum+1;
end
if(TrigNum>TrigLimit)
return;
end
end





   