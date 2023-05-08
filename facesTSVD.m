function retval = facesTSVD (L, J, k)
  N = size(L, 3);
  M = zeros(size(J));
  A = zeros(size(L));
  C = zeros(k, size(L, 2), N) ;

  min = 1e+14 ;
  
  for i = 1 : size(L, 2)
    M += squeeze(L(:, i, :));
  end
  M /= N;

  for i = 1 : size(L, 2)
    A(:, i, :) = squeeze(L(:, i, :)) - M;
  end

  [U, ~, ~] = tsvd(A);

  U_t = ttrans(U(:, 1:k, :)) ;
  
  C = ten_ten_prod(U_t, A) ;
  
  T(:, 1, :) = J - M ;
  
  B = ten_ten_prod(U_t, T) ;
  
  
  for j = 1 : size(L, 2)
    
    norma = norm(squeeze(B - C(:, j, :)), "fro") ;
    
    if (norma < min)
      min = norma ;
      indeks = j ;
    end
    
  end
  
  retval = squeeze(L(:, indeks, :)) ;
  
end
