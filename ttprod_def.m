function C = ttprod_def(A, B)


    l = size(A, 1) ;
    m = size(B, 2) ;
    n = size(A, 3);
    C = fold((bcirc(A) * unfold(B, 2)')', 2, [l, m, n]) ;


end
