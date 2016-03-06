topix_swut = csvread('./outputdata/topix_swut.csv');
topix_adf = csvread('./outputdata/topix_adf.csv',1,0);
FX_adf = csvread('./outputdata/FX_adf.csv');
FX_swut = csvread('./outputdata/FX_swut.csv');
FX_PPI_adf= csvread('./outputdata/FX_PPI_adf.csv');
FX_PPI_swut= csvread('./outputdata/FX_PPI_swut.csv');
DIV_adf = csvread('./outputdata/dvi_adf.csv');
DIV_swut = csvread('./outputdata/dvi_swut.csv');
CVs_adf = csvread('./outputdata/CVs_adf.csv');
CVs_swut =  csvread('./outputdata/CVs_swut2.csv');
%% TOPIX
tvals_swut = topix_swut(:,1);
tvals_adf = topix_adf(:,1);

%% FX nominal
FXtvals_swut = FX_swut(:,1);
FXtvals_adf = FX_adf(:,1);
%% FX real
FX_PPItvals_swut = FX_PPI_swut(:,1);
FX_PPItvals_adf = FX_PPI_adf(:,1);

%% Dividend
DIVtvals_adf = DIV_adf(:,1);
DIVtvals_swut = DIV_swut(:,1);

%% data
FXdata = dlmread('../data/FX7302_1510.csv',',',1,0);
FX = FXdata(:,2);

TOPIXdata = dlmread('../data/topix7302_1510.csv',',',1,0);
TOPIX = TOPIXdata(:,4);