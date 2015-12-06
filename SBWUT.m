function [Sup_t, tvals, CVs]  = SBWUT(tseries , r0, mode)
  len = length(tseries);
  
    switch mode
        case 'rate'
            init = fix(len * r0);
            
        case 'real'
            init = r0;
            
        otherwise
        warning('mode need "rate" or "real".');
        quit;
    end           

    tvals_ = zeros(len,1);
    tvals = zeros(len,1);
    CVs = zeros(len,3);
    h = waitbar(0,'SBWUT');
    for i = init:len
        ts = nan(len,i-init+1);
        for s = 1 : i-init+1
           ts(s:i,s) = tseries(s:i);
        end
        cell = mat2cell(ts,len,ones(1,i-init+1));
        tvals_ = cellfun(@InvFG,cell);
        %for s = 1 : i-init+1
        %tvals_(s,1) = -1/ WaveletUnitroot(tseries(s:i),12,'haar',1,'raw'); 
            %tvals_(s,1) = WaveletUnitroot(tseries(s:i),12,'haar',1,'raw');  
        %end
        tvals(i,1) = max(tvals_);
        [CVs(i,1),CVs(i,2),CVs(i,3)] = CalcSWUTCV(len, i, r0, mode);
        %CVs(i,1) = CV(1,1); %1%
        %CVs(i,2) = CV(1,2); %5%
        %CVs(i,3) = CV(1,3); %10%
        %CVs=[0,0,0];
        waitbar(i/len,h);        
    end
    Sup_t = max(tvals(init:len));
    close(h)
end
