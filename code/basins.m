% BASINS.M
% Calls NEWTBASN.M to generate Newton basins 

newmap16 = [ 0.00  0.00  0.00   % black
              0.50  0.40  0.00   % brown
              0.00  0.65  0.25   % green
              0.80  0.00  0.10   % red
              0.00  0.87  0.95   % light blue
              0.00  0.24  0.87   % blue
              0.95  0.71  0.00   % tan
              0.51  0.00  0.51   % purple
              1.00  0.48  0.00   % orange
              0.87  0.48  0.48   % pink
              0.50  0.00  0.00   % crimson
              0.00  0.00  0.48   % dark blue
              0.87  0.87  0.32   % yellow
              0.00  1.00  0.00   % bright green
              0.48  0.48  0.48   % gray
              0.87  0.87  0.87]; % white

polyn = [1 0 -14 0 183 0 -612 385 23 41 3]; 



% UN-REMARK THE WINDOW YOU WANT TO SEE
wind12 = [-4 4 -3 3];                      % The big picture
% wind12 = [-0.48 0.48 -0.36 0.36];        % The flower
% wind12 = [ 0.09  0.21  0.225  0.315];    % The bud

count = 50;          % Decrease for rough draft

% fac defines map resolution
fac = 100;
% fac = 20;                      % for a rough draft
% fac = 200;                     % very high resolution draft


w = newtbasn(polyn,wind12,count,fac);

image(w),colormap(newmap16), axis([-250 250 250 -250])
