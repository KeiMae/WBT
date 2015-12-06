art300data1_adf = csvread('./outputdata/art/artdata1adf.csv');
art300data1_swut = csvread('./outputdata/art/artdata1swut.csv');
aCVs_adf = art300data1_adf(:,2:4);
aCVs_swut = art300data1_swut(:,2:4);

for num = 7:7 
    close all;
    
    [x, y, z, articific_adf, ~, articific_swut, ~] = ArticificTests(num);
    csvwrite(strcat('./outputdata/art/artdata',num2str(num),'.csv'), [x',y',z']);
    csvwrite(strcat('./outputdata/art/artdata',num2str(num),'adf.csv'), [articific_adf, aCVs_adf]);
    csvwrite(strcat('./outputdata/art/artdata',num2str(num),'swut.csv'), [articific_swut, aCVs_swut]);
    
    figure(1)
    figurename1 = strcat('./pictures/article/ariticific',num2str(num),'.jpg');
    plot(x,'-*');
    hold on;
    plot(y);
    set(gca,'FontSize',15);
    legend('Value','Fudamental');
    saveas(figure(1),figurename1);
    
    figure(2)
    figurename2 = strcat('./pictures/article/ariticific',num2str(num),'_adf.jpg');
    plot(articific_adf);
    hold on;
    plot(aCVs_adf(:,3));
    legend('SADF','10%')
    xlabel('Period','FontSize',15);
    ylabel('Value','FontSize',15);
    saveas(figure(2),figurename2);
    %%
    figure(3)
    figurename3 = strcat('./pictures/article/ariticific',num2str(num),'_swut.jpg');
    plot(articific_swut);
    hold on;
    plot(aCVs_swut(:,3));
    legend('SWUT','10%')
    xlabel('Period','FontSize',15);
    ylabel('Value','FontSize',15);
    saveas(figure(3),figurename3);
    
    
end
