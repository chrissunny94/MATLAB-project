
clear,clc
[x,fs] = wavread('3.wav');
x = x(:,1);             % get the first channel
xmax = max(abs(x));     % find the maximum value
x = x/xmax;             % scalling the signal



spectrogram(x, 1024, 3/4*1024, [], fs, 'yaxis')
h = colorbar;
set(h, 'FontName', 'Times New Roman', 'FontSize', 14)
ylabel(h, 'Magnitude, dB');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('Time, s')
ylabel('Frequency, Hz')
title('Spectrogram of the signal')