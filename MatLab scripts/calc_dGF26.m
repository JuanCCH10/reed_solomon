function d_pot = calc_dGF26(L,K,S_pot,A_x)
    if L == 0
        aux_sum = S_pot(K);
    else
        aux_sum = S_pot(K);
        for i_aux = 1:L
%             i_aux
%             sel_s = K-i_aux
%             alphaGF26(S_pot(K-i_aux))
            [vector_mult,aux_mult] = mult_pot_GF26( A_x(i_aux + 1),S_pot(K-i_aux),0 );
%             vector_mult
%             sel_a = i_aux+1
            [vector_sum,aux_sum] = sum_pot_GF26( aux_sum,aux_mult );
%             vector_sum
%             aux_mult
%             aux_sum
        end
    end
    d_pot = aux_sum;
end