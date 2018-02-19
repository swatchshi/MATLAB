function root = secant(fname,x,y,xtol,ftol,n_max,display)
% Newton's Method.
%
% input:  fname is a string that names the function f(x).
%         
%         x,y are the initial points
%         xtol and ftol are termination tolerances
%         n_max is the maximum number of iteration
%         display = 1 if step-by-step display is desired,
%                 = 0 otherwise
% output: root is the computed root


n = 0;
fx = feval(fname,x);
fy = feval(fname,y);

if display 
   disp('   n             x                    f(x)')
   disp('------------------------------------------------------')
   disp(sprintf('%4d %23.15e %23.15e', n, x, fx))
   n=1;
end

if abs(fx) <= ftol
   root = x;
   return
end


if display 

   disp(sprintf('%4d %23.15e %23.15e', n, x, fx))
   n=2;
end

if abs(fx) <= ftol
   root = x;
   return
end
if display 

   disp(sprintf('%4d %23.15e %23.15e', n, x, fx))
   n=2;
end
if abs(fy) <= ftol
   root = y;
   return
end




for n = 2:n_max
    dc=(y-x)/(fy-fx);
    d=dc*fy;
    x=y;
    fx=fy;
    y=y-d;
    fy=feval(fname,y);
    
    
    if display 
       disp(sprintf('%4d %23.15e %23.15e', n, x, fx)), end
    if abs(d) <= xtol || abs(fx) <= ftol
       root = y;
       return
    end
    
   
    




end


root = y;
