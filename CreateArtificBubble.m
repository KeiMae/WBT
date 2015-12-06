function [artific_bubble, price_f, B]  = CreateArtificBubble( size, mu, sigma, D_init, R, B_init, tau, pi, alpha ,delta)
  dividend = zeros(1,size);
  dividend(1) = D_init;
  for i = 2:size
    dividend(i) = mu + dividend( i - 1 ) + normrnd(0,sigma);
  end

  price_f = zeros(1,size); %fudamental_price
  for i = 1:size
    price_f(i) = (1 + R)/(R^2) * mu + dividend(i) / R;
  end

  B = zeros(1,size); %Bubblr process
  B(1) = B_init;
  eta = normrnd(0,tau,[1,size]);
  u = exp(eta - tau^2 / 2);
  theta = binornd(1, pi, [1,size]);

%  for t = 2 : size
%      %start bubble?
%    if B(t) == B_init
%      B(t) = B(t - 1) + R * B(t - 1) * theta(t) / pi;
%    else
%      B(t) = (1 + R) * B(t - 1);
%    end
%  end

  for t = 1 : size - 1
    %collasp bubble?
    if B(t) < alpha
       delta = 0.5;
      B(t + 1) = (1 + R) * B(t) * u(t+1);
    else
      delta = delta * 0.9;
      B(t + 1) = (delta + ((1 + R) * theta(t+1) * (B(t) - delta / (1 + R))) / pi) * u(t+1);
    end
  end


  artific_bubble = price_f  +  20 * B;

end
