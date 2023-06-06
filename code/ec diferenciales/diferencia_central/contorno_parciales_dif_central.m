function contorno_parciales_dif_central


  dx = 0.25;
  xi = 0.0;
  xf = 1.0;
  x = xi : dx : xf;

  # The following code is for the second order equation system -----------------

  # K is the following matrix multiplied by the constant 12/dx^2
  # K is the matrix that multiplies the non derivative vector U
  K = [+2.0, -1.0, 0.0
       -1.0, 2.0, -1.0
       +0.0, -1.0, 2.0
       ];

  K *= 12.0 / (dx * dx);

  # Fills the matrix that multiplies the second derivative vector d^2U/dt^2
  M = zeros(3, 3);
  for i = 1 : 3
    M(i, i) = power(x(i + 1), 2.0);
  endfor

  inv_M = inverse(M);

  # Applies central difference method ------------------------------------------
  dt = 0.001;
  ti = 0.0;
  tf = 2.0;
  t = ti : dt : tf;

  # These are contour data
  u_t0 = @(x)(sin(pi * x)); # U function in t = 0
  du2_t0 = @(x)(3.0);       # Second derivative of U in t = 0

  f0 =  [  u_t0(x(2));   u_t0(x(3));   u_t0(x(4))];
  df0 = [du2_t0(x(2)); du2_t0(x(3)); du2_t0(x(4))];

  # 1) Calculates the initial value
  second_derv = -inv_M * K * f0;
  fprev = f0 - dt * df0 + dt * dt * 0.5 * second_derv;

  # The first and second value are already calculated and given
  values = [fprev, f0];

  for i = 2 : length(t)

    previous = values(:, i - 1);
    current = values(:, i);

    # This calculation is different, because we are only using M and K matrix.
    # therefore the calculation is simplified
    values(:, i + 1) = inv_M * (2.0 * M - dt * dt * K) * current - previous;
  endfor

  sub_values = values(:, 2 : length(values));
  plot(t, sub_values);

endfunction
