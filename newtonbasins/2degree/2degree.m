function 2degree(a,b,c)
 
min_re = 2.5;
max_re = 5.5;
min_im = -1;
max_im = 1;
n_re = 200;
n_im = 200;
tol = 0.01;
coeff = [a b c];
polyroots = roots(coeff);
r1=polyroots(1);
r2=polyroots(2);
max_steps=50;

delta_re = (max_re-min_re)/n_re; 
delta_im = (max_im-min_im)/n_im;
x = min_re:delta_re:max_re; 
y = min_im:delta_im:max_im;
[X,Y]=meshgrid(x,y); 

Z = X + i*Y;

for j = 1:n_im + 1
for k = 1:n_re + 1

z = Z(j,k);

if z == 0
z = tol;
end

flag = 0;
p=0;
while (flag <= max_steps) && (p==0)
z = z - (a*z.^2 + b*z + c)./(2*a*z + b);
if norm(a*z.^2 + b*z.^1 + c) <= tol
p=1;
end
flag=flag+1;
end
if norm(z-r1)<=tol
Z(j,k)=0;

elseif norm(z-r2)<=tol
Z(j,k)=255;

end
end
end
axis([2.5 5.5 -1 1]);
brighten(0.9);
pcolor(X,Y,Z)
shading flat;

endfunction


