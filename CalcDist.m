function tstates = CalcDist(mode, len, times, r0, moder0)
    if nargin == 1
        len = 300;
        times = 2000;
        r0 = 0.1;
        moder0= 'rate' ;
    end
    tstates = zeros(times,1);
    %h = waitbar(0,'1','Name','Calc distribution...',...
    %            'CreateCancelBtn',...
    %            'setappdata(gcbf,''canceling'',1)');
    %setappdata(h,'canceling',0)
    for cnt = 1:times
        %if getappdata(h,'canceling')
        %    break
        %end
        y = StandardWinner(len);
        switch mode
            case 'SBWUT'
                tmp = SBWUT(y,r0, moder0);
                
            case 'SADF'
                tmp = SADF(y,r0, moder0);
                
            case 'GSADF'
                tmp = GSADF(y,r0, moder0);
                
            otherwise
                warning('modes are GSADF, SADF or SBWUT')
                delete(h)
        end
        tstates(cnt,1) = tmp;
        %waitbar(cnt/times,h,sprintf('Calc Dist...'));
    end
    %delete(h);
end