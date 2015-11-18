clear, clc

% get a section of the sound file
[x,fs] = wavread('3.wav');
x = x(:,1);             % get the first channel
xmax = max(abs(x));     % find the maximum value
x = x/xmax;             % scalling the signal

% time & discretisation parameters
N = length(x);
t = (0:N-1)/fs; 


% computing of the autocorrelation
[Rx, lags] = xcorr(x, 'coeff');
d = lags/fs;

% plotting of the autocorrelation

plot(d, Rx, 'r')
grid on
xlim([-max(d) max(d)])
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Delay, s')
ylabel('Autocorrelation')
title('Autocorrelation of the signal')
line([-max(abs(d)) max(abs(d))], [0.02 0.02], 'Color', 'k', 'LineWidth', 2, 'LineStyle', '--');


% Sigma and Mu estimation
[u s] = normfit(x);
sigma = num2str(s);
mu = num2str(u);
disp(['Sigma = ' sigma])
disp(['Mu = ' mu])

% computing of the peak (crest) factor
rms = sqrt(mean(x.^2));
peak = max(abs(x));
Q = 20*log10(peak/rms);
Qstr = num2str(Q);
disp(['Peak (crest) factor Q = ' Qstr ' dB'])

% computing of the dynamic range 
x(x==0) = [];
maxval = peak;
minval = min(abs(x));
D = 20*log10(maxval/minval);
Dstr = num2str(D);
disp(['Dynamic range D = ' Dstr ' dB'])

% computing of the autocorrelation time
ind = find(Rx>0.02, 1, 'last');
RT = (ind-N)/fs;
RTstr = num2str(RT);
disp(['Autocorrelation time = ' RTstr ' sec'])