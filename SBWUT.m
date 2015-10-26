function Sup_t  = SBWUT( tseries , initial_len )
  len = length(tseries);
  tmps = [];
  for t =  initial_len-1  : len-1
      tmp = -1/WaveletUnitroot(flip(tseries(len-t:len)));
      tmps = [tmps,tmp];
  end
  Sup_t = max(tmps);
end
