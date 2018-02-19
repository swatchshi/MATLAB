function x = geppm(a,d,b)
l = length(b);
n=(l-1)/2;
for k = 1:n 
    if(abs(d(k))== 0)&&(abs(a(k))==0)
        error("A is singular") ;
    
    elseif abs(d(k))<abs(a(k))
        temp=d(k);
        d(k)=a(k);
        a(k)=temp;
        temp=d(l+1-k);
        d(l+1-k)=a(l+1-k);
        a(l+1-k)=temp;
        temp=b(k);
        b(k)=b(l+1-k);
        b(l+1-k)=temp;
    end
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
        
        
        
        
        
        
        
        
        
    
    
    
