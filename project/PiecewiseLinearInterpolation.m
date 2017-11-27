function [ output ] = PiecewiseLinearInterpolation( dataX, dataY, inputX )


% Si(x) = Yi + (Yi+1 - Yi)/(Ti+1 - Ti) * (X - Ti), i=0,1,...,n-1
% S(x) = { S0(x), X0 <= x <= X1
%        { S1(x), X1 <= x <= X2
%        { S2(x), X2 <= x <= X3
%        { ...
%        { Sn-1(x), Xn-1 <= x <= Xn

syms x

output = zeros(size(inputX, 1), 1);
outputPointCount = 1;

for i = 1:(size(dataX, 1) - 1)
    s = dataY(i) + ((dataY(i+1) - dataY(i)) / (dataX(i+1) - dataX(i))) * (x - dataX(i));

    for j = 1:size(inputX, 1)
        if (inputX(j) >= dataX(i)) && (inputX(j) < dataX(i+1))
            output(outputPointCount) = subs(s, inputX(j));
            outputPointCount = outputPointCount + 1;
        end
    end
end

end

