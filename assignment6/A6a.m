%recursive trapezoid method'


n=1;
h=1/2;
I = erf(1);
It = (1/2)*h*(f(0)+f(1)) + h *f(h);

err = abs(It-I);
while err > 10^(-6)
    n=n+1;
    h=2^(-n);
    s=0;
    for i=1:2^(n-1)
        s= s+f((2*i-1)*h);
    end
    T = It;
    It = (0.5*It + h*s);
    err = abs(It-T);
    
end
err = abs(It-I);

fprintf("Number of evaluations = %d\n",n);
fprintf("Final result%f\n",It);
fprintf("The error is%e\n",err);


