% Find the approximate root of a function using the Bisection Method.

% Example usage:
% f = @(x) (4*(x^3))-(x^2)+(8*x)+(4*(exp(x)))+10
% out = BisectionMethod(f, -1, 1, 50, 0.0001)

function [ output ] = BisectionMethod( equation, intervalStart, intervalEnd, maxIterations, tolerance )
    
    % Keep track of iteration number, previous approximation, and interval.
    iteration = 0;
    a = intervalStart;
    b = intervalEnd;
    previousP = 0;
    
    % Try while below the maximum number of iterations.
    while iteration < maxIterations
        
        % Find the function output values and midpoints that are needed
        p = (a+b)/2;
        pOutput = equation(p);
        aOutput = equation(a);
        bOutput = equation(b);
        
        % Print out iteration info
        %fprintf('Iteration #%d: BisectionMethod(f, %f, %f), p=%f, f(a)=%f, f(b)=%f, f(p)=%f\n', iteration, a, b, p, aOutput, bOutput, pOutput);
        fprintf('Iteration #%d: BisectionMethod(f, %f, %f), p=%f\n', iteration, a, b, p);
        
        % Check stopping criteria conditions
        stoppingCriteriaMet = 0;
        if iteration > 0
            if abs(p - previousP) < tolerance
                stoppingCriteriaMet = 1;
            end
            if abs(p - previousP) / abs(p) < tolerance
                    stoppingCriteriaMet = 1;
            end
        end
        if abs(pOutput) < tolerance
            stoppingCriteriaMet = 1;
        end
        
        % If the stopping criteria is met, then return the output
        if stoppingCriteriaMet == 1
            output = p;
            return
        end
        
        % Otherwise determine what the next iteration will be
        if bOutput * pOutput < 0
            a = p;
        end
        if bOutput * pOutput > 0
            b = p;
        end             
        
        % Finish preparing for the next iteration
        previousP = p;
        iteration = iteration + 1;
    end
    output = 'Error: reached iteration limit without finding approximation within tolerance.'
end
