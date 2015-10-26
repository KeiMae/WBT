%function value = wave_signif_my(x, scale, scales, wname)
t = 1:1:200;
x = sin(2 * pi * (1/15) * t);
scale = 1;
scales = 1:64;
wname = 'haar'; 
len_x = length(x);
regress_result = fitlm(x(1:len_x-1),x(2:len_x));
alpha = regress_result.Coefficients.Estimate(2);
p = (1-alpha^2)/(1+alpha^2-2*alpha*cos(2*pi*scale/len_x));
wave_coefs = cwt(x, scales, wname);
wave_coef = abs(wave_coefs(scale,:));
w = ( wave_coef .^ 2 ) / ( var(x) * p);
DFs = 2 * ones(1,len_x);
value = chi2cdf(w,DFs);
plot(value)
%end
