%SWUT corespond with BSADF as Backward Supreme ADF
%SWUT means Supreme wavelet unitroot test
function [sup_t, tvals] = SWUT(y, r0, moder0)
    if nargin == 2
        moder0 = 'rate';
    end
    if nargin == 1
        moder0 = 'real';
        r0 = 36;
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
    ys = nan(len,len-init);

    for i =  init:len
        ys(1:i,i-init+1) = y(1:i,1);
    end
    cell = mat2cell(ys,len,ones(1,len-init+1));
    tvals = cellfun(@InvFG,cell);

    sup_t = max(tvals);
end
