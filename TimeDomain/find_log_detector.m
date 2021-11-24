function logDetect = find_log_detector(signal)
N=length(signal);
logDetect = exp((sum(log10(abs(signal))))/N);