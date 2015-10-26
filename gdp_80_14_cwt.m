addpath('./WTC')
data = csvread('../data/gdp_iip_qtr_80_14.csv',1,0);
gdp = data(:,2);

qua = [1,40,80,120];
r={'1980/2','1990/1','2000/1','2010/1'};



diff_GDP = diff(gdp);
wt(diff_GDP,'MaxScale',16)
    ylabel('Period')
    xlabel('month')
    set(gca,'xTick',qua,'xtickLabel',r)
    xlim([1,139])
