function [betas, Et] = ChienGF26(A_x,t2)
    t = t2/2;   
    k = 1;
    beta = -1*ones(1,t);
    Et = 0;
    
    while k <= t
        for i_alpha = 1:2^6-1
%             i_alpha
            for i_x = 1:numel(A_x)
                if i_x == 1
                    sum_bin = A_x(1);
                else
                    if A_x(i_x) ~= -1
                        pot_aux = i_alpha*(i_x-1);
                        [ ~ , pot_aux ] = mult_pot_GF26( A_x(i_x),pot_aux,0 );
                        [ ~ , sum_bin ] = sum_pot_GF26( sum_bin,pot_aux );
                    end
                end
            end
%             sum_bin
%             display("-------------------------------------------------------")
            if sum_bin == -1
                Et = Et + 1;
%                 i_alpha
                beta(k) = ((2^6)-1)-i_alpha;
                k = k + 1;
            end
        end
        k = t+1;
    end
    betas = beta(1:Et);
end