function T = ttrans(U)
  
  T = zeros(size(U, 2), size(U, 1), size(U, 3)) ;
  T(:, :, 1) = U(:, :, 1)' ;
  n = size(U, 3) ;
  for i = n : 2
    T(:, :, n-i+2) = U(:, :, i)' ;
  end
  
end
