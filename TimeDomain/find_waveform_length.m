function waveLen = find_waveform_length(signal)
sum=0;
for i=2:length(signal)
    sum= sum + abs(signal(i)-signal(i-1));
end
waveLen = sum;