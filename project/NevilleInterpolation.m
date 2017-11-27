% Find result of the Neville interpolating polynomial at a point.

% Example usage:
% station4x = [7, 14, 21, 28];
% station4y = [32, 34, 36, 35];
% pointToSolve = 10;
% station4Neville = NevilleInterpolation(station4x, station4y, pointToSolve)

function [ output ] = NevilleInterpolation( xValues, yValues, point )

    % Create the output variable for leter, and get number of data points.
    output = 0;
    dataPointCount = length(xValues);
    
    % Setup blank matrix to store the output of iterations.
    q = zeros(dataPointCount, dataPointCount);
    
    % Keep track of iteration number, and the iteration limit.
    iteration = 0;
    maxIteration = dataPointCount - 1;
    
    % Store the y values as the first column.
    while iteration <= maxIteration  
        q(iteration+1, 0+1) = yValues(iteration + 1);
        iteration = iteration + 1;
    end
    
    % Iterate through the columns to get closer to solution.
    j = 1;
    while j < maxIteration + 1
        i = j;
        while i < maxIteration + 1
            % Matlab indexing is kind of weird, this could all be cleaned
            % up, but it just finds the Neville value for each cell using
            % the xValues and the values in previously computed cells.
            q(i + 1, j + 1)  = (((point - xValues(i - j + 1)) * q(i + 1, j - 1 + 1)) / (xValues(i + 1) - xValues(i - j + 1))) + (((xValues(i + 1) - point) * q(i - 1 + 1, j - 1 + 1)) / (xValues(i + 1) - xValues(i - j + 1)));
            i = i + 1;
        end
        j = j + 1;
    end
    
    % Output the solution, the value in the last matrix cell.
    output = q(maxIteration + 1, maxIteration + 1);
    return;
end

