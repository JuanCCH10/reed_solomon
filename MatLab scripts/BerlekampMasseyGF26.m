%% Función de evaluación del algoritmo Berlekamp-Massey GF(2^6)
% Entradas: 2t,S_i
% Salida: A[x]
function Ax = BerlekampMasseyGF26(t2,S)
    Ax = -1*ones(1,t2); %vector
    Bx = -1*ones(1,t2); %vector
    tx = -1*ones(1,t2); %vector
    L = 0;
    Ax(1) = 0;
    Bx(1) = 0;
    j = 1;
    dm = 0; %potencia de alpha
    K = 1;
    
    while K <= t2
%         L
%         K
%         j
        d = calc_dGF26(L,K,S,Ax);
        if d == -1
%             disp("etapa1")
            j = j + 1;
        else
            if 2*L >= K
%                 disp("etapa2")
                Ax = Ax_evaluatorGF26(t2, d, dm, j, Bx, Ax);
                j = j + 1;
            else
%                 disp("etapa3")
                tx = Ax;
                Ax = Ax_evaluatorGF26(t2, d, dm, j, Bx, Ax);
                dm = d;
                L = K - L;
                Bx = tx;
                j = 1;
            end
        end
%         disp("---------------------------------------------")
        K = K + 1;
    end
end