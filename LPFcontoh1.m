Wp = 30/250; Ws = 50/250;
    Rp = 3; Rs = 60;
    [n,Wp] = cheb1ord(Wp,Ws,Rp,Rs)     % Gives minimum order of filter
    [b,a] = cheby1(n,Rp,Wp);                   % Chebyshev Type I filter
    freqz(b,a,512,250);                           % Plots the frequency response

