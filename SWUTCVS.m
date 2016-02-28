function res = SWUTCVS(len)
    CVs = nan(len,3);
    for i = 36:len
        [CVs(i,1), CVs(i,2), CVs(i,3)] = CalcSWUTCV(len,i);
    end
    csvwrite('./outputdata/CVs_swut.csv', CVs);
    res = 'finish';
end