clear,clc
[x,fs] = wavread('3.wav');
x = x(:,1);             % get the first channel
xmax = max(abs(x));     % find the maximum value
x = x/xmax;             % scalling the signal
N = length(x);
t = (0:N-1)/fs; 




histfit(x)
xlim([-1.1*max(abs(x)) 1.1*max(abs(x))])
grid on
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Signal amplitude')
ylabel('Number of samples')
title('Probability distribution of the signal')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
legend('probability distribution of the signal', 'standard normal distribution')