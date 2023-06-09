function ejercicio2

  f = @(x)(3.8 - 7.6 * exp(-0.5 * x));

  a = 0;
  b = 0.2;

  for i = 1 : 100

    r = a - f(a) * (b - a) / (f(b) - f(a));
    r, f(r)
    if (abs(f(r)) < 0.0142)
      break
    endif
    a = b;
    b = r;

  endfor


endfunction
