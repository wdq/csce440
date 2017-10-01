
% Data points (vertices)
% Row 1 is ID, row 2 is x, row 3 is y, row 4 is z (elevation)
% Each column is a new point.
points = [ 1 2 3 4 5 6 7 8 9 10 11; 0 12 20 5 16 0 3 10 0 5 20; 20 20 20 13 12 10 6 6 0 0 0; 11550 11592 11640 13650 12240 10500 9870 12600 9915 12915 13680;];

% The triangles formed from the data points
% Row 1 is ID, rows 2-4 are the IDs of the data points for the vertices
% Each column is a new triangle.
triangles = [1 2 3 4 5 6 7 8 9 10 11 12 13; 1 2 1 2 2 3 4 5 6 6 7 7 8; 2 3 4 8 5 11 8 11 7 8 10 8 11; 4 5 6 4 8 5 6 8 9 7 9 10 10;];

% Run the triangles through the function.
result = LinearSpatialInterpolation(points, triangles);




% For question #6, use the scatteredInterpolant(x,y,v) function
x = [0; 12; 20; 5; 16; 0; 3; 10; 0; 5; 20];
y = [20; 20; 20; 13; 12; 10; 6; 6; 0; 0; 0];
z = [11550; 11592; 11640; 13650; 12240; 10500; 9870; 12600; 9915; 12915; 13680];
F = scatteredInterpolant(x,y,z, 'linear');
x = [0; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20; 21];
y = [0; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20; 21];
[X,Y] = ndgrid(x,y);
Zq = F(X,Y);
mesh(X,Y,Zq);
