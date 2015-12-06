%%
data = dlmread('../data/Yen_daller197001_201507.csv',',',1,0);
FX = data(39:548,2);
[logFXsupt_swut ,logFXtvals_swut, logFXCVs_swut] = SBWUT(log(FX),36,'real');
csvwrite('logfx_swut.csv',[logFXtvals_swut,logFXCVs_swut]);
%% calc critical value
%simDist = CalcDist('SBWUT', length(FX), 2000, 36, 'real');
%[cv1, cv5, cv10] = CalcCV(simDist);
%%
labs = [1,37,120,240,360,480];
day={'1973/2','1976/3','1983/1','1993/1','2003/1','2013/1'};
figure('Position',[100,5000,500,700]);

subplot(2,1,1)
plot(log(FX));
xlabel('year','FontSize',15);
ylabel('Yen','FontSize',15);
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([36,length(FX)]);

subplot(2,1,2)
plot(logFXtvals_swut(1:length(FX)));

hold on
plot(logFXCVs_swut(1:length(FX),1)),'--';
xlabel('year','FontSize',15);
legend('SWUT','10%','Location','northwest');

set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([36,length(FX)]);
