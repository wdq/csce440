% Find the approximate root of a function using the Newton Method.

% Example usage:
% f = @(x) (4*(x^3))-(x^2)+(8*x)+(4*(exp(x)))+10
% out = NewtonMethod(f, 1, 50, 0.0001)

function [ output ] = NewtonMethod(equation, p0, maxIterations, tolerance )

    % Keep track of the iteration, previous approximation, and function.
    iteration = 0;
    previousP = p0;
    newtonF = equation;
    
    % Found the magic to find the derivative here:
    % https://www.mathworks.com/matlabcentral/answers/17083-anonymous-function-differentiation-problem#answer_198649
    % Input must be function of x.
    derivativeFinder=@(fun,x,epsilon)imag(fun(x(:)+1i*epsilon))/epsilon;
    newtonPrimeF=@(x)derivativeFinder(newtonF,x,10^-20);
    
    % Try while below the maximum number of iterations.
    while iteration < maxIterations
        
        % Use the Newton method to find approximation p.
        p = previousP - (newtonF(previousP) / newtonPrimeF(previousP));
        
        % Print out the results of the iteration
        fprintf('Iteration #%d: NewtonMethod(), p=%f\n', iteration, p);
        
        % If within tolerance, output the approximation.
        if abs(p - previousP) < tolerance
            output = p;
            return;
        end
        
        % Update the estimation and iteration counter for the next run.
        previousP = p;
        iteration = iteration + 1;
    end
    
        output = 'Error: reached iteration limit without finding approximation within tolerance.'
end

