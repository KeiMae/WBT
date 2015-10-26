addpath('./WTC')

qua = [1,120,120*2,120*3,120*4];
r={'1970/2','1980/2','1990/2','2000/2','2010/2'};

data = csvread('../data/Yen_daller197001_201507.csv',1,0);
EX = data(:,2);
diff_EX = diff(EX);
wt(diff_EX,'MaxScale',64)
    ylabel('Period')
    xlabel('month')
    set(gca,'xTick',qua,'xtickLabel',r)
    xlim([1,length(diff_EX)])
