addpath('./WTC')
data = csvread('../data/gdp_iip_mon_80_14.csv',1,0);

qua = [1,121,241,361,445];
r={'1978/1','1988/1','1998/1','2008/1','2014/12'};


iip = data(1:445,2);
diff_iip = diff(iip);
wt(diff_iip,'MaxScale',32)
    ylabel('Period')
    xlabel('month')
    set(gca,'xTick',qua,'xtickLabel',r)
    xlim([1,444])
