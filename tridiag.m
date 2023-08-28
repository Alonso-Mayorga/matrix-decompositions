% tridiag: Solves a system of linear equations where the matrix A is tridiagonal.
%         The function takes a tridiagonal matrix A and a vector b containing
%         the terms of the linear equations Ax = b. It returns the solution vector x.

function sol = tridiag(A, b)
    % Get the dimensions of matrix A and vector b
    s1 = size(A, 1);
    s2 = size(A, 2);
    b1 = size(b, 1);
    b2 = size(b, 2);
    
    % Check if dimensions are correct
    if s2 ~= s1 || s2 ~= b1 || b2 ~= 1
        error('Incorrect dimensions')
    end
    
    % Initialize arrays for m and g
    m = zeros(1, s1);
    g = zeros(1, s1);
    m(1) = A(1, 1);
    
    % Calculate the values of m
    for i = 2:s1
        m(i) = A(i, i) - (A(i - 1, i) * A(i, i - 1) / m(i - 1));
    end
    
    % Calculate the values of g
    g(1) = b(1) / m(1);
    for i = 2:s1
        g(i) = (b(i) - (g(i - 1) * A(i, i - 1))) / m(i);
    end
    
    % Initialize solution vector x
    x(s1) = g(s1);
    
    % Solve the system using backward substitution
    for i = s1 - 1:-1:1
        x(i) = g(i) - (A(i, i + 1) * x(i + 1) / m(i));
    end
    
    % Return the solution vector
    sol = x;
end
