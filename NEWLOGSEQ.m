z=daq.createSession('ni');
z.addDigitalChannel('Dev1','port2/line0' , 'OutputOnly');
z.addDigitalChannel('Dev1','port0/line4' , 'OutputOnly');
h = actxcontrol('LASOMX.LASOMXCtrl.1');
resultOpen = invoke(h, 'DevOpen', 0, 1);
invoke(h,'SetMfcFlowRate', 1, 1, 90);
invoke(h,'SetMfcFlowRate', 1, 2, 100);
randomize=true;
repetitions=2;
valves=[2 3 4 5 6 7 8 9 10];
prestimulus=10;
stimulus=2;
poststimulus=11;
interstimulus=40;


for i=1:repetitions
    if (randomize)
    valves=randperm(length(valves));
    end
for j=1:numel(valves)
z.outputSingleScan([0 1]);
pause(0.001);
z.outputSingleScan([0 0]);
pause(0.5)
z.outputSingleScan([1 0]);
pause(0.001);
z.outputSingleScan([0 0]);
    pause(prestimulus-1);
invoke(h, 'SetOdorValve', 1, 5, 1);
pause(1);
invoke(h, 'SetGateValve2', 1, 31, 1, 1);
invoke(h, 'SetDigOut', 1 ,1 ,0)
pause(stimulus);
invoke(h, 'SetOdorValve', 1, 5, 0);
invoke(h, 'SetGateValve2', 1, 31, 0, 1);
invoke(h, 'SetDigOut', 1 ,0 ,0)
pause(poststimulus);
tic
dlmwrite('seq.csv',valves, '-append');
del=toc
pause(interstimulus-del);
end
end