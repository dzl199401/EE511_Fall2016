trial_time = 3000;
i = 1;
SAMPLE_MEAN = 2.5;
SAMPLE_VAR = 1.25;
for k=[2 5 10 30 50]
    %%
    % This section generates 300 such sums and histogram the results.
    trials = randi([0 1], k, trial_time, 5); % Generate the 5 successes Bernoulli trial.
    trials = sum(trials,3);
    samples = sum(trials);
    subplot(5,1,i);
    i = i + 1;
    [counts, centers] = hist(samples,(min(samples)-1):(max(samples)+1));
    bar(centers, counts);
    %%
    % This section plot the expected frequency from the Gaussian
    %distribution as a comparison to the result.
    hold on
    plot_range = (min(samples)-2):0.1:(max(samples)+2);
    y = pdf('Normal', plot_range, SAMPLE_MEAN*k, sqrt(k)*SAMPLE_VAR) * trial_time;
    plot(plot_range,y,'r');
    points = min(samples)-1-0.5:1:max(samples)+1+0.5;
    points = points-k*SAMPLE_MEAN;
    points = points/(sqrt(k)*SAMPLE_VAR);
    pp = normcdf(points);
    ppd = pp(2:end)-pp(1:end-1);
    bar(min(samples)-1:max(samples)+1,ppd * trial_time,0.5,'w');
    %%
    xlabel(strcat('sum(k=',num2str(k),')'));
    ylabel('num');
    hold off
end


