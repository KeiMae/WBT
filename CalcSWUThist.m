function tstates  = CalcSWUThist(len,times)
  if nargin == 0
    len = 100;
    times = 10000;
  end
  ave = 0;
  vari = 0;
  tstates = [];
  a = 1.00;
  h = waitbar(0,'1','Name','Calc distribution...',...
            'CreateCancelBtn',...
            'setappdata(gcbf,''canceling'',1)');
  setappdata(h,'canceling',0)
  for cnt = 1:times
    if getappdata(h,'canceling')
      break
    end
    y = CreateAR1(len,a);
    tmp = SBWUT(y',5);
    tstates = [tstates,tmp];
    ave = mean(tstates);
    vari = var(tstates);
    waitbar(cnt/times,h,sprintf('mean:%12.9f,var:%12.9f',...
                                 ave,vari));
  end
  delete(h)
  tstates;
end
