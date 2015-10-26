function tstates  = CalcWUThist(len, times,kernel)
  if nargin == 0
    len = 100;
    times = 10000;
    kernel = 10;
  end
  tstates = [];
  ave = 0;
  vari = 0;
  a = 1.0;
  h = waitbar(0,'1','Name','Calc distribution...',...
            'CreateCancelBtn',...
            'setappdata(gcbf,''canceling'',1)');
  setappdata(h,'canceling',0);
    for cnt = 1:times
    if getappdata(h,'canceling')
      break
    end
    y = CreateAR1(len,a);
    tmp=  WaveletUnitroot(y', kernel, 'haar', 1);
    tstates = [tstates,tmp];
    ave = mean(tstates);
    vari = var(tstates);
    waitbar(cnt/times,h,sprintf('mean:%12.9f,var:%12.9f',...
                                 ave,vari));
  end
  delete(h)
  tstates;
end
