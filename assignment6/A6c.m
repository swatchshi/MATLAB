function numI = A6c(f,a,b,epsilon,level,level_max,fa,fb,fc)
%adptive simpson's method
h = b-a;
I1 = h*(fa+4*fc+fb)/6;
level = level+1;
c = (a+b)/2;
d = (a+c)/2;
e = (c+b)/2;
fd = feval(f,d);
fe = feval(f,e);
I2 = h*(fa+4*fd+2*fc+4*fe+fb)/12;
global counter;
counter = counter + 2;
if level>=level_max
    numI = I2;
else
 if abs(I2-I1)<=15*epsilon
        numI = I2;
 else
    numI = A6c(f,a,c,epsilon/2,level,level_max,fa,fc,fd)+A6c(f,c,b,epsilon/2,level,level_max,fc,fb,fe);

 end
end
end
