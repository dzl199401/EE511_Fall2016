trial_time=3000;
i=1;
for k=[2 5 10 30 50]
    trials=randi([0 1],k,trial_time);
    samples=sum(trials);
    subplot(5,1,i);
    i=i+1;
    hist(samples,min(samples)-1:max(samples)+1);
    hold on
    scaler=normcdf(0.5/(sqrt(k)*0.5))-normcdf(-0.5/(sqrt(k)*0.5));
    plot_range=min(samples)-2:0.1:max(samples)+2;
    y = gaussmf(plot_range,[sqrt(k)*0.5 0.5*k])*scaler*trial_time;
    plot(plot_range,y,'r');
    %%
    points=min(samples)-1-0.5:1:max(samples)+1+0.5
    points=points-k*0.5;
    points=points/(sqrt(k)*0.5);
    pp=normcdf(points);
    ppd=pp(2:end)-pp(1:end-1);
    bar(min(samples)-1:max(samples)+1,ppd*trial_time,'stacked','w')
    %%
    xlabel(strcat('sum(k=',num2str(k),')'));
    ylabel('num');
    hold off
end


