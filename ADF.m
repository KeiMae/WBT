function tstat = ADF(y)
  len = length(y);
  Max_lags = 9;
  BICs = [];
  const =  ones(len,1);
  lags = zeros(len, Max_lags);
  for i = 1:Max_lags
    for j = i+1: len
      lags(j,i)= y(j) - y(j-i);
    end
  end
  for i = 1:Max_lags
    X = [const(1:len - i,1),y(i:len-1,1) ...
         ,lags(i:len-1,1:i)];
    beta1 = X' * X;
    beta2 = X' * y(i+1:len,1);
    beta =  inv(beta1) *  beta2;
    y_hat =  X * beta;
    resid = y(i+1:len) - y_hat;
    RSS  = sum(resid.^2);
    BICs = [BICs,len*log(RSS / len) + (len - i)*log(len)];
  end
  [BIC,lag] = min(BICs);
  i=lag;
  X_ = [const(1:len - i,1),y(i:len-1,1), ...
       lags(i:len-1,1:i)];
  beta1_ = X_' * X_;
  beta2_ = X_' * y(i+1:len,1);
  beta_ = inv(beta1_) * beta2_;
  y_hat_ =  X_ * beta_;
  resid = y(lag+1:len) - y_hat_;
  RSS  = sum(resid.^2);
  delta_h = beta(2,1);
  tmp = inv(X_'*X_);
  tstat = (beta(2,1)-1) / sqrt(var(resid) * tmp(2,2));
end
