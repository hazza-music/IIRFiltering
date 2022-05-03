% BASICFILTERBANK
% This script creates a two-band filterbank using
% a LPF and HPF. The butterworth filter design
% function is used to create the LPF and HPF,
% both with the same cut-off frequency.
% The magnitude response of each filter is 
% plotted together.
% 
% See also BUTTER, FREQZ

Fs = 48000;
Nyq = Fs/2;
n = 8;
Wnh = 1000/Nyq; % Cutoff Frequency High Pass
Wnl = 300/Nyq;  % Cutoff Frequency Low Pass


[bLow,aLow] = butter(n,Wnl);
[bHi,aHi] = butter(n,Wnh,'high');

[hLow,w] = freqz(bLow,aLow,4096,Fs);
[hHi] = freqz(bHi,aHi,4096,Fs);

semilogx(w,20*log10(abs(hLow)),w,20*log10(abs(hHi)));
axis([20 20000 -24 6]);
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
legend('LPF','HPF');
