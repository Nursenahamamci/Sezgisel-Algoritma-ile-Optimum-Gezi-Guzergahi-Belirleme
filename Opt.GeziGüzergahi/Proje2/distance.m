function z = distance(x,positions)
z =0;
for i=1:7

z = sqrt((positions(x(i),1) - positions(x(i+1),1))^2 + (positions(x(i),2) - positions(x(i+1),2))^2) + z;


end


end