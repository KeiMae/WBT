addpath('./WTC')

qua = [1,50,100,150];
r={'1999/1','2003/2','2007/4','2011/6'};

data = readtable('../data/topix9901_to_1412.csv');
topix_end = data{:,4};

wt(topix_end)
    ylabel('Period')
    xlabel('month')
    set(gca,'xTick',qua,'xtickLabel',r)
    xlim([1,180])
