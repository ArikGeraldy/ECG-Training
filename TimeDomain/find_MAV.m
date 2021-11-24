function MAV=find_MAV(signal,L)

MAV=[];
for i=1:(length(signal)/L)
MAV=[MAV (sum(abs(signal((i-1)*L+(1:L))))/L)];
end
u=0;