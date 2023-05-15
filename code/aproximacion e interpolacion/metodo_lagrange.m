
function metodo_lagrange

  x_data = [0; 1; 2];
  y_data = [0; 2; 0];

  # Gets Pn(x)
  [interpolated] = lagrange_interpolation(x_data, y_data);


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



function [interpolated] = lagrange_interpolation(x_data, y_data)

  n = length(y_data);

  # Creates the interpolation function using y_data and polys
  interpolated = @(x)(0);
  for i = 1 : n

    # The coefficient is the same as Yi
    coeff = y_data(i);

    # Gets the lagrange poly
    lagrange_poly = get_lagrange_poly(i, x_data);
    interpolated = @(x)(interpolated(x) + coeff * lagrange_poly(x));
  endfor

endfunction

function [lagrange] = get_lagrange_poly(index, x_data)

  # index ranges from 1 to n
  # x_data are the x points of the discrete data

  lagrange = @(x)(1);

  for i = 1 : length(x_data)

    if (i == index)
        continue;
    endif

    lagrange = @(x)(lagrange(x) * (x - x_data(i)) / (x_data(index) - x_data(i)));

  endfor

endfunction
