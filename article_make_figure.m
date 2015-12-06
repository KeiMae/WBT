%% TOPIX 
figure(1)
TOPIXlabs = [1,121,241,361,481];
TOPIXday={'1973/2','1983/1','1993/1','2003/1','2013/1'};
plot(TOPIX);
xlabel('year','FontSize',15);
ylabel('Points','FontSize',15);
set(gca,'xTick',TOPIXlabs,'xtickLabel',TOPIXday,'FontSize',15);
xlim([36,length(TOPIX)]);
title('TOPIX')
saveas(figure(1),'pictures/article/TOPIX.jpg');
%% TOPIX adf 
figure(2)
plot(tvals_adf);
hold on;
plot(CVs_adf(:,3)),'-';
xlabel('year','FontSize',15);
legend('SADF','10%','Location','northwest');
set(gca,'xTick',TOPIXlabs,'xtickLabel',TOPIXday,'FontSize',15);
xlim([36,length(TOPIX)]);
title('TOPIX SADF')
saveas(figure(2),'pictures/article/TOPIXadf.jpg');
%% TOPIX suwt
figure(3);
plot(tvals_swut);
hold on
plot(CVs_swut(:,3)),'--';
xlabel('year','FontSize',15);
legend('WBT','10%','Location','northwest');
set(gca,'xTick',TOPIXlabs,'xtickLabel',TOPIXday,'FontSize',15);
xlim([36,length(TOPIX)]);
title('TOPIX WBT')
saveas(figure(3),'pictures/article/TOPIXswut.jpg');
%% FX
figure(4);
FXlabs = [1,120,240,360,480];
FXday={'1973/2','1983/1','1993/1','2003/1','2013/1'};
plot(FX);
xlabel('year','FontSize',15);
ylabel('Yen','FontSize',15);
set(gca,'xTick',FXlabs,'xtickLabel',FXday,'FontSize',15);
xlim([36,length(FX)]);
title('Exchange Rate Yen-Daller')
saveas(figure(4),'pictures/article/fx.jpg');
%% FXadf
figure(5);
plot(FXtvals_adf(1:length(FX)));
hold on
plot(FXCVs_adf(1:length(FX),3)),'--';
xlabel('year','FontSize',15);
legend('SADF','10%','Location','northwest');
set(gca,'xTick',FXlabs,'xtickLabel',FXday,'FontSize',15);
xlim([36,length(FX)]);
title('Exchange Rate SADF')
saveas(figure(5),'pictures/article/fxadf.jpg');
%% FXswut
figure(6);
plot(FXtvals_swut(1:length(FX)));
hold on
plot(FXCVs_swut(1:length(FX),3)),'--';
xlabel('year','FontSize',15);
legend('WBT','10%','Location','northwest');
set(gca,'xTick',FXlabs,'xtickLabel',FXday,'FontSize',15);
xlim([36,length(FX)]);
title('Excange Rate WBT')
saveas(figure(6),'pictures/article/fxswut.jpg');

%%
figure(7);
plot(FX_PPItvals_adf(1:length(FX)));
hold on
plot(FX_PPICVs_adf(1:length(FX),3)),'--';
xlabel('year','FontSize',15);
legend('SADF','10%','Location','northwest');
set(gca,'xTick',FXlabs,'xtickLabel',FXday,'FontSize',15);
xlim([36,length(FX)]);
title('Exchange Rate/PPI SADF')
saveas(figure(7),'pictures/article/fx_PPI_adf.jpg');
%% FXswut
figure(8);
plot(FX_PPItvals_swut(1:length(FX)));
hold on
plot(FX_PPICVs_swut(:,3)),'--';
xlabel('year','FontSize',15);
legend('WBT','10%','Location','northwest');
set(gca,'xTick',FXlabs,'xtickLabel',FXday,'FontSize',15);
xlim([36,length(FX)]);
title('Excange Rate/PPI WBT')
saveas(figure(8),'pictures/article/fx_PPI_swut.jpg');
%% Dividendadf
figure(9);
plot(DIVtvals_adf(:));
hold on
plot(CVs_adf(:,3)),'--';
xlabel('year','FontSize',15);
legend('SADF','10%','Location','northwest');
set(gca,'xTick',FXlabs,'xtickLabel',FXday,'FontSize',15);
xlim([36,length(FX)]);
title('Dividend SADF')
saveas(figure(9),'pictures/article/divadf.jpg');
%% Dividendadf
figure(10);
plot(DIVtvals_swut(:));
hold on
plot(CVs_swut(:,3)),'--';
xlabel('year','FontSize',15);
legend('WBT','10%','Location','northwest');
set(gca,'xTick',FXlabs,'xtickLabel',FXday,'FontSize',15);
xlim([36,length(FX)]);
title('Dividend WBT')
saveas(figure(10),'pictures/article/divadf.jpg');