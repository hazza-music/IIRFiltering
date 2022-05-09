%BLT of a Bandpass
% upper cutoff 

fs = 8000; % Sampling rate (Hz)
[B, A] = lp2bp([1],[1 1],23978.93027, 4086.88927);
% Lowpass to bandpass - prototype function is the low pass

%b = [0.3660 0.3660]; % numerator coefficients of the digital filter from MATLAB
%a = [1 -0:2679];% denominator coefficients of the digital filter from MATLAB
[b, a] = bilinear(B, A, fs); % This function does the BLT if you want to skip the maths

[hz, f] = freqz(b,a,512,fs);%the frequency response
phi = 180*unwrap(angle(hz))/pi;
subplot(2,1,1), plot(f, abs(hz)),grid;
axis([0 fs/2-40 10]);
xlabel('Frequency (Hz)'); ylabel('Magnitude Response')
subplot(2,1,2), plot(f, phi); grid;
axis([0 fs/2 -40 10]);
xlabel('Frequency (Hz)'); ylabel('Phase (degrees)')