%% TOPIX 
figure(1)
TOPIXlabs = [1,121,241,361,481];
TOPIXday={'1973/2','1983/1','1993/1','2003/1','2013/1'};
plot(TOPIX,'black','LineWidth',3);
xlabel('year','FontSize',15);
ylabel('Points','FontSize',15);
set(gca,'xTick',TOPIXlabs,'xtickLabel',TOPIXday,'FontSize',15);
xlim([36,length(TOPIX)]);
title('TOPIX')
saveas(figure(1),'pictures/article/TOPIX.jpg');
saveas(figure(1),'pictures/article/eps/TOPIX.eps');
%% TOPIX adf 
figure(2)
plot(tvals_adf,'black','LineWidth',3);
hold on;
plot(CVs_adf(:,3));
xlabel('year','FontSize',15);
legend('SADF','10%','Location','northwest');
set(gca,'xTick',TOPIXlabs,'xtickLabel',TOPIXday,'FontSize',15);
xlim([36,length(TOPIX)]);
title('TOPIX SADF')
saveas(figure(2),'pictures/article/TOPIXadf.jpg');
saveas(figure(2),'pictures/article/eps/TOPIXadf.eps');

%% TOPIX suwt
figure(3);
plot(tvals_swut,'black','LineWidth',3);
hold on
plot(CVs_swut(:,3));
xlabel('year','FontSize',15);
legend('WBT','10%','Location','northwest');
set(gca,'xTick',TOPIXlabs,'xtickLabel',TOPIXday,'FontSize',15);
xlim([36,length(TOPIX)]);
title('TOPIX WBT')
saveas(figure(3),'pictures/article/TOPIXswut.jpg');
saveas(figure(3),'pictures/article/eps/TOPIXswut.eps');
%% FX
figure(4);
FXlabs = [1,120,240,360,480];
FXday={'1973/2','1983/1','1993/1','2003/1','2013/1'};
plot(FX,'black','LineWidth',3);
xlabel('year','FontSize',15);
ylabel('Yen','FontSize',15);
set(gca,'xTick',FXlabs,'xtickLabel',FXday,'FontSize',15);
xlim([36,length(FX)]);
title('Exchange Rate Yen-Daller')
saveas(figure(4),'pictures/article/fx.jpg');
saveas(figure(4),'pictures/article/eps/fx.eps');
%% FXadf
figure(5);
plot(FXtvals_adf,'black','LineWidth',3);
hold on
plot(CVs_adf(:,3));
xlabel('year','FontSize',15);
legend('SADF','10%','Location','northwest');
set(gca,'xTick',FXlabs,'xtickLabel',FXday,'FontSize',15);
xlim([36,length(FX)]);
title('Exchange Rate SADF')
saveas(figure(5),'pictures/article/fxadf.jpg');
saveas(figure(5),'pictures/article/eps/fxadf.eps');
%% FXswut
figure(6);
plot(FXtvals_swut,'black','LineWidth',3);
hold on
plot(CVs_swut(:,3));
xlabel('year','FontSize',15);
legend('WBT','10%','Location','northwest');
set(gca,'xTick',FXlabs,'xtickLabel',FXday,'FontSize',15);
xlim([36,length(FX)]);
title('Excange Rate WBT')
saveas(figure(6),'pictures/article/fxswut.jpg');
saveas(figure(6),'pictures/article/eps/fxswut.eps');

%%
figure(7);
plot(FX_PPItvals_adf,'black','LineWidth',3);
hold on
plot(CVs_adf(:,3));
xlabel('year','FontSize',15);
legend('SADF','10%','Location','northwest');
set(gca,'xTick',FXlabs,'xtickLabel',FXday,'FontSize',15);
xlim([36,length(FX)]);
title('Exchange Rate/PPI SADF')
saveas(figure(7),'pictures/article/fx_PPI_adf.jpg');
saveas(figure(7),'pictures/article/eps/fx_PPI_adf.eps');
%% FXswut
figure(8);
plot(FX_PPItvals_swut,'black','LineWidth',3);
hold on
plot(CVs_swut(:,2));
xlabel('year','FontSize',15);
legend('WBT','10%','Location','northwest');
set(gca,'xTick',FXlabs,'xtickLabel',FXday,'FontSize',15);
xlim([36,length(FX)]);
title('Excange Rate/PPI WBT')
saveas(figure(8),'pictures/article/fx_PPI_swut.jpg');
saveas(figure(8),'pictures/article/eps/fx_PPI_swut.eps');
%% Dividendadf
figure(9);
plot(DIVtvals_adf,'black','LineWidth',3);
hold on
plot(CVs_adf(:,3));
xlabel('year','FontSize',15);
legend('SADF','10%','Location','northwest');
set(gca,'xTick',FXlabs,'xtickLabel',FXday,'FontSize',15);
xlim([36,length(FX)]);
title('Dividend SADF')
saveas(figure(9),'pictures/article/divadf.jpg');
saveas(figure(9),'pictures/article/eps/divadf.eps');
%% Dividendadf
figure(10);
plot(DIVtvals_swut,'black','LineWidth',3);
hold on
plot(CVs_swut(:,3));
xlabel('year','FontSize',15);
legend('WBT','10%','Location','northwest');
set(gca,'xTick',FXlabs,'xtickLabel',FXday,'FontSize',15);
xlim([36,length(FX)]);
title('Dividend WBT')
saveas(figure(10),'pictures/article/divadf.jpg');
saveas(figure(10),'pictures/article/eps/divswut.eps');