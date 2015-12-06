%**************************************************************************
%   "Testing for Multiple Bubbles" by Phillips, Shi and Yu (2011)
    
%   In this program, we calculate critical values for the generalized sup 
%   ADF statistic.
% *************************************************************************
 

clear all
close all
clc

format short

matlabpool('open',2);
qe=[0.90;0.95;0.99];

tic;

m=2000;
T=200;              % change your sample size here
swindow0=40;         % change your minimum window size here
r0=swindow0/T;  
dim=T-swindow0+1;

%% %%%% DATA GENERATING PROCESS %%%%%%
y=DGP(T,m);

%e=randn(T,m); 
%a=T^(-1);
%y=cumsum(e+a);


%% THE GENERALIZED SUP ADF TEST %%%%%%

gsadf=ones(m,1);  
parfor j=1:m; 
    sadfs=zeros(dim,1); 
    for r2=swindow0:1:T;
        dim0=r2-swindow0+1;
        rwadft=zeros(dim0,1);
        for r1=1:1:dim0; 
            rwadft(r1)= ADF_FL(y(r1:r2,j),0,1);  % two tail 5% significant level
        end;  
        sadfs(r2-swindow0+1)=max(rwadft);
    end;
    gsadf(j)=max(sadfs);
end;

toc;
matlabpool('close');

quantile_gsadf=quantile(gsadf,qe);

filename = 'CV_GSADF_200_02.xlsx';
xlswrite(filename,gsadf,1,'A1:A2000');

disp([qe quantile_gsadf]);

