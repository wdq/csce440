

% Symmetric, so can use the special case K = max(eigs(A)) / min(eigs(A));
condA = findCondition([2,1;1,3])

% General case
condB = findCondition([2, 1, 0; 0, 3, 0; 1, 0, 4])

% No inverse of this one, so there isn't a condition number. 
% First and last row are dependent on each other, 
% so really 2 equations 3 unknowns (not square matrix)
% Underdetermined system, not enough equations
% Can save a lot of time if you recognize this on miderm.
%condC = findCondition([4, 2, 6; 3, 0, 7; -2, -1, -3])

% General case
condD = findCondition([4, 0, 0, 0; 6, 7, 0, 0; 9, 11, 1, 0; 5, 4, 1, 1])

% If well conditiond can use lower precision calculation (float)
% If ill condtioned need to use a higher precision calculation (double)