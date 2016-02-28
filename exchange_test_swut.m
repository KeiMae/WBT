%%
FXdata = dlmread('../data/FX7302_1510.csv',',',1,0);
FX = FXdata(:,3);
PPIdata = dlmread('../data/PPI_7302_1510.csv',',',1,0);
PPIJPN = PPIdata(:,2);
PPIUSA = PPIdata(:,3);
diffPPI = log(PPIJPN) - log(PPIUSA);
%%
[FXsupt_swut ,FXtvals_swut, FXCVs_swut] = SBWUT(FX,36,'real');
csvwrite('./outputdata/FX_swut.csv',[FXtvals_swut, FXCVs_swut]);
%%
[FX_supt_swut ,FX_tvals_swut, FX_CVs_swut] = SBWUT(FX./exp(diffPPI),36,'real');
csvwrite('./outputdata/FX_PPI_swut.csv',[FX_tvals_swut, FX_CVs_swut]);

labs = [1,37,120,240,360,480];
day={'1973/2','1976/3','1983/1','1993/1','2003/1','2013/1'};

figure(1);
plot(FX(1:length(FX)));
xlabel('year','FontSize',15);
ylabel('Yen','FontSize',15);
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([36,length(FX)]);
title('Exchange Rate Dollar-Yen');
saveas(figure(1),'pictures/article/fx.jpg')

figure(2);
plot(FXtvals_swut(1:length(FX)));
hold on
plot(FXCVs_swut(1:length(FX),1)),'--';
xlabel('year','FontSize',15);
legend('SWUT','10%','Location','northwest');
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([36,length(FX)]);
saveas(figure(2),'pictures/article/fxswut.jpg')

figure(3);
plot(FX_tvals_swut(1:length(FX)));
hold on
plot(FX_CVs_swut(1:length(FX),1)),'--';
xlabel('year','FontSize',15);
legend('SWUT','10%','Location','northwest');
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([36,length(FX)]);
saveas(figure(3),'pictures/article/fx_ppiswut.jpg')
