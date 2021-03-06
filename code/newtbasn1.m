function  w = newtbasn1(poly,wind,count,fac)
% Constructs Newton basins for the polynomial  POLY
% Using the window WIND in the complex plane
% COUNT Newton's method iterations are carried out
% Output  w  is matrix of root numbers


r = roots(poly);                 % find the roots of poly
n = length(r);
deriv = fliplr(1:n).*poly(1:n);  % differentiate poly

a = wind(1);       b = wind(2);  % viewing window
c = wind(3);       d = wind(4);  % in the complex plane

p = (b-a)*fac;  q = (d-c)*fac;   % p x q  grid of points

one = ones(q,p);

x = a : (b-a)/(p-1) : b;

y = c : (d-c)/(q-1) : d;

[x,y] = meshgrid(x,y);           % grid of complex points
z = x + i*y;

clear x y

for k = 1:count
   numer = polyval(poly, z);    % the polynomial
   denom = polyval(deriv,z);    % its derivative
   z = z - numer./denom;        % Newton's iteration
end

clear numer denom
w = one;
for j = 1 : n                         % convert matrix of roots
   w = w + j*( abs(z-r(j)) < 0.1 );  % to matrix of color nos.
end

w = flipud(w);
% image(w), axis off
