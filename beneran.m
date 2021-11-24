clear all; close all;
clc;
load Bipolar5.mat; %data mentah dari database
raw = val; 
fs = 250;
N = length (raw);
t = [0:N-1]/fs;
figure
plot(t,raw),ylabel('amplitude'),xlabel('time'); 
w = 50/(fs/2);
bw = w;
[num,den] = iirnotch (w,bw);
filteringdata = filter (num,den,raw);
[e,f] = wavedec(filteringdata,10,'db6');
koefisien = wrcoef('a',e,f,'db6',8);
setelahfiltrasi = filteringdata-koefisien;
smoothhasil = smooth(setelahfiltrasi);
N1 = length(smoothhasil);
t1 = (0:N1-1)/fs;
figure,plot(t1,smoothhasil),ylabel('amplitude'),xlabel('time')
title('Filtered ECG signal')
x = smoothhasil;
j = [];
time = 0;
y = 0.45*max(x);
for i=2:N1-1
    if((x(i)>x(i+1))&&(x(i)>x(i-1))&&(x(i)>y))
        j(i)=x(i);
        time(i)=[i-1]/fs;
    end
end
j(j==0)=[];
time(time==0)=[];
z = (time)';
k = length(z);
figure;
plot(t,x);          
hold on;                
plot(time,j,'*r'); title('PEAK POINTS DETECTED IN ECG SIGNAL')    
xlabel('time')
ylabel('amplitude')
hold off           
r2 = z(2:k);
r1 = z(1:k-1);
r3 = r2-r1;
hr = 60./r3;
figure;
stairs(hr); title(' DISPLAY HRV') 
a = length(r3);
r4 = r3(2:a);
r5 = r3 (1:a-1);
figure(7);
plot(r4,r5,'r*')
title('POINCARE PLOT'), xlabel('RR(n+1)') ,ylabel('RR(n)')
mhr = mean (hr);
SDNN = std(r3);
sq = diff(r3).^2;
rms = sqrt(mean(sq));
NN50 = sum (abs(diff(r3))>.05);

ciri=[mhr SDNN rms NN50];
% close all;


