% test1


A = zeros(3, 4, 2) ;
B = zeros(4, 5, 2) ;
% C = zeros(3, 5, 2) ;

A(:, :, 1) = [ 101, 102, 103, 104 ;
               105, 106, 107, 108 ;
               109, 110, 111, 112 ] ;
A(:, :, 2) = A(:, :, 1) + 10 ;

B(:, :, 1) = [ 201, 202, 203, 204, 205;
               206, 207, 208, 209, 210;
               211, 212, 213, 214, 215;
               216, 217, 218, 219, 220 ] ;
B(:, :, 2) = B(:, :, 1) + 10 ;

C_1 = ten_ten_prod(A, B) ;
C_2 = ttprod_def(A, B) ;

[U, S, V] = tsvd(A) ;
pom1 = ten_ten_prod(U, S) ;
pom2 = ten_ten_prod(pom1, V) ;

