
function metodo_newton

  x_data = [0; 1; 2];
  y_data = [0; 2; 0];

  newton = get_newton_poly(3, x_data)
  newton(1.4)

  # Gets Pn(x)
  [interpolated] = newton_interpolation(x_data, y_data);


  # Tests if the interpolation error at x_data is 0
  success = true;
  for i = 1 : rows(y_data)
    if interpolated(x_data(i)) != y_data(i)
      success = false;
      break
    endif
  endfor

  success

endfunction


function [interpolated] = newton_interpolation(x_data, y_data)

  n = length(y_data);

  # 1) Calculates the matrix, with newton poly
  q = zeros(n, n);

  for column = 1 : n

    newton_poly = get_newton_poly(column, x_data);

    for row = 1 : n
      q(row, column) = newton_poly(x_data(row));
    endfor

  endfor

  # 2) Solves SEL
  coeffs = q \ y_data

  # 3) Creates the interpolation function using y_data and polys
  interpolated = @(x)(0);
  for i = 1 : n

    # The coefficient is the same as Yi
    coeff = coeffs(i);

    # Gets the lagrange poly
    newton_poly = get_newton_poly(i, x_data);
    interpolated = @(x)(interpolated(x) + coeff * newton_poly(x));
  endfor

endfunction

function [newton] = get_newton_poly(index, x_data)

  # index ranges from 1 to n
  # x_data are the x points of the discrete data

  newton = @(x)(1);

  for i = 2 : index

    newton = @(x)(newton(x) * (x - x_data(i - 1)));

  endfor

endfunction
