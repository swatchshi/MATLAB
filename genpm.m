function x = genpm(a,d,b)
% genp.m    Gauss elimination with no pivoting
% 
% input:  a is an 2n+1 vector
%         b is an 2n+1 vector
%         d is an 2n+1 vector
% output: x is the solution 
%
l = length(b);
n=(l-1)/2;

for k = 1:n  
   mult=a(k)/d(k);
   d(l+1-k) = d(l+1-k)- mult*a(l+1-k);
   b(l+1-k) = b(l+1-k)-mult*b(k);
end
x = zeros(l,1);
for k =l:-1:n+1
    x(k)=b(k)/d(k);
end



for k = n:-1:1  
  x(k) = (b(k) - a(l+1-k)*x(1+l-k))/d(k);
end


