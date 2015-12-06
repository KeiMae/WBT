function [sup_t, tvals, CVs] = GSADF(y , r0, mode)
    if nargin == 2
        mode = 'rate';
    end
    len = length(y);
    switch mode
        case 'rate'
            init = fix(len * r0);
            
        case 'real'
            init = r0;
            
        otherwise
        warning('mode need "rate" or "real".');
        quit;
    end
    h = waitbar(0,'GSADF');
    tvals_ = zeros(len,1);
    tvals = zeros(len,1);
    CVs = zeros(len,3);
    for i = init:len
        for s = 1 : i-init+1
            tvals_(s,1) = ADF(y(s:i));
        end
        tvals(i,1) = max(tvals_(1:i-init+1,1));
        CV = CalcSADFCV(len, i, r0, mode);
        CVs(i,1) = CV(1,1); %1%
        CVs(i,2) = CV(1,2); %5%
        CVs(i,3) = CV(1,3); %10%
        %CVs = [0,0,0];
        waitbar(i/len,h);
    end
    sup_t  = max(tvals(init:len,1));
    close(h);
end