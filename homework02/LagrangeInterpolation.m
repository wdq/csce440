% Find result of the Lagrange interpolating polynomial at a point.

% Example usage:
% station4x = [7, 14, 21, 28];
% station4y = [32, 34, 36, 35];
% pointToSolve = 10;
% station4Lagrange = LagrangeInterpolation(station4x, station4y, pointToSolve)

function [ output ] = LagrangeInterpolation( xValues, yValues, point )

    % Create the output variable for leter, and get number of data points.
    output = 0;
    dataPointCount = length(xValues);
    
    % Keep track of iteration number, and the iteration limit.
    iteration = 0;
    maxIteration = dataPointCount - 1;
    
    % While there are iterations left continue working on the solution.
    while iteration <= maxIteration        
        iterationResult = 1;
        
        % Find the Li product term by looping through needed values.
        % Li is product from 0 to maxIterations, but not the current
        % iteration: (x-xj)/(xi-xj)
        for productCount = 0:(dataPointCount - 1)
            if productCount ~= iteration
                iterationResult = iterationResult * ((point - xValues(productCount+1)) / (xValues(iteration+1) - xValues(productCount+1)));
            end
        end
        
        % Incorporate the y value, and add the iteration results to output.
        output = output + (yValues(iteration+1) * iterationResult);
        
        iteration = iteration + 1; 
    end   
    
    return

end

