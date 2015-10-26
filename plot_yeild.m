%%plot yeild spread
qua = [1,50,100,150];
r={'1999/1','2003/2','2007/4','2011/6'};

data = readtable('../data/data0608.csv');

for i = 7:16
    subplot(5,2,i-6)
    plot(data{:,i});
    ylabel('Period')
    xlabel('month')
    title(['Yield Spread ',nplot_um2str(i-6)])
    set(gca,'xTick',qua,'xtickLabel',r)
    xlim([1,180])
end
