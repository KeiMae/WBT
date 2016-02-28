function CVs = CalcSADFCV(len,to,r0,mode)
    CVs = zeros(1,3);
    TIMES = 2000;
    w = CreateAR1(len,1,0,TIMES);
    cell = mat2cell(w(1:to,:),to,ones(1,TIMES));
    dist = cellfun(@SADF,cell);
    [cv1 ,cv5 ,cv10] = CalcCV(dist);
    CVs(1,1) = cv1;
    CVs(1,2) = cv5;
    CVs(1,3) = cv10;
end
