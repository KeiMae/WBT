setdata;
[low high] = dwt(p,'haar',1);

figure('position',[300,300,700,700]);
subplot(3,1,1);
plot(p);
hold on;
plot(pf,'*');
legend('Value','Fundamental','Location','northwest');
set(gca,'FontSize',20);

subplot(3,1,2:3);
plot(high);
legend('Coefficients','Location','northwest');
set(gca,'FontSize',20);
