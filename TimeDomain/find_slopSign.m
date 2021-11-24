function count = find_slopSign(signal,epsilon)

sum=0;
%figure
%plot(signal);
for i=2:length(signal)-1
    if (((signal(i)>signal(i-1)) && (signal(i)>signal(i+1))) || ((signal(i)<signal(i-1)) && (signal(i)<signal(i+1)))) && (abs(signal(i)-signal(i-1))> epsilon || abs(signal(i)-signal(i+1))> epsilon)
        sum=sum+1;
       % hold on
        %plot(i,signal(i),'*')
    end
end
count = sum;