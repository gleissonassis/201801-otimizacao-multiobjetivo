function [x, z, I, it, tipo] = simplex2(A, b, c)
    [m,n] = size(A);
    I = 1:n+m;
    ct = zeros(1, n+m);

    I(1:n) = [];
    ct(I) = 1;

    B = horzcat(A, eye(m));

    [x, z_f1, I_f1, it_f1, ~] = simplex1(B, b, ct, I);

    if z_f1 == 0
        [x, z, I, it_f2, tipo] = simplex1(A, b, c, I_f1);

        it = it_f2 + it_f1;
    end
end
