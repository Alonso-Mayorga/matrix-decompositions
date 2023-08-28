% LU: Performs LU decomposition and solves a system of linear equations using
%     the LU decomposition method. The function takes a matrix A and a vector b,
%     performs LU decomposition on A, and then solves Ax = b using the decomposed matrices.
%     It returns the lower triangular matrix L, upper triangular matrix U, and the solution vector g.

function [L, U, g] = LU(A, b)
    % Get the dimensions of matrix A and vector b
    s1 = size(A, 1);
    s2 = size(A, 2);
    b1 = size(b, 1);
    b2 = size(b, 2);
    
    % Check if dimensions are correct
    if s2 ~= s1 || s2 ~= b1 || b2 ~= 1 
        error('Incorrect dimensions')
    end
    
    L = eye(s1);
    U = A;
    
    % Perform LU decomposition
    for t = 1:s1 - 1
        for i = t + 1:s1
            L(i, t) = L(i, t) + (U(i, t) / U(t, t));
            for j = s1:-1:t
                U(i, j) = U(i, j) - (U(i, t) * U(t, j) / U(t, t));
            end
        end
    end
    
    % Solve the lower triangular system using triinf function
    h = triinf(L, b);
    
    % Solve the upper triangular system using trisup function
    g = trisup(U, h);
end

