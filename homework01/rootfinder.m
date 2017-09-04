% This script runs the three scripts to solve the three parts of the
% homework problem.

% Set f to the equation.
f = @(x) (4*(x^3))-(x^2)+(8*x)+(4*(exp(x)))+10;

% Find approximate root using Bisection Method.
fprintf('/-----------------------------------------------------/\n');
fprintf('/------------------BISECTION-METHOD-------------------/\n');
fprintf('/-----------------------------------------------------/\n');
bisectionMethodOutput = BisectionMethod(f, -1, 1, 50, 0.0001)

% Find approximate root using Newton Method.
fprintf('/-----------------------------------------------------/\n');
fprintf('/-------------------NEWTON-METHOD---------------------/\n');
fprintf('/-----------------------------------------------------/\n');
newtonMethodOutput = NewtonMethod(f, 1, 50, 0.0001)

% Find approximate root using Secant Method.
fprintf('/-----------------------------------------------------/\n');
fprintf('/--------------------SECANT-METHOD--------------------/\n');
fprintf('/-----------------------------------------------------/\n');
secantMethodOutput = SecantMethod(f, 1, 0.99, 50, 0.0001)