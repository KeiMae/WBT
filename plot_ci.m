%%plot ci
qua = [1,50,100,150];
r={'1999/1','2003/2','2007/4','2011/6'};

data = readtable('../data/data0608.csv');

for i = 2:4
    subplot(3,1,i-1)
    plot(data{:,i});
    ylabel('Period')
    xlabel('month')
    switch i-1
        case 1
            title('CI leading', 'FontSize', 20)
        case 2
            title('CI', 'FontSize', 20)
        case 3
            title('CI lagging', 'FontSize', 20)
    end
    set(gca,'xTick',qua,'xtickLabel',r)
    xlim([1,180])
end
