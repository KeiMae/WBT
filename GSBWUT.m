function Sup_t  = GSBWUT( tseries , initial_len )
  len = length(tseries);
  tmps = [];
  for t =  initial_len  : len
      tmp = WaveletUnitroot(flip(tseries(1:t)),10);
      tmps = [tmps,tmp];
  end
  Sup_t = max(tmps);
end
