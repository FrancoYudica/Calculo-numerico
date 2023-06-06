function parcial4_runge_kutta
  % Parcial 4
  % Bautista Frigolé
  clc; clear;

  K = 1*(10^-3)*[-8 4 0 0 0 0; 4 -8 4 0 0 0; 0 4 -8 4 0 0;
  0 0 4 -8 4 0; 0 0 0 4 -8 4; 0 0 0 0 4 -3];
  td = 2/1000;
  dt = 10;
  t = 0:dt:10000;
  y(:,1) = zeros(6,1);
  w = 1;

  for i=2:length(t)
    b = [4; 0; 0; 0; 0; 0]*cos(td*t(i-1));
    k1 = dt*(K*y(:,i-1)+b);

    tg = t(i-1)+dt/(2*w);
    yg = y(:,i-1)+k1/(2*w);
    bg = [4; 0; 0; 0; 0; 0]*cos(td*tg);
    k2 = dt*(K*yg+bg);

    y(:,i) = y(:,i-1)+(1-w)*k1+w*k2;
  endfor
  hold on

  plot(t,y(2,:),"b"); plot(t,y(6,:),"r");
  legend("y_1","y_5");
  hold off
endfunction
