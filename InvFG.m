function invfg = InvFG(y)
    invfg =  -1/WaveletUnitroot(y(not(isnan(y))),12,'haar',1,'raw');
end