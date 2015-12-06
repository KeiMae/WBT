function series = CreateAR1(len,alpha,init, times)
  if nargin == 2
    init = rand(0,1);
    times = 1;
  end
  
  if nargin == 3
    times = 1;
  end
  
  series = zeros(len,times);
  inits = init .* ones(1,times);
  series(1,:) = inits;
  rands = normrnd(0,1,[len,times]);
  for i = 2:len
    series(i,:) = alpha .* series(i,:) + rands(i,:);
  end
end
