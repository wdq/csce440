function [ output ] = NewtonMethod(initialApproximation, tolerance, maxIterations )

    syms x1
    equation = (4*(x1^3))-(x1^2)+(8*x1)+(4*(exp(x1)))+10;
    equationDerivative = diff(equation, x1);
    
    iteration = 0;
    previousP = initialApproximation;
    
    while iteration < maxIterations
        
        x1 = previousP;
        p = previousP - (subs(equation) / subs(equationDerivative));
        fprintf('Iteration #%d: NewtonMethod(f, %d), p=%d\n', iteration, p);
        if abs(p - previousP) < tolerance
            output = p;
            return;
        end
        
        previousP = p;
        iteration = iteration + 1;
    end

end

