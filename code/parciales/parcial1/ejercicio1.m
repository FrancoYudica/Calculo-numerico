function ejercicio1

  # Implements Gauss-Seidel

  A =  [38.0, -9.5, 0, 0
        -9.5, 47.5, -19.0, 0
        0.0, -19.0, 47.5, -9.5
        0.0, 0.0, -9.5, 38.0
        ];

  b = [38; 47.5; 47.5; 38.0];

  max_iterations = 100;
  n = 4;
  x = zeros(n, 1);
  x = [2; 2; 2; 2];
  new_x = x;

  for iteration = 1 : max_iterations

    for i = 1 : n
      # For every column

      # Calculates new_x(j)
      acc = 0;
      for j = 1 : i - 1
        acc += A(i, j) * x(j);
      endfor

      for j = i + 1 : n
        acc += A(i, j) * x(j);
      endfor

      new_x(i) = (b(i) - acc) / A(i, i);

    endfor

    if infinite_norm(new_x - x) < 0.0001
      x = new_x
      break
    endif

    x = new_x;

endfor
  iteration
  A\b

endfunction


function [n] = infinite_norm(x)

  n = max(abs(x));

endfunction
