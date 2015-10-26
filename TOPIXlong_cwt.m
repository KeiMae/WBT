addpath('./WTC')

qua = [1,241,481,720];
r={'1949/5','1969/6','1989/6','2009/6'};

data = csvread('../data/topix_495_13.csv',0,0);
TOPIX = data(:,2);
diff_TOPIX = diff(TOPIX);
wt(diff_TOPIX,'MaxScale',32)
    ylabel('Period')
    xlabel('month')
    set(gca,'xTick',qua,'xtickLabel',r)
    xlim([1,771])
