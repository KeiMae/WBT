function w = StandardWinner(len, times)
    if nargin == 1
        times = 1;
    end
    rand = normrnd(0,1,[len-1,times]);
    init = normrnd(0,1,[1,times]);
    dt = sqrt(1/len);
    w = cumsum([init; dt*rand]);
end