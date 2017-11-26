function [ K ] = findCondition( A )
    a = sqrt(max(eigs(A'*A)));
    A1 = inv(A);
    b = sqrt(max(eigs(A1'*A1)));
    K = a * b;
end