% FILTEREXAMPLE - From Hack Audio
%
% This script demonstrates how to use a built-in, IIR
% filter design function to create the impulse response
% for a LPF. Then, the filtering is performed on an
% audio signal using the "filter" function.
%
% See also BUTTER, FILTER

% Import our audio file
[x,Fs] = audioread('AcGtr_1.wav');
Nyq = Fs/2;

m = 4; % Order of the Filter

freqHz = 500; % frequency in Hz
Wn = freqHz/Nyq; %Cutoff Frequency

[b,a] = butter(m,Wn);

y = filter(b,a,x);

sound(y,Fs); % Listen to the effect