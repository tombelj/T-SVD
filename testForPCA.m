% test3
close all ;
clear;


dim = 64 ;

if(dim == 64)
  a = load('Yale_64x64.mat') ;
else
  a = load('YaleB_32x32.mat') ;
end

A = a.fea ;
b = a.gnd ;

if(dim == 64)
  j = 12 ;
  dim2 = 164 ;
else
  j = 400 ;
  dim2 = 2413 ;
end

for j = 2 : 22 : dim2
  tic
  T = zeros(dim, dim2, dim) ;
  for i = 1 : dim2+1
          if(i ~= j)

            T(:, i, :) = reshape(A(i, :), dim, dim) ;

          end

  end

  J = reshape(A(j, :), dim, dim) ;

  figure,
  imagesc(J);
  colormap(gray);

  retval = facesPCA(T, J, 16) ;

  figure,
  imagesc(retval);
  colormap(gray);
  toc

end


