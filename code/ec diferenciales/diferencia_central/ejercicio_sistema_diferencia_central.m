# Resolution of the exercise given in theory slides

function ejercicio_sistema_diferencia_central

  # EXERCISE DATA --------------------------------------------------------------
  M = [1, 0, 0; 0, -1, 0; 0, 0, 2];
  C = [4, 0, 0; 0, -1, 0; 0, 0, 3];
  K = [0, 4, 1; 4, 2, 0; 1, 0, 1];
  R = {
    @(t)(5.0 * exp(t) + 8.0 * exp(2.0 * t) + cos(t)),
    @(t)(-8.0 * exp(2.0 * t) + 4.0 * exp(t)),
    @(t)(-1.0 * cos(t) - 3.0 * sin(t) + exp(t))
  };
  eval_r(R, 0)
  ti = 0.0;
  tf = 3.0;
  dt = 0.01;

  t = ti : dt : tf;

  y0 = [1; 2; 1];
  dy0 = [1; 4; 0];

  # CENTRAL DIFFERENCE ALGORITHM -----------------------------------------------
  # Calculates previous
  start_prev_y = y0 - dt * dy0 + dt * dt * 0.5 * inverse(M) * (eval_r(R, ti) - C * dy0 - K * y0)

  # Calculates usefull matrices
  G = inverse(M + dt * 0.5 * C);
  A = G * (dt * 0.5 * C - M);
  C = G * (2.0 * M - dt * dt * K);

  y = [start_prev_y , y0];

  for i = 2 : length(t)

    b = dt * dt * G * eval_r(R, t(i));
    y(:, i + 1) = b + A * y(:, i - 1) + C * y(:, i);

  endfor

  # Plot contains one extra value, start_prev_y, so skips it and shows the rest
  plot(t, y(:, 2 : length(y)))

endfunction


function [values] = eval_r(R, t)

  # Builds column vector
  values = [];

  for i = 1 : length(R)
    values(i, 1) = R{i}(t);
  endfor


endfunction
