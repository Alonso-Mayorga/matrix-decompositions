% egauss: Performs Gaussian elimination to solve a system of linear equations.
%         The function takes a matrix A and a vector b, performs Gaussian elimination,
%         and returns the solution vector g.

function g = egauss(A, b)
    % Get the dimensions of matrix A and vector b
    s1 = size(A, 1);
    s2 = size(A, 2);
    b1 = size(b, 1);
    b2 = size(b, 2);
    
    % Check if dimensions are correct
    if s2 ~= s1 || s2 ~= b1 || b2 ~= 1 
        error('Incorrect dimensions')
    end
    
    C = [A b];
    
    % Perform Gaussian elimination
    for t = 1:s1 - 1
        for j = s1 + 1:-1:1
            C(t, j) = C(t, j) / C(t, t);
        end

        for i = t + 1:s1
            for j = s1 + 1:-1:t
                C(i, j) = C(i, j) - (C(i, t) * C(t, j));
            end
        end
    end
    
    % Extract matrices AA and bb
    AA = zeros(s1, s1);
    bb = zeros(s1, 1);
    for i = 1:s1
        for j = 1:s1
            AA(i, j) = C(i, j);
        end
        bb(i, 1) = C(i, s1 + 1);
    end
    
    % Solve the system using trisup function
    g = trisup(AA, bb);
end