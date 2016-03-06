%% data input 
dataD = dlmread('../data/dividend7302_1510.csv',',',1,0);
DIV = dataD(:,4);

%%
[DIVsupt ,DIVtvals_adf,~] = GSADF(log(1./DIV*100),36,'real');
csvwrite('./outputdata/dvi_adf.csv',DIVtvals_adf);
[DIVsupt_swut ,DIVtvals_swut, ~] = SBWUT(1./DIV*100,36,'real');
csvwrite('./outputdata/dvi_swut.csv',DIVtvals_swut);

%% output result
labs = [1,121,241,361,481];
day={'1973/2','1983/1','1993/1','2003/1','2013/1'};

figure(1)
plot(1./DIV*100);
xlabel('year','FontSize',15);
ylabel('Points','FontSize',15);
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([1,length(DIV)]);
saveas(figure(1),'pictures/article/div.jpg')


figure(2)
plot(DIVtvals_adf);
hold on;
plot(CVs_adf(:,1)),':';
hold on;
xlabel('year','FontSize',15);
legend('SADF','10%','Location','south');
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([36,length(DIV)]);
saveas(figure(2),'pictures/article/div_adf.jpg')

figure(3)
plot(DIVtvals_swut(1:length(DIV)));
hold on
plot(CVs_swut(:,3)),'--';
xlabel('year','FontSize',15);
legend('WBT','10%','Location','northwest');
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([36,length(DIV)]);
saveas(figure(3),'pictures/article/div_swut.jpg')

