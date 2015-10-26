str={'1989/04','1993/07','1997/07','2001/09','2006/03','2010/05','2014/07'};
day=[1,50,100,150,200,250,300];

figure()
plot(IPI)
set(gca,'FontName','symbol','xTick',day,'xtickLabel',str)
xlim([1,303])

figure()
plot(CPI)
set(gca,'FontName','symbol','xTick',day,'xtickLabel',str)
xlim([1,303])
