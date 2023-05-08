% test2


A = rand(120, 80, 170) ;
B = rand(80, 180, 170) ;
% C = zeros(3, 5, 2) ;


##C_1 = ten_ten_prod(A, B) ;
##C_2 = ttprod_def(A, B) ;

[U, S, V] = tsvd(A) ;
pom1 = ten_ten_prod(U, S) ;
pom2 = ten_ten_prod(pom1, V) ;

