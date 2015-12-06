data = dlmread('../data/topix7302_1510.csv',',',1,0);
TOPIX = data(:,4);
[supt_swut ,tvals_swut, CVs_swut] = SBWUT(TOPIX,36,'real');
csvwrite('./outputdata/topix_swut.csv',[tvals_swut, CVs_swut]);

%%
labs = [1,121,241,361,481];
day={'1973/2','1983/1','1993/1','2003/1','2013/1'};

figure(1)
plot(TOPIX(1:length(TOPIX)));
xlabel('year','FontSize',15);
ylabel('Point','FontSize',15);
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([36,length(TOPIX)]);
saveas(figure(1),'pictures/article/topix.jpg')

figure(2)
plot(tvals_swut(1:length(TOPIX)));
hold on
plot(CVs_swut(1:length(TOPIX),3)),'--';
xlabel('year','FontSize',15);
legend('SWUT','10%','Location','northwest');
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([36,length(TOPIX)]);
saveas(figure(2),'pictures/article/topixswut.jpg')
