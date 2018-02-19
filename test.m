
l=9;
n=(l-1)/2;
a=zeros(l,1);
b=zeros(l,1);
c=zeros(l,1);

for i =1:l
    a(i) = randn;
    
    d(i) = randn; 
end
                                                                                
a(n+1)=d(n+1);

d(1)=10^(-15);
a(1)=10^(-8);

for i=1:l
    b(i)=d(i) +a(l+1-i);
end

b(n+1) = d(n+1);

np_result=genpm(a,d,b);

pp_result=geppm(a,d,b);

x= ones(l,1);

np_ratio = norm(x-np_result)/norm(x);

pp_ratio = norm(x-pp_result)/norm(x);

A = zeros(l,l);

for i = 1:l
    A(i,i) =d(i);
    A(i,l-i+1) = a(l-i+1);
end

cond_A = cond(A);
epsilon_A = eps*cond(A);

np_result
pp_result

fprintf("error of genp is:%.20e\n",np_ratio);
fprintf("error of gepp is:%.20e\n",pp_ratio);
fprintf("epsilon is %.20e\n",epsilon_A);

