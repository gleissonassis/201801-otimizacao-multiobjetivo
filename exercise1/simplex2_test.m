%test problem
%https://paginas.fe.up.pt/~mac/ensino/docs/MD20082009/MIEA_MD_TPC3TiagoPinto.pdf

c = [2 -10 1 4 0 0 0];

A = [ 3 6 0 3 1 0 0
      4 0 0 10 0 -1 0
      -3 1 6 0 0 0 -1];

b = [100
     50
     30];

[x, z, Ir, it, tipo] = simplex2(A, b, c)
