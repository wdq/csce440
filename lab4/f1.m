% Find root of f in [1,2] bisection method.

function f = f(x)
f = x.^3 + 4.*x.^2-10;
end

function p = bisection(f, a, b, tol)

end


p = bisection(@f1, 1, 2, 0.005)

