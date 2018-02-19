
global counter;
a = 0;
b = 1;
c = (a+b)/2;
fa = feval('f',a);
fb = feval('f',b);
fc = feval('f',c);
counter = 3;

result = A6c('f',a,b,power(10,-6),1,100,fa,fb,fc);
err = erf(1)-result;
fprintf("Final result = %f\n",result);
fprintf("Numbers of evaluation =  %d\n",counter);
fprintf("The error is %e\n",err);