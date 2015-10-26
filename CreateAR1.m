function series = CreateAR1(len,alpha,init)
  if nargin == 2
    init = 0;
  end
  series = [init];
  for i = 2:len
    series = [series,(alpha * series(i - 1) + normrnd(0,1))];
  end
end
