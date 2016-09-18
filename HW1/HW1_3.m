load NJGAS.dat;
resample_size=length(NJGAS);
sample_mean=mean(NJGAS);
% Resample the data for 1000 times.
resample_time=10000;
index=randi([1 resample_size],resample_time,resample_size);
resampled_data=NJGAS(index);
% Calculate the confidence interval.
erd=sum(resampled_data,2)/resample_size-sample_mean;
erd_sorted=sort(erd);
delta=erd_sorted(fix([0.025 0.975]*resample_time));
int=sample_mean-[delta(2) delta(1)];
int2=sample_mean+[delta(1) delta(2)]
disp(strcat('The 95% interval is [',num2str(int(1)),', ',num2str(int(2)),']'));