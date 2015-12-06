%**************************************************************************
%   "Testing for Multiple Bubbles" by Phillips, Shi and Yu (2011)
    
%   In this program, we calculate critical value sequences for the backward ADF
%   statistic sequence.
% *************************************************************************

 

clear all
close all
clc

format short
 
qe=[0.90;0.95;0.99];

tic;

m=1000;
T=100;            % change your sample size here
swindow0=40;       % change your minimum window size here


dim=T-swindow0+1;
adfs=zeros(m,dim);

for r2=swindow0:1:T;

   SI=1;
   randn('seed',SI);   
   e=randn(r2,m); 
   a=r2^(-1);
   y=cumsum(e+a);
   
   for j=1:1:m; 
      adfs(j,r2-swindow0+1)= ADF_FL(y(:,j),0,1);  
  end;

end;

quantile_badfs=quantile(adfs,qe);

%dlmwrite('CV_BADF1680_36.txt', [qe quantile_badfs],'-append', 'delimiter', '\t','precision', '%14.7f')
%type CV_BADF1680_36.txt

plot(quantile_badfs(2,:));
