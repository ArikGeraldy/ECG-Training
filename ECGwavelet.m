clc; close all; clear all;
[filename path]=uigetfile('*.mat','Buka file ecg_data');
fullname=[path filename];
ecgdat=load(fullname);
x=ecgdat.s;
fs=250
t=(0:1:length(ecgdat)-1)/fs;
%normalisasi
x=x-mean(x);
x=x/max(abs(x));

lamarekam=length(x)/fs;

filename
fs
lamarekam
subplot(1,2,1);
plot((0:1:length(x)-1)/fs,x);
grid on;
xlabel('waktu (detik)','fontsize',14);
ylabel('Amplitude','fontsize',14);
title('Plot Sinyal NSR ','fontsize',14 );

frecg=fft(x);
z=0:1:length(x)-1;
zbaru=z/length(x);
frek=zbaru*fs;

freq_s = fft(x);

subplot(1,2,2);
plot(frek,abs(freq_s));
xlim([0 fs/2])
xlabel('Frekuensi (Hz)','fontsize',14);
ylabel('Magnitudo (mV)','fontsize',14);
title('Spektrum Sinyal NSR ','fontsize',14);

grid on;


y=wpdec(x,5,'db1');
paket=y;
plot(y);
fitur=[];
for k=0:1:31
    sub=wpcoef(y,[5 k]);
    en=periodogram(sub);
    sumen=sum(en);
    fitur=[fitur sumen];
end
ciri1=fitur'; % fitur = energi tiap subband => 32 ciri
ciri2=hist(ciri1(1:32,1)); % histogram dari fitur => bisa jadi fitur juga

%dengan spektogram
figure;
subplot(3,1,1);
plot((0:1:length(x)-1)/fs,x);
title([' ',filename]);
xlabel('t(s)');
grid on
subplot(3,1,2);
s_frek=fft(x);
plot(frek,abs(s_frek));
title(['Spektrum   ',filename]);
xlabel('Frekuensi(Hz)');
xlim([0 fs/2]);
grid on

subplot(3,1,3)
specgram(x,256,fs,25,20);
title(['Spectrogram    ',filename]);
ylim([0 fs/2]);
grid;

y=specgram(x,256,fs,25,20);
[m n]=size(y);
y=abs(y);
for z=1:1:n
    d=y(:,z);
    v(z)=max(d);
end

figure;
plot(v);
grid on;

ECG=x;
N=128;                     % N-FFT dengan N = 128
%masukan ECG
y=fft(ECG,N);
subplot(1,2,1);
plot((0:N/2-1)*fs/N,abs(y(1:N/2)));
xlabel('Frekuensi (Hz)');
ylabel('Daya spektral');
title('TF dari sinyal ECG Normal');
grid on;

subplot(1,2,2);
py=power(abs(y),2);
periodogram=10*log10(py/N);   %normalisasi terhadap N
plot(((0:N/2-1)*fs/N),periodogram(1:N/2));
xlabel('Frekuensi (Hz)');
ylabel('Daya spektral (db)');
title('Periodgram dari ECG Normal');
grid on;


figure;
Wp = 40/250; Ws = 60/250;
    Rp = 3; Rs = 60;
    [n,Wp] = cheb1ord(Wp,Ws,Rp,Rs)     % Gives minimum order of filter
    [b,a] = cheby1(n,Rp,Wp);           % Chebyshev Type I filter
    freqz(b,a,512,250);                % Plots the frequency response
    
    
figure;
yecg=filter(b,a,x);
subplot(3,1,1);
plot((0:1:length(yecg)-1)/fs,yecg);
title([' ',filename]);
xlabel('t(s)');
grid on
subplot(3,1,2);

yecg_frek=fft(yecg);
zecg=0:1:length(yecg)-1;
zecgbaru=zecg/length(yecg);
frekzecg=zecgbaru*fs;

plot(frekzecg,abs(yecg_frek));
title(['Spektrum   ',filename]);
xlabel('Frekuensi(Hz)');
xlim([0 fs/2]);
grid on

subplot(3,1,3)
specgram(yecg,256,fs,25,20);
title(['Spectrogram    ',filename]);
ylim([0 fs/2]);
grid on;

