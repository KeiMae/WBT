function t_val_series  = GSADF( tseries )
  t_val_series = [];
  r0 = fix( length(tseries) * 0.1 );
  for s = r0 : length(tseries)
    tmps = [];
    for t =  1 : s - r0 - 1
      [h,~,~,~,reg] = adftest(tseries(t:s));
      tmp = reg.tStats.t;
      tmps = [tmps, tmp];
    end
    t_val_series = [t_val_series,max(tmp)];
  end
end
