function [x, y, z, articific_adf, CVs_adf, articific_swut, CVs_swut] =  ArticificTests(num) 
  size = 300;
  mu = 0.0375;
  sigma = 0.1574;
  D_init = 1.3;
  R = 0.05;
  tau = 0.05;
  pi = 0.85;
  alpha = 1;
  delta =0.5;
  B_init = delta;
  figurename1 = strcat('./pictures/article/ariticific',num2str(num),'.jpg');
  [x , y, z] = CreateArtificBubble(size, mu, sigma, D_init, R ...
                                , B_init, tau, pi, alpha, delta);
  figure(1);
  plot(x,'-*');
  hold on;
  plot(y);
  set(gca,'FontSize',15);
  legend('Value','Fudamental');
  saveas(figure(1),figurename1);
  %%
  figurename2 = strcat('./pictures/article/ariticific',num2str(num),'_adf.jpg');
  [~,articific_adf, CVs_adf] = GSADF(x',36,'real');
  figure(2);
  plot(articific_adf);
  %hold on;
  %plot(CVs_adf(:,1));
  %hold on;
  %plot(CVs_adf(:,2));
  %legend('SADF','10%','5%')
  xlabel('Period','FontSize',15);
  ylabel('Value','FontSize',15);
  saveas(figure(2),figurename2);
  %%
  figurename3 = strcat('./pictures/article/ariticific',num2str(num),'_swut.jpg');
  [~,articific_swut, CVs_swut] = SBWUT(x',36,'real');
  figure(3);
  plot(articific_swut);
  hold on;
  plot(CVs_swut(:,1));
  hold on;
  plot(CVs_swut(:,2));
  legend('SWUT','10%','5%')
  xlabel('Period','FontSize',15);
  ylabel('Value','FontSize',15);
  saveas(figure(3),figurename3);
  
  %%
  close all;
end
