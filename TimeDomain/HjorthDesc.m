function [activity mobility complexity]=HjorthDesc(InSig)

activity=var(InSig);
for i=2:length(InSig)
    InSig1(i)=InSig(i)-InSig(i-1);
end
mobility=std(InSig1)/std(InSig);
for i=3:length(InSig)
    InSig2(i)=InSig(i)-2*InSig(i-1)+InSig(i-2);
end
complexity=(std(InSig2)/std(InSig1))/(std(InSig1)/std(InSig));