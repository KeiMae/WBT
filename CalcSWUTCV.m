
function [cv1, cv5 ,cv10]= CalcSWUTCV(len, to, r0, mode)
    if nargin == 2
        r0 = 36;
        mode = 'real';
    end
    TIMES = 2000;
    w = CreateAR1(len,1,0,TIMES);
    cell = mat2cell(w(1:to,:),to,ones(1,TIMES));
    dist = cellfun(@SWUT,cell);
    [cv1 ,cv5 ,cv10] = CalcCV(dist);
end
