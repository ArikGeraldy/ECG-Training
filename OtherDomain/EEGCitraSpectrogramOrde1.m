clc; clear all; close all;

Fs = 173.61;

M=1
for j=1:100
    recordName=j;
%C:\Users\Admin\Documents\MATLAB\EEG\ O N, S, F, Z

EEGFileName=strcat( 'D:\Matlab16\EEG\N\N',num2str(recordName),'.txt');
Sinyal = textread(EEGFileName);



% t=(0:length(S)-1)/fs;
% S=S-mean(S);
% S=S/max(abs(S));


y=spectrogram(Sinyal,kaiser(500,5),475,512,Fs);
% y=spectrogram(S,kaiser(200,5),100,256,Fs);

%y=spectrogram(S,kaiser(500,5),475,512,Fs);
S=abs(y);
x = round((S-min(min(S)))/(max(max(S))-min(min(S)))*255);

% x=abs(y)/max(abs(y));

[cirme cirva cirkur cirske cirien]=CiriOrdeSatu(x);

ciri(j,:)=[cirme cirva cirkur cirske cirien];

M =M+1



end