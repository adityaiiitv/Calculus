clear all;
close all;
n=1000; m=30;
x=-1:2/n:1;
[X,Y]=meshgrid(x,x);
Z=X+1i*Y; % define grid for picture
for i=1:m
Z=Z-(Z.^5-1)./(5*Z.^4); % perform m iterations in parallel
end;
a=20;
image((round(imag(Z))+2)*a); 
axis off
