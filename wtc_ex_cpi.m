addpath('./WTC')
qua = [1,120,120*2,120*3,120*4];
r={'1970/2','1980/2','1990/2','2000/2','2010/2'};

data_ex = csvread('../data/Yen_daller197001_201507.csv',1,0);
data_cpi_jp = csvread('../data/JPCPI197001_201507.csv',1,0);

EX = data_ex(:,2);
log_diff_EX = diff(log(EX));

CPI_all = data_cpi_jp(:,7);
log_diff_CPI_all = diff(log(CPI_all));

wtc(log_diff_EX,log_diff_CPI_all)
    ylabel('Period')
    xlabel('month')
    set(gca,'xTick',qua,'xtickLabel',r)
    xlim([1,length(log_diff_EX)])
