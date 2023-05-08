% test2


A = rand(5, 4, 3)*100 ;
B = rand(4, 5, 3) ;
% C = zeros(3, 5, 2) ;


##C_1 = ten_ten_prod(A, B) ;
##C_2 = ttprod_def(A, B) ;

[U, S, V] = tsvd(A) ;
pom1 = ten_ten_prod(U, S) ;
pom2 = ten_ten_prod(pom1, V) ;

ttrans(A)
