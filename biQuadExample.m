% Import our audio file
[x,Fs] = audioread('AcGtr_1.wav');
Nyq = Fs/2;

%freqHz = 500; % frequency in Hz
%Wn = freqHz/Nyq; %Cutoff Frequency

% Filter Parameters
%Fs = 48000;
f = 1000;    % Frequency in Hz -filter frequency (cut-off or center based on filter)
Q = 0.707;   % bandwidth parameter 
dBGain = -6; % gain value on the decibel scale
% Impulse Response of Bi-quad
%x = [1;zeros(4095,1)];

% FILTER TYPE >>> lpf,hpf,pkf,apf,nch,hsf,lsf,bp1,bp2
type = 'lpf'; 
% TOPOLOGY >>> 1 = Direct Form I, 2 = II, 3 = Transposed II
form = 3; 

y = biquadFilter(x,Fs,f,Q,dBGain,type,form);

% Plot Amplitude Response of Filter
figure(1)
[h,w] = freqz(y,1,4096,Fs);
semilogx(w,20*log10(abs(h)));axis([20 20000 -20 15]);
xlabel('Frequency (Hz)'); ylabel('Amplitude (dB)');



% Filter Parameters
%Fs = 48000;
f = 1000;    % Frequency in Hz -filter frequency (cut-off or center based on filter)
Q = 0.707;   % bandwidth parameter 
dBGain = -6; % gain value on the decibel scale
% Impulse Response of Bi-quad
%x = [1;zeros(4095,1)];

% FILTER TYPE >>> lpf,hpf,pkf,apf,nch,hsf,lsf,bp1,bp2
type = 'hpf'; 
% TOPOLOGY >>> 1 = Direct Form I, 2 = II, 3 = Transposed II
form = 3; 

y = biquadFilter(x,Fs,f,Q,dBGain,type,form);

% Plot Amplitude Response of Filter
figure(2)
[h,w] = freqz(y,1,4096,Fs);
semilogx(w,20*log10(abs(h)));axis([20 20000 -20 15]);
xlabel('Frequency (Hz)'); ylabel('Amplitude (dB)');



sound(y,Fs); % Listen to the effect