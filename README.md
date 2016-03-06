# WBT
2016 修士論文で使用したアルゴリズム

2016's My master Graduate article's Algorithm
Economic Bubble detecter using time-frequency approch
WBT means Wavelet Bubble Test.
Using Wavelet transform as time-frequency analysis, WBT find 'explosive behavior' in the ecomomic time series.
In Bubble boom, time series show this behavior (Phillips, Peter CB, Shu-Ping Shi, and Jun Yu. "Testing for multiple bubbles." (2012)).

Most of all codes are written as function,
so you can use easliy.
Note that you need Matlab 2014a or later.
This is because I used dwt() added in this versions


My core algoritm is WBT based on GSADF, Generalized Supreme ADF
About deteil of GSADF, see Phillips, Peter CB, Shu-Ping Shi, and Jun Yu. "Testing for multiple bubbles." (2012).

I replace ADF test of GSADF to wavelet based unitroot test(Fan, Yanqin, and Ramazan Gençay. "Unit root tests with wavelets." Econometric Theory 26.05 (2010): 1305-1331.)

Unfortunately, my articles written only in Japanese and only abstract is public thanks to my bass.
However, if you want to see my algorithm and my research result, please contact.

SBWUT, which you can see in this repository, means WBT.

USEGE

First of all, See exec_test_topix_adf.m
This is WBT's usage.

Execution files are exec_test_topic_adf.m, exec_test_topic_wbt.m, exchange_test_adf.m and exchange_test_wbt.m.
These files include methods of input datas, test and save outputs.
Some file(datas and so on) is lucked so you need prepare them.
If you contact me, I can give you my used data.
