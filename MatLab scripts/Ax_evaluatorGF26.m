%% Función de evaluación A[x] GF(2^6) = A[x] + [d * dm^-1 * B[x]]
% Entradas : d, dm, j, B[x]
% Salida : [d * dm^-1 * B(x)]
function Ax = Ax_evaluatorGF26(t2, d, dm, j, Bx, Ax)
    [~,d_aux] = mult_pot_GF26(d,-1*dm,1);
    ddm_1Bx = -1 * ones(1,t2+1);
    aux_Ax = zeros(1,t2);
    for bx_i = 1:t2
        [vec_d_auxBx,aux_prod] = mult_pot_GF26(d_aux,Bx(bx_i),0); % Ocurren multiplicaciónes con una potencia -1, la cual debe omitirse
%         vec_d_auxBx
        ddm_1Bx( bx_i+j ) = aux_prod;
        [vec_Ax_ddm1Bx,aux_Ax( bx_i )] = sum_pot_GF26( Ax(bx_i),ddm_1Bx(bx_i) );
%         vec_Ax_ddm1Bx
    end
    Ax = aux_Ax(1:t2);
end