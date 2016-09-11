load NJGAS.dat;
resample_size=length(NJGAS);
resample_time=1000;
index=randi([1 12],resample_time,resample_size);
resampled_data=NJGAS(index);
erd=sum(resampled_data,2)/resample_size;
erd_sorted=sort(erd);
int=erd_sorted(fix([0.25 0.975]*resample_time));
disp(strcat('The 95% interval is [',num2str(int(1)),', ',num2str(int(2)),']'));