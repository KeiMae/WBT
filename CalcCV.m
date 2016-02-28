function [cv1, cv5, cv10] = CalcCV(dist)
   T = length(dist);
   sortDist = sort(dist,'descend');
   cv1 = sortDist(fix(T/100));
   cv5 = sortDist(fix(5*T/100));
   cv10 = sortDist(fix(10*T/100));
end
