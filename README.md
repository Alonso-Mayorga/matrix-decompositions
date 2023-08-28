# Linear Equation Solvers

This repository contains MATLAB functions that solve systems of linear equations using different methods.

## cho Function

The `cho` function performs Cholesky decomposition to solve a system of linear equations. Given a symmetric positive definite matrix `A` and a vector `b`, the function calculates the lower triangular matrix `L` and the upper triangular matrix `U` of the decomposition. It then solves the system `Ax = b` using these decomposed matrices.

## egauss Function

The `egauss` function implements Gaussian elimination to solve a system of linear equations. It takes a matrix `A` and a vector `b`, performs Gaussian elimination, and returns the solution vector `x`.

## LU Function

The `LU` function combines LU decomposition with forward and backward substitution to solve a system of linear equations. Given a matrix `A` and a vector `b`, the function decomposes `A` into lower triangular matrix `L` and upper triangular matrix `U`. It then uses these matrices to solve the system `Ax = b`.

## trisup Function

The `trisup` function performs back substitution to solve an upper triangular system of linear equations. Given an upper triangular matrix `A` and a vector `b`, the function returns the solution vector `x`.

## triinf Function

The `triinf` function performs forward substitution to solve a lower triangular system of linear equations. Given a lower triangular matrix `A` and a vector `b`, the function returns the solution vector `x`.

## tridiag Function

The `tridiag` function solves a tridiagonal system of linear equations using specialized algorithms. Given a tridiagonal matrix `A` and a vector `b`, the function returns the solution vector `x`.

## Usage

To use these functions, include them in your MATLAB environment and follow the examples provided in the code comments or in the README of the repository.

## Contributing

Feel free to contribute to this repository by suggesting improvements, reporting issues, or adding new methods for solving linear equations.

## License

This project is licensed under the [MIT License](license.txt).
