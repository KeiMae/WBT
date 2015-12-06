function stat = WaveletUnitroot(tseries,kernel,wname,scal,mode)
  if nargin == 1
      wname = 'haar';
      scal = 1 ;
      kernel = 10;
      mode = 'detreand';
  end
  if nargin == 2
      wname = 'haar';
      scal = 1 ;
      mode = 'detrend';
  end
  switch mode 
      case 'detrend'
          y_diff = diff(tseries);
          y_tilda = zeros(1,length(y_diff));
          for t = 1 : length(y_diff)
              y_tilda(t) = sum( y_diff(1:t) - mean(y_diff));
          end
          anarized = (y_tilda - mean(y_tilda))';
      case 'demean'
          anarized = tseries - mean(tseries);
      
      case 'raw'
          anarized = tseries;
      otherwise
          warning('At mode, "demean" or "detrend" are usuable.')
          quit;
  end
    [~,w] = dwt(anarized , wname, scal);
    %OLS
    X = zeros(length(tseries),1);
    X(2:length(tseries),1) = tseries(1:length(tseries)-1);
    beta = inv(X' * X) * (X' * tseries(1:length(tseries)));
    y_hat = X * beta;
    u = tseries - y_hat;
    gamma_0 = ((u - mean(u))' * (u - mean(u))) / length(u);

    %kernel
    bandwidth = kernel;
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
