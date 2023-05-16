
function extrapolacion_richardson

  f = @(x)(sin(2.0 * x));

  # Integration interval [a, b]
  a = 0.0;
  b = pi * 0.5;

  # Steps
  h1 = pi * 0.5 / 6.0;
  h2 = pi * 0.5 / 10.0;

  # Vectors that represent the x_data, this will generate n intervals
  x1_data = a : h1 : b;
  x2_data = a : h2 : b;

  # Now generates the y_data with the function f
  y1_data = f(x1_data);
  y2_data = f(x2_data);

  # Calculates the integration
  [integration1] = numeric_integration(y1_data, h1)
  [integration2] = numeric_integration(y2_data, h2)

  [integration3] = richardson_extrapolation(
    integration1,
    integration2,
    h1,
    h2,
    4
  )

	endfunction


function [result] = numeric_integration(y_data, step)

  result = y_data(1);
  n = length(y_data);

  # Suma impares
  for i = 2 : 2 : n - 1
    result += 4 * y_data(i);
  endfor


  # Suma pares
  for i = 3 : 2 : n - 1
    result += 2 * y_data(i);
  endfor


	result += y_data(n);

	result *= step / 3.0;

endfunction

function [result] = richardson_extrapolation(
  integration1,
  integration2,
  step1,
  step2,
  error_power
  )

  # error_power is an integer, the value depends on the
  # integration method used.
  # if the integration method is:
  #   - simpson, error_power = 4
  #   - trapezoid, error_power = 2
  beta = power(step1 / step2, error_power);

  result = (beta * integration2 - integration1) / (beta - 1.0);

endfunction


