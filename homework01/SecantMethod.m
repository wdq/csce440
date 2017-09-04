% Find the approximate root of a function using the Secant Method.

% Example usage:
% f = @(x) (4*(x^3))-(x^2)+(8*x)+(4*(exp(x)))+10
% out = SecantMethod(f, 1, 0.99, 50, 0.0001)

function [ output ] = SecantMethod( equation, p0, p1, maxIterations, tolerance )

    % Keep track of iteration count, and the past couple of approximations.
    iteration = 0;
    previousP1 = p1;
    previousP2 = p0;
    
    % Save the equation too.
    secantF = equation;
    
    % Try while below the maximum number of iterations.
    while iteration < maxIterations
        
        % Use the secant derivative approximation to find approximation p.
        secantPrimeF = (secantF(previousP1) - secantF(previousP2)) / (previousP1 - previousP2);
        p = previousP2 - (secantF(previousP2) / secantPrimeF);
        
        % Print out the results of the iteration
        fprintf('Iteration #%d: SecantMethod(), p=%f\n', iteration, p);
        
        % If within tolerance, output the approximation.
        if abs(p - previousP1) < tolerance
            output = p;
            return;
        end
        
        % Update the estimations and iteration counter for the next run.
        previousP2 = previousP1;
        previousP1 = p;
        iteration = iteration + 1;
    end
    
    output = 'Error: reached iteration limit without finding approximation within tolerance.'
end

