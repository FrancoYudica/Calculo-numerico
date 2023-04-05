
function metodo_potencia
  #power_method_program();
  inverse_power_method_program();
  
endfunction

function power_method_program()
  
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


function inverse_power_method_program()
  
  # Power method, used for finding eigenvectors and it's eigenvalues
  A = [-10, 4
       -4, 0];
  y = [2; 2]; 
  
  inverse_A = inverse(A);
  
  
  [eigenvector, eigenvalue] = power_method(inverse_A, y);
  
  # The eigenvectors for A and the inverse A are shared, but the eigenvalues
  # are not, the eigenvalues of the same eigenvector of A are the reciprocal of the
  # eigenvalues of the inverse A
  
  # The eigenvector is shared
  # The eigenvalue of A is the reciprocal
  
  min_eigenvalue_A = 1.0 / eigenvalue
  
  # Prints the results of the algorithm
  eigenvector
  eigenvalue
  
  disp("Test results for inverse_A");
  error_test = inverse_A * eigenvector - eigenvalue * eigenvector
  
  disp("Test min eigenvalue of A");
  error_test = A * eigenvector - min_eigenvalue_A * eigenvector
  
  
  
endfunction

function [eigenvector, eigenvalue] = power_method(A, start_y)
  
  # The method has the recursive rule A * y = new_y.
  # it's using the "escalonado" approach 
  # new_y and y. If new_y and y have the same direction
  # Note that the y value is the aproximation of the eigenvector
  max_iterations = 100;
  tolerance = 0.001;
  
  n = columns(A);  
  y = start_y;
  
  for iterations=0 : max_iterations
    # Recursive rule
    new_y = A * y;
    
    aprox_lambda = dot(new_y, new_y) / dot(new_y, y)
    
    # Stop control
    if abs(A * new_y - aprox_lambda * new_y) < tolerance
      break
    endif
    
    # Normalizes, preventing overflow
    # Note that we can normalize because we only care about the direction of the eigenvector
    y = new_y / infinite_norm(new_y);
           
  endfor
  
  # Displays the iterations and sets the return values
  iterations
  eigenvector = y;
  eigenvalue = aprox_lambda;
  
endfunction

function [norm] = infinite_norm(x)
  norm = max(abs(x));
endfunction