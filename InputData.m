function [p, pf, b] = InputData(path)
  data = csvread(path);
  p = data(1,1:100)';
  pf = data(2,1:100)';
  b = data(3,1:100)';      
end
