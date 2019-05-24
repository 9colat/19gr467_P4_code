tic
if exist('fs','var')==0
load('compdata.mat')
end
close all
%clc;
speed=340;

micPos = [  0.0420    0.0615   -0.0410;  % mic 1
           -0.0420    0.0615    0.0410;  % mic 2
           -0.0615    0.0420   -0.0410;  % mic 3
           -0.0615   -0.0420    0.0410;  % mic 4
           -0.0420   -0.0615   -0.0410;  % mic 5
            0.0420   -0.0615    0.0410;  % mic 6
            0.0615   -0.0420   -0.0410;  % mic 7
            0.0615    0.0420    0.0410]; % mic 8

rx_pos = transpose(micPos);

rx_norm = [
    [-135, -135, 135, 135, -45, -45,  45, 45];
    [ -45,   45, -45,  45, -45,  45, -45, 45];
];

rx = phased.ConformalArray( ...
    'Element', phased.OmnidirectionalMicrophoneElement,...
    'ElementPosition', rx_pos,...
    'ElementNormal', rx_norm ...
    ...
);

 %figure
 %rx.viewArray( ...s
 %    'ShowNormals', true, ...
 %    'ShowIndex', 1:8 ...
 %)
 factor = 15;
 lowfs = 44100/factor;
doa = phased.GCCEstimator( 'SensorArray', rx, 'SampleRate', lowfs, 'PropagationSpeed', speed );

Fstop1 = 200;         % First Stopband Frequency
Fpass1 = 300;         % First Passband Frequency
Fpass2 = 8000;        % Second Passband Frequency
Fstop2 = 10000;       % Second Stopband Frequency
Astop1 = 60;          % First Stopband Attenuation (dB)
Apass  = 1;           % Passband Ripple (dB)
Astop2 = 60;          % Second Stopband Attenuation (dB)
match  = 'passband';  % Band to match exactly

% Construct an FDESIGN object and call its ELLIP method.
h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, Astop2, fs);
Q = design(h, 'ellip', 'MatchExactly', match);


g=10000;
file=1;
%asd=size(dev_static_speech.wav{3},1);
wav=dev_static_speech.wav{file};
L=size(wav,1);
le=fs*0.2;
%for j=1:floor(L/le)
s=(j-1)*le+1;
e=le*j;
con=snr(wav(:,1),data(L+1:2*L,1));
sner=0;
sig=wav(:,:)+data(L+1:2*L,:).*1/10^((-con+sner)/20);
%sig=data(L+1:2*L,:);
nois=zeros(L,8);
toc

tic
sig_down = downsample(sig,factor);
G=size(sig_down,1);
nois2 = zeros(G,8);
for i=1:8
nois2(:,i)=noiseReduction_YW(sig_down(:,i),lowfs);
end
%q = fir1(48,[300*2/fs 8000*2/fs]);
z=filter(Q,nois2);
%soundsc(z(:,1),fs)
%len=0.02*fs;

%figure
%spectrogram(data(:,1),kaiser(len,18),[],len,fs,'yaxis')
%figure
%spectrogram(data(:,2),kaiser(len,18),[],len,fs,'yaxis')
%figure
%spectrogram(z(:,1),kaiser(len,18),[],len,fs,'yaxis')
toc
tic
TheLastStep = [doa( sig_down )';
dev_static_speech.azimuth(file),dev_static_speech.elevation(file)]
DOAPlot(TheLastStep(1,1),TheLastStep(1,2))
toc
%end