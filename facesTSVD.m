function retval = facesTSVD (L, J, k)
  N = size(L, 3);
  M = zeros(size(J));
  A = zeros(size(L));
  C = zeros(

  for i = 1 : N
    M += L(:, i, :);
  end
  M /= N;

  for i = 1 : N
    A(:, i, :) = L(:, i, :) - M;
  end

  [U, ~, ~] = tsvd(A);

end
