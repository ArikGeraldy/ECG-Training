clc;clear all; close all;
%buka file EEG

clc; clear all; close all;

Ciri=[];

M=1

for j = 1:100 %untuk data = 1:100
recordName=j;
%C:\Users\Admin\Documents\MATLAB\EEG\N

EEGFileName=strcat( 'D:\Matlab16\EEG\Z\Z',num2str(recordName),'.txt');  %lokasi data diganti S,F,N,O
S = textread(EEGFileName);
% t=(0:length(S)-1)/fs;

S=S-mean(S);
S=S/max(abs(S));
L=length(S);
N=5; %level dekomposisi


ciri=[];
Y=wpdec(S,N,'db2');   %db2 diganti haar, db8, bior2.5 dll
ciri1=[];
ciri2=[];
ciri3=[];
ciri4=[];
ciri5=[];

for i=1:2   %level1
  sub1=wpcoef(Y,[1 (i-1)]);
  ener1=sum(sub1.^2)/length(sub1);
  ciri1 = [ciri1 ener1];
  
end
  
for i=1:4  %level2
    
  sub2=wpcoef(Y,[2 (i-1)]);
  ener2=sum(sub2.^2)/length(sub2);
  ciri2 = [ciri2 ener2];
    
end

for i=1:8  %level3
    
  sub3=wpcoef(Y,[3 (i-1)]);
  ener3=sum(sub3.^2)/length(sub3);
  ciri3 = [ciri3 ener3];
    
end

for i=1:16  %level4
    
    sub4=wpcoef(Y,[4 (i-1)]);
  ener4=sum(sub4.^2)/length(sub4);
  ciri4 = [ciri4 ener4];
    
end  

for i=1:32  %level5
    
  sub5=wpcoef(Y,[5 (i-1)]);
  ener5=sum(sub5.^2)/length(sub5);
  ciri5 = [ciri5 ener5];
    
end  

  Ciri(j,:)=[ciri1 ciri2 ciri3 ciri4 ciri5];
  
  M=M+1
  
  end
