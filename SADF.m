function [sup_t, tvals] = SADF(y, r0, moder0)
    if nargin == 2
        moder0 = 'rate';
    end
    if nargin == 1
        moder0 = 'real';
        r0=36;
    end
    len = length(y);    
    switch moder0
    case 'rate'
        init = fix(r0*len);
    case 'real' 
        init = r0;
        
    otherwise     
        warning('mode need "rate" or "real".');
        quit;
    end

    tvals = zeros(len,1);
    for i =  init:len
        tvals(i,1) = ADF(y(1:i,1));
    end
    sup_t=max(tvals(init:len));
end
