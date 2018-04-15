function [x, z, I, it, tipo] = simplex1(A, b, c, I)
    [~,n] = size(A);

    J = 1:n;
    J(I) = [];

    it = 0;

    while true
        it = it + 1;

        Ai = A(:, I) ^ -1;
        Aj = A(:, J);
        ci = c(:, I);
        cj = c(:, J);

        pi = ci * Ai;
        ccj = pi * Aj - cj;

        z = pi * b;

        x = n:1;
        x(I) = Ai * b;
        x(J) = 0;
        x = x.';

        [t,k] = max(ccj);

        if ccj == 0
            tipo = 1;
            break;
        elseif t <= 0
            tipo = 0;
            break;
        else
            xi =  Ai * b;
            Ak = Ai * A(:, J(k));

            byk = xi./Ak;

            byk(byk <= 0) = inf;
            [t,r] = min(byk);

            if t == inf
                tipo = -1;
                break;
            end

           [J(k), I(r)] = deal(I(r), J(k));
        end
    end
end
