
function jacobi_improvisado

  A = [10, -5, 0, 0;
      -5, 20, -5, 0;
      0, -5, 20, -5,
      0, 0, -5, 10
  ]
  b = [-10, 20, 20, -10]
  [result] = jacobi_method(A, b);
  result

  A * result


endfunction


function [result] = jacobi_method(A, b)

  n = columns(A);
  x = zeros(n, 1);
  new_x = zeros(n, 1);
  max_iterations = 100;
  err = 0.04;
  for iteration = 0: max_iterations

    # Calculates all the components of the vector
    for i = 1 : n
      add = 0;
      for j = 1: n
        if j != i
            add += x(j) *  A(i, j);
        endif
      endfor

      new_x(i) = (b(i) - add) / A(i, i);
    endfor


    dx = new_x - x;
    iteration
    new_x
    dx
    cr = infinite_norm(dx) / infinite_norm(new_x)
    if cr < err
      break
    endif
    x = new_x;
  endfor
  iteration
  result = new_x;




endfunction



function [n] = infinite_norm(x)

  n = max(abs(x));

endfunction
