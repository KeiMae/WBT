%% data input and SADF
data = dlmread('../data/topix7302_1510.csv',',',1,0);
TOPIX = data(1:512,4);
[supt ,tvals_adf,CVs_adf] = GSADF(log(TOPIX),36,'real');
csvwrite('./outputdata/topix_adf.csv',[tvals_adf, CVs_adf]);
%% output result
labs = [1,121,241,361,481];
day={'1973/2','1983/1','1993/1','2003/1','2013/1'};

figure(1)
plot(TOPIX);
xlabel('year','FontSize',15);
ylabel('Points','FontSize',15);
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([1,length(TOPIX)]);
saveas(figure(1),'pictures/article/topix.jpg')


figure(2)
plot(tvals_adf);
hold on;
plot(CVs_adf(:,1)),':';
hold on;
xlabel('year','FontSize',15);
legend('SADF','10%','Location','south');
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([1,length(TOPIX)]);
saveas(figure(2),'pictures/article/topixadf.jpg')
