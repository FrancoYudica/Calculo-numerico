
function punto_fijo
  
  f = @(x)(x*x - 3);

  start_x = 2;
  tolerance = 0.001;
  c = 0;
  alpha = - 1.0 / 3.0;
  max_iter = 10;
  found = false;
  [root, found] = search_root(f, c, start_x, alpha, tolerance, max_iter)
  
endfunction


function [root, found] = search_root (f, c, start_x, alpha, tolerance, max_iter)
  
  # Returns the root, and a boolean that determines if the root was found
  root = 0;
  found = false;
  x = start_x;
  
  # New function, used in the iterative method
  g = @(x)(x + alpha * (f(x) - c));
  iterations = 0;
  
  while iterations < max_iter
    
    # Calculates the next aproximation of Xs
    x = g(x);
    
    if abs(f(x) - c) < tolerance
      # Once the value is reached
      root = x;
      found = true;
      break     
    endif  
    
    iterations++;
  endwhile
  
endfunction
