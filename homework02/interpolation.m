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

% Lagrange Polynomial Interpolation

station1Lagrange = LagrangeInterpolation(station1x, station1y, pointToSolve)
station2Lagrange = LagrangeInterpolation(station2x, station2y, pointToSolve)
station3Lagrange = LagrangeInterpolation(station3x, station3y, pointToSolve)
station4Lagrange = LagrangeInterpolation(station4x, station4y, pointToSolve)

% Neville Polynomial Interpolation

station1Neville = NevilleInterpolation(station1x, station1y, pointToSolve)
station2Neville = NevilleInterpolation(station2x, station2y, pointToSolve)
station3Neville = NevilleInterpolation(station3x, station3y, pointToSolve)
station4Neville = NevilleInterpolation(station4x, station4y, pointToSolve)