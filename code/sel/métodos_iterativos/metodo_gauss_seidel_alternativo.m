function metodo_gauss_seidel_alternativo
  # The only difference between Jacobi and gauss_seidel is that
  # in the first loop, we use new_x instead of x
  A =  [-3, 1, -2
        4, -5, 0
        1, -3, 6];

  b = [-2; 5; 6];
  [x, found] = gauss_seidel_alternativo(A, b);
  x
  disp(A * x);

endfunction

  



function [T, c] = get_data(A, b)
  
  n = rows(b);
   
  # Calculates T matrix
  T = zeros(n, n);
  for i=1 : n
    
    # Inferior side
    for j=1 : i -1
      T(i, j) = -A(i, j) / A(i, i);
    endfor    
    
    # Diagonal full of zeros
    
    # Superior side
    for j=i+1 : n
      T(i, j) = -A(i, j) / A(i, i);
    endfor  
    
  endfor
  
  # Calculates the C vector
  c = b;
  for i = 1: n
    c(i) /= A(i, i);
    
  endfor
 
  
endfunction


function [x, found] = gauss_seidel_alternativo(A, b)
  # Assumes that the matrix is diagonal dominant
  # A is the coeffiecient matrix
  # b the result vector

  # n is the order of the system
  n = rows(b);
  
  # Gets the triangula inferior and superior matrix, and c vector
  [T, c] = get_data(A, b);
  
  # initializes the vectors with zeros
  x = zeros(n, 1);
  new_x = zeros(n, 1);
  
  found = false;
  iterations = 0;
  max_iter = 1000;
  tolerance = 0.0001;
  
  for iterations=0 : max_iter

    # For all of the values of the vector X
    for i=1 : n     
      new_x(i) = T(i, :) * new_x + c(i);
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