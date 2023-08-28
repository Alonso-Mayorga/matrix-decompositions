% triinf: Solves a system of linear equations where the matrix A is lower triangular.
%        The function takes a lower triangular matrix A and a vector b containing
%        the terms of the linear equations Ax = b. It returns the solution vector x.

function sol = triinf(A, b)
    % Get the dimensions of matrix A and vector b
    s1 = size(A, 1);
    s2 = size(A, 2);
    b1 = size(b, 1);
    b2 = size(b, 2);
    
    % Check if dimensions are correct
    if s2 ~= s1 || s2 ~= b1 || b2 ~= 1 
        error('Incorrect dimensions')
    end
    
    % Check if matrix A is lower triangular
    for i = 1:(s1-1)
        for j = (i+1):s1
            if A(i, j) ~= 0
                error('Matrix is not lower triangular')
            end
        end
    end
    
    % Initialize solution vector
    a = zeros(b1, 1);
    
    % Solve the system using back substitution
    for i = 1:b1
        for j = 1:(i-1)
            a(i) = a(i) - (a(j) * A(i, j));
        end
        a(i) = (a(i) + b(i)) / A(i, i);
    end
    
    % Return the solution vector
    sol = a;
end
