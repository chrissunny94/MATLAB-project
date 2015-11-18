clear,clc
files=dir('wav\*.wav');
song=strcat('wav\',files(1).name)
[x,fs] = wavread(song);
x = x(:,1);             % get the first channel
xmax = max(abs(x));     % find the maximum value
x = x/xmax;             % scalling the signal
N = length(x);
t = (0:N-1)/fs; 


win = hanning(N);       % window
K = sum(win)/N;         % coherent amplification of the window
X = abs(fft(x.*win))/N; % FFT of the windowed signal
NUP = ceil((N+1)/2);    % calculate the number of unique points
X = X(1:NUP);           % FFT is symmetric, throw away second half 
if rem(N, 2)            % odd nfft excludes Nyquist point
  X(2:end) = X(2:end)*2;
else                    % even nfft includes Nyquist point
  X(2:end-1) = X(2:end-1)*2;
end
f = (0:NUP-1)*fs/N;     % frequency vector
X = 20*log10(X);        % spectrum magnitude

semilogx(f, X, 'r')
xlim([0 max(f)])
grid on
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
title('Amplitude spectrum of the signal')
xlabel('Frequency, Hz')
ylabel('Magnitude, dB')
