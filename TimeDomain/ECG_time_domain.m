n=50;   %jumlah data
indeks_array = 1;
indeks_file = 1;
result = cell(n,1); %21 file
fs=250;
path=['H:\Penelitian\Pelatihan\PCR_Nov2019\Signal\ECG\af\'];
tic;
while(indeks_array<(n+1))
    tempstr = strcat('af', num2str(indeks_array),'.mat'); %
    fullname=[path tempstr];
    ecgdat=load(fullname);
    sinyal=ecgdat.s;
    result{indeks_array,1}=sinyal;
    indeks_array = indeks_array+1;
end

   %hasil disimpan dalam cell 18x1 dengan variabel result
%  
   fitur=[];
      
   for j=1:n
 sinyalecg=result(j,1);
 sss=sinyalecg{1,1};   
 y=sss-mean(sss);
 y=y/max(y);
L=length(y);
 logDetect = find_log_detector(y);
 MAV=find_MAV(y,L);
 count = find_slopSign(y,0.1);
 stan=std(y);
 waveLen = find_waveform_length(y);
 CIRI(j,:)=[logDetect MAV count stan waveLen];
  
   end