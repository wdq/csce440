% Define weather station data
station1x = [1, 5, 8, 12, 15, 19, 22, 26, 29];
station1y = [30, 33, 35, 27, 29, 32, 25, 37, 39];

station2x = [2, 4, 9, 11, 16, 18, 23, 25, 30];
station2y = [36, 35, 30, 28, 34, 32, 36, 37, 40];

station3x = [6, 13, 20, 27];
station3y = [42, 36, 38, 40];

station4x = [7, 14, 21, 28];
station4y = [32, 34, 36, 35];

% Define point to solve

pointToSolve = 10;

% Go through each station and find the output for each.

fprintf("/--------------------------------------------------/\n");
fprintf("/--------------------Station 1---------------------/\n");
fprintf("/--------------------------------------------------/\n");
fprintf("\n\n/----------------Lagrange------------------/\n");
station1Lagrange = LagrangeInterpolation(station1x, station1y, pointToSolve)
fprintf("\n\n/----------------Neville------------------/\n");
station1Neville = NevilleInterpolation(station1x, station1y, pointToSolve)
fprintf("\n\n/----------------Newton------------------/\n");
station1Newton = NewtonInterpolation(station1x, station1y, pointToSolve)
fprintf("\n\n");


fprintf("/--------------------------------------------------/\n");
fprintf("/--------------------Station 2---------------------/\n");
fprintf("/--------------------------------------------------/\n");
fprintf("\n\n/----------------Lagrange------------------/\n");
station2Lagrange = LagrangeInterpolation(station2x, station2y, pointToSolve)
fprintf("\n\n/----------------Neville------------------/\n");
station2Neville = NevilleInterpolation(station2x, station2y, pointToSolve)
fprintf("\n\n/----------------Newton------------------/\n");
station2Newton = NewtonInterpolation(station2x, station2y, pointToSolve)
fprintf("\n\n");


fprintf("/--------------------------------------------------/\n");
fprintf("/--------------------Station 3---------------------/\n");
fprintf("/--------------------------------------------------/\n");
fprintf("\n\n/----------------Lagrange------------------/\n");
station3Lagrange = LagrangeInterpolation(station3x, station3y, pointToSolve)
fprintf("\n\n/----------------Neville------------------/\n");
station3Neville = NevilleInterpolation(station3x, station3y, pointToSolve)
fprintf("\n\n/----------------Newton------------------/\n");
station3Newton = NewtonInterpolation(station3x, station3y, pointToSolve)
fprintf("\n\n");


fprintf("/--------------------------------------------------/\n");
fprintf("/--------------------Station 4---------------------/\n");
fprintf("/--------------------------------------------------/\n");
fprintf("\n\n/----------------Lagrange------------------/\n");
station4Lagrange = LagrangeInterpolation(station4x, station4y, pointToSolve)
fprintf("\n\n/----------------Neville------------------/\n");
station4Neville = NevilleInterpolation(station4x, station4y, pointToSolve)
fprintf("\n\n/----------------Newton------------------/\n");
station4Newton = NewtonInterpolation(station4x, station4y, pointToSolve)
fprintf("\n\n");


