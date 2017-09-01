function [ output ] = BisectionMethod( equation, intervalStart, intervalEnd, tolerance, maxIterations )
    iteration = 0;
    a = intervalStart;
    b = intervalEnd;
    previousP = 0;
    
    % Todo: It looks like the method requires checking for the stopping
    % criteria and then determining to run (f,a,p) or (f,p,b) before it
    % starts running.
    
    while iteration < maxIterations
        
        
        % Find the function output values and midpoints that are needed
        p = (intervalStart+intervalEnd)/2;
        pOutput = equation(p);
        aOutput = equation(a);
        bOutput = equation(b);
        
        fprintf('Iteration #%d: BisectionMethod(f, %d, %d), p=%d\n', iteration, a, b, p);
        
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
        if (aOutput > 0 && bOutput < 0) || (aOutput < 0 && bOutput > 0)
            b = p;
        else 
            a = p;
        end              
        
        % Finish preparing for the next iteration
        previousP = p;
        iteration = iteration + 1;
    end
    
    
end

% f = @(x) (4*(x^3))-(x^2)+(8*x)+(4*(exp(x)))+10
% out = BisectionMethod(f, -1, 1, 0.0001, 100000)
