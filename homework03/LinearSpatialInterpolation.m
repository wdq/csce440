function [ output ] = LinearSpatialInterpolation( points, triangles )
    trianglesCount = length(triangles);
    output = 0;
    
    % Define the symbolic variables
    syms x y
    
    for trianglesCounter = 1:trianglesCount
        % Get the data point coordinates from the input
        % Point 1
        point1X = points(2, triangles(2, trianglesCounter));
        point1Y = points(3, triangles(2, trianglesCounter));
        point1Z = points(4, triangles(2, trianglesCounter));
        % Point 2
        point2X = points(2, triangles(3, trianglesCounter));
        point2Y = points(3, triangles(3, trianglesCounter));
        point2Z = points(4, triangles(3, trianglesCounter));
        % Point 3
        point3X = points(2, triangles(4, trianglesCounter));
        point3Y = points(3, triangles(4, trianglesCounter));
        point3Z = points(4, triangles(4, trianglesCounter));
        
        % Find the value of A
        AMatrix = [1 point1X point1Y; 1 point2X point2Y; 1 point3X point3Y];
        A = (1/2) * det(AMatrix);
        
        % Find the coefficients (shape functions)
        n1 = ((x * (point2Y - point3Y)) - (y * (point2X - point3X)) + ((point2X * point3Y) - (point3X * point2Y))) / (2 * A);
        n2 = ((x * (point3Y - point1Y)) - (y * (point3X - point1X)) + ((point3X * point1Y) - (point1X * point3Y))) / (2 * A);
        n3 = ((x * (point1Y - point2Y)) - (y * (point1X - point2X)) + ((point1X * point2Y) - (point2X * point1Y))) / (2 * A);
        
        % Find the linear interpolation function, and print it.
        fprintf("\n\n/----------------w%d(x,y):------------------/\n", trianglesCounter);
        w = (n1 * point1Z) + (n2 * point2Z) + (n3 * point3Z)
    end
    
    return
end

