
function contorno1


  dx = 2.5;
  M = [-2, 1, 0, 0
       1, -2, 1, 0
       0, 1, -2, 1
       0, dx / 200.0, -dx/200.0, dx / 200.0 * 3.0]


  B = [5, 0, 0, 0
       0, 5, 0, 0
       0, 0, 5, 0
       0, 0, 0, 0];

  b = [-70; 10; 10; 15]

  k = 100.0 / (dx * dx);

  A = k * M + B

  #A(4, :) = [0, 4, -16, 12]

  u(1) = 5;

  u(2 : 5) = A \ b

  x = 35.0 : dx : 45.0;
  plot(x, u);

endfunction
