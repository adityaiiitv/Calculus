clear all;
close all;
x0=4;
i=0;
f=@(x) x^2-2;
fprime=@(x) 2*x;
tolerance=10^(-7);
epsilon=10^(-14);
maxiterations=30;
fsol=false;
for i=1 : maxiterations
y=f(x0);
yprime=fprime(x0);
if(abs(yprime)<epsilon)
fprintf("Warning: denominator is too small\n");
break;
end
x1=x0-y/yprime;
c(i)=x1;
i=i+1;

if(abs(x1-x0)/abs(x1)<tolerance)
fsol=true;
break;
end
x0=x1;
end

if(fsol)
fprintf("the root is: %f \n",x1);
fprintf("The last computed app. root was",x1);
plot(c,'o--'); 
xlabel("Number of Newton iteration");
ylabel("Values of initial guess after each Newton iteration");
else
fprintf("warning:Not able to find solution to within the desired tolerance \n");

end

