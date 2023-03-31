
function metodo_potencia
  
  # Power method, used for finding eigenvectors and it's eigenvalues
  A = [-10, 4
       -4, 0];
  y = [2; 2]; 
  [eigenvector, eigenvalue] = power_method(A, y);
  
  # Prints the results of the algorithm
  eigenvector
  eigenvalue
  
  # Check if A * eigenvector = eigenvalue * eigenvector
  A * eigenvector
  eigenvalue * eigenvector
  
endfunction


function [eigenvector, eigenvalue] = power_method(A, y)
  
  # The method has the recursive rule A * y = new_y. Note that it's important
  # to always normalize the new_y vector, otherwise an overflow error could
  # happen. Alpha is the vector that contains the per-component division of
  # new_y and y. If new_y and y have the same direction, the values of alpha
  # should be almost the same, that's the reason why the detention control is 
  # implemented that way.
  # Note that the y value is the aproximation of the eigenvector
  # Note that the alpha components are the eigenvalue
  
  n = columns(A);
  max_iterations = 100;
  new_y = zeros(n, 1);
  alpha = zeros(n, 1);
  tolerance = 0.1;
  
  for iterations=0 : max_iterations
    # Recursive rule
    new_y = A * y;
    
    # Calculates the alpha
    alpha = component_div(new_y, y);
    
    # Normalizes, preventing overflow
    # Note that we can normalize because we only care about the direction of the eigenvector
    y = new_y / infinite_norm(new_y);
    
    # Quit test
    if (abs(alpha(1) - alpha(2)) < tolerance)
      break
    endif
    
    
  endfor
  
  # Displays the iterations and sets the return values
  iterations
  eigenvector = y;
  eigenvalue = alpha(1);
  
endfunction

function [norm] = infinite_norm(x)
  norm = max(abs(x));
endfunction

function [out] = component_div(x, y)
 # Similar to dot product, but with division
 # Assumes that the vectors are in the same dimension
 out = x; 
 for i=1 : rows(x)
   out(i) = out(i) / y(i);
 endfor
endfunction
