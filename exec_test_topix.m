labs = [1,241,481,720];
day={'1949/5','1969/6','1989/6','2009/6'};
data = dlmread('../data/topix_495_13.csv','\t');
TOPIX = data(:,2);
tvals_topix = SequentialTest(TOPIX,'SBWUT',12);
%%
cv1 = 1.414;
cv5 = 0.4549;
cv10 = 0.2403;
figure('Position',[100,5000,500,700]);
subplot(2,1,1)
plot(TOPIX);
xlabel('year','FontSize',15);
ylabel('Yen','FontSize',15);
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([1,length(TOPIX)]);
subplot(2,1,2)
plot(tvals_topix);

hold on
plot(cv10*ones(1,length(TOPIX))),'--';
xlabel('year','FontSize',15);
legend('SWUT','10%','Location','northwest');

set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([1,length(TOPIX)]);
