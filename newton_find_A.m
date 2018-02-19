function a = newton_find_A(x,y)
n = length(y);
a = zeros(n,1);
for k = 0 : n-1
    a(k) = y(k);
    for i = k+1 : n
    y(i) = (y(i)-y(k))/(x(i)-x(k));
    end
end
a(n) = y(n);
end