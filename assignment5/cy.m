function cy


numKnots = 7;

knots = zeros(numKnots,1);
for i = 1:numKnots
    knots(8-i) = cos((2*i-1)*pi/14);
end
x = knots;
y = f(x);

%print coefficent
a = newton_find_A(x,y);
z = qubic_findz(x,y);
c = leastsqurefind_c(x,y);

a
z
c

X = -1:0.01:1.0;
Yf = f(X);
Yn = newton_pval(a,x,X);
Yspl=eval_qubic_spline(X,x,y,z);
Ylsq=eval_listsquare(c,X);

hold on;
xlabel('x');
ylabel('y');
title('Graph');
plot(X,Yf,'-','Color', 'b');
plot(X,Yn,'-','Color', 'r');
plot(X,Yspl,'-','Color', 'y');
plot(X,Ylsq,'-','Color', 'g');

legend('y= f(x)','y=p(x)','y=S(x)','y=g(x)','Location’,’Best'); hold off;
numKnots = 13;
knots = zeros(numKnots,1);
for i = 1:numKnots
    knots(i) = -1+(i-1)*(1/6);
end

display(sprintf('\n   x        f(x)       f(x)-p(x)       f(x)-S(x)      f(x)-g(x)'));
for i=1:numKnots
x2 = knots(i);
fx = f(x2);
px = fx-newton_pval(a,x,x2);
sx = fx-eval_qubic_spline(x2,x,y,z);
gx = fx-eval_listsquare(c,x2);
display(sprintf('%9f   %9f   %9f   %9f   %9f',x2,fx,px,sx,gx));
end
