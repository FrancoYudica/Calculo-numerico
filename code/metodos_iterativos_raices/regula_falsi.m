

function regula_falsi

  f = @(t)(3 - 7.5 * exp(-2 * t) + 1.5 * exp(-3 * t));
  a = 0;
  b = 1;
  [found, root] = regula_falsi_method(f, a, b);
  found
  root
endfunction


function [found, root] = regula_falsi_method(f, start_a, start_b)

  max_iterations = 10;
  error = 0.01;
  searching = true;
  a = start_a;
  b = start_b;

  for iteration = 0: max_iterations

    m = (f(b) - f(a)) / (b - a);
    r = -f(a) / m + a;
    r
    if abs(f(r)) < error
      root = r;
      found = true;
      break
    endif

    if (f(a) * f(r) < 0)
      b = r;
    else
      a = r;
    endif

endfor
  iteration

endfunction
