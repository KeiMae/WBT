data = readtable('data/data0608.csv');

%%
addpath('~/Documents/MATLAB/WTC')
y = [1,50,100,150];
r={'1999/1','2003/2','2007/4','2011/6'};

%%
for i = 2:4
    figure('color',[1,1,1]);
    wt(data{:,i})
    ylabel('Period')
    xlabel('month')
    set(gca,'xTick',y,'xtickLabel',r)
    xlim([1,180])
end
%%
for i = 7:16
    subplot(5,2,i-6)
    wt(data{:,i})
    ylabel('Period')
    xlabel('month')
    title(['yeild',num2str(i-6)])
    set(gca,'xTick',y,'xtickLabel',r)
    xlim([1,180])
end

%%
figure('color',[1,1,1]);
wt((data.Spread10-data.Spread1))
ylabel('Period','FontSize',20)
xlabel('month','FontSize',20)
set(gca,'xTick',y,'xtickLabel',r,'FontSize',16)
xlim([1,180])


