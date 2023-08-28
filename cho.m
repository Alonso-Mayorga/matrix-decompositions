% cho: Solves a system of linear equations using the Cholesky decomposition method.
%      The function takes a symmetric positive definite matrix A and a vector b
%      containing the terms of the linear equations Ax = b. It returns the solution vector x.

function sol = cho(A, b)
    % Get the dimensions of matrix A and vector b
    s1 = size(A, 1);
    s2 = size(A, 2);
    b1 = size(b, 1);
    b2 = size(b, 2);
    
    % Check if dimensions are correct and if A is symmetric positive definite
    d = eig(A);
    isposdef = all(d > 0);
    tf = issymmetric(A);
    if s2 ~= s1 || s2 ~= b1 || b2 ~= 1 || isposdef ~= 1 || tf ~= 1
        error('Incorrect dimensions')
    end
    
    % Initialize matrix C for Cholesky decomposition
    c = zeros(s1);
    
    % Perform Cholesky decomposition
    for i = 1:s1
        for j = 1:i
            if i == j
                value = 0;
                for p = 1:j - 1
                    value = value + (c(i, p) * c(i, p));
                end
                c(i, i) = sqrt(A(i, i) - value);
            else
                value = 0;
                for p = 1:j - 1
                    value = value + (c(i, p) * c(j, p));
                end
                c(i, j) = (A(i, j) - value) / c(j, j);
            end
        end
    end
    
    % Calculate transpose of matrix C
    d = transpose(c);
    
    % Solve the lower triangular system using triinf function
    y = triinf(c, b);
    
    % Solve the upper triangular system using trisup function
    sol = trisup(d, y);
end
