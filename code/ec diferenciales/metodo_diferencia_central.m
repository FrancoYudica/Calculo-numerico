function metodo_diferencia_central
  
  ti = 0;
  tf = 10;
  dt = 0.1;
  
  t = ti : dt : tf;
  g = 9.8; # Gravity acc magnitude
  L = 1;   # Length of the pendulum
  
  f0 = 0;  # Initial condition f(t0)
  df0 = 2; # Initial condition df(t0)/dt
 
  # 1) Calculates the initial value
  fprev = f0 - dt * df0 + dt * dt * 0.5 * (-g / L * f0);
  
  # The first and second value are already calculated and given
  values = [fprev, f0];
  
  for i = 2 : length(t)   
    previous = values(i - 1);
    current = values(i);
    values(i + 1) = (2.0 - g / L * dt * dt) * current - previous;
    
  endfor
  
  # Values contains n + 1 slots, because we added
  sub_values = values(2 : length(values));
  plot(t, sub_values);
  
endfunction
