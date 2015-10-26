day={1970,1980,1990,2000,2010};
labs = [1,120,240,360,480];
ex_data = csvread('../data/Yen_daller197001_201507.csv',1);
ex = ex_data(:,2);
tvals_ex = SequentialTest(ex,'SBWUT',100);
%%
cv1 = 1.414;
cv5 = 0.4549;
cv10 = 0.2403;
figure('Position',[100,5000,500,800]);
subplot(2,1,1)
plot(ex);
xlabel('year','FontSize',20);
ylabel('Yen','FontSize',20);
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([1,548]);
subplot(2,1,2)
plot(tvals_ex);
hold on
plot(cv10*ones(1,548),':');
%hold on
%plot(cv1*ones(1,548)),'--';
xlabel('year','FontSize',15);
legend('SWUT','10%','Location','northwest');
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([1,548]);
