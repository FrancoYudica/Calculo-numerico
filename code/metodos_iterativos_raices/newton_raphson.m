
function newton_raphson

  #f = @(t)(30 - 75 * exp(-2 * t) + 15 * exp(-3 * t));
  #df = @(t)(150 * exp(-2 * t) - 45 * exp(-3 * t));
  f = @(t)(3 - 7.5 * exp(-2 * t) + 1.5 * exp(-3 * t));
  df = @(t)(15 * exp(-2 * t) - 4.5 * exp(-3 * t));
  a = 0;

  [found, root] = newton_raphson_method(f, df, a);
  found
  root
  f(root)
endfunction


function [found, root] = newton_raphson_method(f, df, start_a)

  max_iterations = 10;
  error = 10^-6;
  searching = true;
  a = start_a;
  for iteration = 0: max_iterations

    m =  df(a);
    r = -f(a) / m + a;

    if abs(f(r)) < error
      root = r;
      found = true;
      break
    endif

    a = r;

endfor
  iteration

endfunction
