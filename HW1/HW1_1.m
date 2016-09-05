%% 
%This section generate the result of 100 simulated Bernoulli trials.
x=randi([0 1],1,100);
figure(1);
hist(x,[-1:2])
xlabel('outcome')
ylabel('frequence')

%%
%This is for :
%Write a routine to count the number of successes in 5 fair Bernoulli 
%trials. Generate a histogram for 100 samples of this counting random 
%variable.
x=randi([0 1],5,100);
num=sum(x);
figure(2);
hist(num,-1:6);
xlabel('number of successes in 5 trials');
ylabel('frequence');

%%
%Write a routine to count the number of trials before the first successful
%Bernoulli trial. Generate a histogram for 100 samples of this counting 
%random.
num=zeros(100,1);
is_suc=zeros(100,1);
while(sum(is_suc)) <100
    t=randi([0 1],100,1);
    is_suc=is_suc | t;
    num=num+(is_suc~=1);
end
figure(3);
hist(num,(min(num)-1):(max(num)+1));
xlabel('number of trials before success');
ylabel('frequence')


