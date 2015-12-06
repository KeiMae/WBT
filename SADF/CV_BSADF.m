%**************************************************************************
%   "Testing for Multiple Bubbles" by Phillips, Shi and Yu (2011)
    
%   In this program, we calculate critical value sequences for the backward SADF
%   statistic sequence.
% *************************************************************************

 

clear all
close all
clc

format short

tic;

 
qe=[0.90;0.95;0.99];


m=2000;
T=1680;            % change your sample size here
r0=0.01+1.8/sqrt(T);
swindow0=floor(r0*T);       % change your minimum window size here


dim=T-swindow0+1;
Msadfs=zeros(m,dim);

for r2=swindow0:1:T;
   SI=1;
   randn('seed',SI);   
   e=randn(r2,m); 
   a=r2^(-1);
   y=cumsum(e+a);
   
%% THE SUP ADF TEST %%%%%%
  badfs=zeros(r2-swindow0+1,m); 
  for j=1:1:m; 
     for r1=1:1:r2-swindow0+1; 
        badfs(r1,j)= ADF_FL(y(r1:r2,j),0,1);  
     end;   
  end;
  
  if r2==swindow0;
      sadfs=badfs;
  else
     sadfs=max(badfs);
  end;
  
  Msadfs(:,r2-swindow0+1)=sadfs';
end;

quantile_bsadfs=quantile(Msadfs,qe);
toc;
dlmwrite('CV_BSADF1680.txt', [qe quantile_bsadfs],'-append', 'delimiter', '\t','precision', '%14.7f')
type CV_BSADF1680.txt

plot(quantile_bsadfs(2,:));
