size = 100;
mu = 0.0375;
sigma = 0.1574;
D_init = 1.3;
R = 0.05;
tau = 0.05;
pi = 0.85;
alpha = 1;
delta =0.5;
B_init = delta;
[x , y, z] = CreateArtificBubble(size, mu, sigma, D_init, R, B_init, tau, pi, alpha, delta);
figure();

plot(x,'-*');
hold on;
plot(y);
set(gca,'FontSize',15);
legend('Value','Fudamental');

sbwut = SequentialTest(x','SBWUT',5);
figure('Position',[100,5000,600,600]);
subplot(2,1,1);
plot(z);
set(gca,'FontSize',15);
title('(a)','FontSize',15);
legend('Bubble','Location','northwest')
subplot(2,1,2);
plot(sbwut);
hold on
plot(1.8334*ones(1,100),':');
hold on
plot(0.5443*ones(1,100),'--');
hold on
plot(0.2612*ones(1,100),'ro');
legend('SWUT','1%','5%','10%','Location','northwest')
set(gca,'FontSize',15);
title('(b)','FontSize',15);
%t = SBWUT(flip(x)',5)
