function gapChecker(str)
strR=[str '/scanLog.csv']
data=dlmread(strR)

VarName5=data(:,5);
ind=(VarName5==1);
ind2=(VarName5==2);
ind3=(VarName5==3);

ind=[0 ;ind]

gap=[(find(diff(ind)==-1))-(find(diff(ind)==1))] 
gap2=[(find(diff(ind2)==-1))-(find(diff(ind2)==1))] 
if (numel(find(diff(ind3)==-1))== numel(find(diff(ind3)==1)) )
gap3=[(find(diff(ind3)==1))-(find(diff(ind3)==-1))] 
else
    size(find(diff(ind3)==-1))
size(find(diff(ind3)==1))
    gap3=[[(find(diff(ind3)==-1)) ;0]-(find(diff(ind3)==1))]
end

gapstr=[str 'gap.csv']
dlmwrite(gapstr,gap','-append')
dlmwrite(gapstr,gap2','-append')
dlmwrite(gapstr,gap3','-append')
end