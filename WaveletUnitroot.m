function stat = WaveletUnitroot(tseries,kernel,wname,scal)
  if nargin == 1
    wname = 'haar';
    scal = 1 ;
    kernel = 10;
  end
  if nargin == 2
    wname = 'haar';
    scal = 1 ;
  end

  y_diff = diff(tseries);
  y_tilda = zeros(1,length(y_diff));
  for t = 1 : length(y_diff)
    y_tilda(t) = sum( y_diff(1:t) - mean(y_diff));
  end
  anarized = (y_tilda - mean(y_tilda))';
  [v,w] = dwt(anarized , wname, 1);
  %OLS
  X = zeros(length(tseries),1);
  X(2:length(tseries),1) = tseries(1:length(tseries)-1);
  beta1 = inv(X' * X);
  beta2 = X' * tseries(1:length(tseries));
  beta = beta1 * beta2;
  y_hat = X * beta;
  u = tseries - y_hat;
  gamma_0 = ((u - mean(u))' * (u - mean(u))) / length(u);

  %kernel
  bandwidth = kernel;
%  omega = gamma_0;
  %gamma = xcorr(u,bandwidth+1)
  longrunVar = 0;
  for j = 1:bandwidth
   u_j_1 = u(j + 1:length(tseries)) - mean(u);
   u_j_2 = u(1:length(tseries) - j) - mean(u);
   u_j = u_j_1' * u_j_2 / length(u);
   longrunVar = longrunVar + (1 - j / (bandwidth + 1)) * u_j;
  end
  omega = 2* longrunVar + gamma_0;
  v_sq = sum(w(1:length(w)-1).^2)/(length(w)-1);
  S_Ld =  -sum(w.^2)/sum(anarized.^2);
  stat =  2*length(tseries)*(omega/v_sq)*(S_Ld);
end
