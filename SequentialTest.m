function t_val_series = SequentialTest(y,mode,r0)
  if nargin == 2
    r0 = 10;
  end
  len = length(y);
  t_val_series = zeros(len,1);
  times=len-r0;
  h = waitbar(0,'1','Name','Calc distribution...',...
            'CreateCancelBtn',...
            'setappdata(gcbf,''canceling'',1)');
  setappdata(h,'canceling',0)

  switch mode
  case 'WUT'
    for i = r0 : len
      if getappdata(h,'canceling')
        break
      end
      t_val_series(i,1) = WaveletUnitroot(y(1:i),r0);
      waitbar(i/times,h,sprintf('now calc..'));
    end

  case 'SBWUT'
    for i = r0 : len
      if getappdata(h,'canceling')
        break
      end
      t_val_series(i,1) = SBWUT(y(1:i),r0);
      waitbar(i/times,h,sprintf('now calc..'));
    end

  case 'ADF'
    for i = r0 : len
      if getappdata(h,'canceling')
        break
      end
      t_val_series(i,1) = SADF(y(1:i)); %now debugging
      waitbar(i/times,h,sprintf('now calc..'));
    end
  otherwise
    warning('SBWUT, WUT or ADF')
  end
  delete(h)
end
