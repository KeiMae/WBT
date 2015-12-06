function [tstat, delta_h, BIC] = ADF(y)
  len = length(y);
  Max_lags = 12;
  BICs = zeros(Max_lags-1,1);
  const =  ones(len,1);
  ydiff = diff(y);
  lags = zeros(len-1,Max_lags);
  for i = 1 : Max_lags
      for t = i : len - 1
          lags(t,i) = ydiff(t - i + 1);
      end
  end
  for i = 1:Max_lags-1    
      X = [const(1:len-1-i,1),y(i+1:len-1,1) ...
           ,lags(i+1:len-1,2:i+1)];
      beta =  (X' * X)\(X' * lags(i+1:len-1, 1));
      ydiff_hat =  X * beta;
      resid = ydiff(i+1:len-1) - ydiff_hat;
      RSS  = sum(resid.^2);
      BICs(i,1) = len*log(RSS / len) + (len - i)*log(len);
  end
  [BIC,lag] = min(BICs);
  i=lag;
  X_ = [const(1:len-1-i,1),y(i+1:len-1,1) ...
       ,lags(i+1:len-1,2:i+1)];
  beta_ =  (X_' * X_)\(X_' * lags(i+1:len-1,1));
  ydiff_hat_ =  X_ * beta_;
  resid_ = ydiff(i+1:len-1,1) - ydiff_hat_;
  delta_h = beta_(2,1);
  var_resid_ = (resid_' * resid_) / (length(ydiff) - i  - i - 2);
  tmp = inv(X_'*X_);
  tstat = beta_(2,1) / sqrt(var_resid_ * tmp(2,2));
end
