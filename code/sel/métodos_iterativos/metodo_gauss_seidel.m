function metodo_gauss_seidel
  # The only difference between Jacobi and gauss_seidel is that
  # in the first loop, we use new_x instead of x
  A =  [-3, 1, -2
        4, -5, 0
        1, -3, 6];

  b = [-2; 5; 6];
  [x, found] = gauss_seidel(A, b);
  x
  disp(A * x);

endfunction


function [x, found] = gauss_seidel(A, b)
  # Assumes that the matrix is diagonal dominant
  # A is the coeffiecient matrix
  # b the result vector

  # n is the order of the system
  n = rows(b);

  x = zeros(n, 1);

  found = false;
  iterations = 0;
  max_iter = 1000;
  tolerance = 0.0001;

  new_x = zeros(n, 1);
  for iterations=0 : max_iter

    # For all of the values of the vector X
    for i=1 : n
      # Calculates the value of new_x(i)

      # knowing that x(i) is 0, i avoid this multiplication
      # by creating two loops in [1, i-1] [i+1, n]
      # Accumulated sum of multiplications
      acc = 0;

      # loop in [1, i-1]
      # This loop is equivalent to the lower triangular matrix,
      # thats why we can use the new_x. This is the only difference between
      # the original jabobi method and gauss_seidel
  
      for j=1 : i-1
          acc += A(i, j) * new_x(j);
      endfor

      # loop in [i+1, n]
      for j=i+1 : n
        acc += A(i, j) * x(j);
      endfor

      # calculates the new value
      new_x(i) = (b(i) - acc) / A(i, i);
    endfor

    # Calculaes the infinit norm of the diff vector, that is the error
    if infinite_norm(new_x - x) < tolerance
      found = true;
      iterations
      return
    endif

    # Updates
    x = new_x;

  endfor

endfunction

function [n] = infinite_norm(x)
  n = max(abs(x));
endfunction