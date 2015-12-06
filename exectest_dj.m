%% data input and SADF
SPDV=xlsread('./data/SP_DV.xlsx');  
SP = SPDV(:,5);
r0 = 0.1;
[~, tvals_dj, CVs] = GSADF(SP,36,'real');
%% calc critical value
simDist = CalcDist('GSADF', length(SP), 1000, 36, 'real');
[cv1, cv5, cv10] = CalcCV(simDist);
%% output result
labs = [1,357,957,1557,1677];
day={'1871/1','1900/1','1950/1','2000/1','2010/1'};
figure('Position',[100,5000,500,700]);
subplot(2,1,1)
plot(SP);
xlabel('year','FontSize',15);
ylabel('Yen','FontSize',15);
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([1,length(SP)]);
subplot(2,1,2)
plot(tvals_dj);
%hold on;
%plot(cv1 * ones(1,length(TOPIX)),'*');
hold on;
plot(cv5 * ones(1,length(SP))),':';
hold on;
plot(cv10 * ones(1,length(SP))),'-';
xlabel('year','FontSize',15);
legend('ADF','5%','10%','Location','south');
set(gca,'xTick',labs,'xtickLabel',day,'FontSize',15);
xlim([1,length(SP)]);
