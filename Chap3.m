%%data import
filepath = 'Users/maedakeisuke/GoogleDrive/Tsukuba/Study_and_analysis/Main/';




%% 
addpath('~/Documents/MATLAB/WTC')
y = [1,50,100,150];
r={'1999/1','2003/2','2007/4','2011/6'};
%fx_month = csvread('./data/exrate_month.csv',:,6);
%%
figure('color',[1,1,1])
wt(lag(3:192))
ylabel('Period')
xlabel('month')
set(gca,'FontName','symbol','xTick',y,'xtickLabel',r)
xlim([1,191])

%% WTC
figure('color',[1,1,1])
wtc(ex_lag,CPIlag1(2:192))
ylabel('Period')
xlabel('month')
set(gca,'FontName','symbol','xTick',y,'xtickLabel',r)
xlim([1,191])

%% WTC
figure('color',[1,1,1])
wtc(ex_lag,IPIlag(2:192))
ylabel('Period')
xlabel('month')
set(gca,'FontName','symbol','xTick',y,'xtickLabel',r)
xlim([1,191])