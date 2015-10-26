function sup_t = SADF(y,r0)
  len_y = length(y);
  len = fix((1-r0) * len_y);
  init = fix(r0*len_y);
  t_mat = zeros(len,1);
  delta = zeros(len,1);
  for i =  init:len
    [delta(i-init+1,1),t_mat(i-init+1,1)] = ADF(y(1:i));
  end
  sup_t=max(t_mat);
end
