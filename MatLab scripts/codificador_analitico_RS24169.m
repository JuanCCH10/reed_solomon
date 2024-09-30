clc; clear all; close all;
%% Códificación de datos para RS(24,16,9)
display('Codificador RS(24,16,9)')
n = 24;
k = 16;
%Los símbolos son conjuntos de datos de lóngitud 6 bits (hexabits), es decir
%que para el caso de este RS los 16 símbolos corresponde a un total de 96
%bits.
%El procedimiento analítico parte de la previa agrupación de los datos, y
%solo resulta de interés el orden correspondiente a la notación polinomial
%     x0                                  x15
mx = [11 -1 1 62 -1 10 16 0 43 45 62 60 48 28 47 44]
% mx = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16] %VERIFICADO
% mx = [46 22 22 22 22 22 22 22 22 22 22 22 22 22 22 62] %VERIFICADO

%% X^(n-k)m(x)
xnkmx = -1*ones(1,n);
xnkmx(1:k) = mx;
xnkmx = circshift(xnkmx,n-k); %VERIFICADO

%% Polinomio generador
%El elemento de mayor grado del polinomio cuenta con un coeficiente 1, los
%operadores que tienen efecto sobre el polinomio generador es únicamente el
%de producto.
%      x0                     x8
gES = [36 7 14 40 10 31 59 43 0];  %VERIFICADO

%% División

%         ____cociente____
% divisor |  dividendo
%               .
%               .
%               .
%           residuo

%Proceso de división
% - Se busca un valor, el cual, al ser multiplicado por el elemento de
% mayor orden en gES de como resultado el valor de mayor orden en 
% X^(n-k)m(x). La "búsqueda" del valor previamente descrito, no es más
% que el coeficiente corresponediente al elemento de mayor orden en
% X^(n-k)m(x).
% - El valor anteriormente especificado es multiplicado por cada elemento
% en gES, dando como resultado un polinomio el cual debe sumarse elemento 
% a elemento con el polinomio X^(n-k)m(x).
% - El proceso de suma elemento a elemento entrega como resultado la
% reducción de elementos en el polinomio X^(n-k)m(x).

cociente = -1*ones(1,n);
residuo = -1*ones(1,n);
orden_gES = numel(gES);
orden_xnkmx = n-1;
dividendo = xnkmx;

flag = 1;
cont = 1;

while(flag)
    % Busqueda del elemento de mayor orden en X^(n-k)m(x)
    % Obtención de su coeficiente y el orden del elemento de mayor orden
    for i_aux = n:-1:1
        if dividendo(i_aux) ~= -1
            coef_cociente = dividendo(i_aux);
            orden_cociente = i_aux;    
            break;
        end
    end
    
    cociente( (i_aux-orden_gES)+1 ) = coef_cociente; %solo almacena el cociente
    
    divisor = -1*ones(1,n);
    divisor(1:orden_gES) = gES;
    divisor = circshift(divisor,i_aux-orden_gES);
    for i_aux = 1:n
        [bits,divisor(i_aux)] = mult_pot_GF26(divisor(i_aux),coef_cociente,0);
    end
    
    for i_aux = 1:n
        [bits,residuo(i_aux)] = sum_pot_GF26(dividendo(i_aux),divisor(i_aux));
    end
    
    division(1,:) = dividendo;
    division(2,:) = cociente;
    division(3,:) = divisor;
    division(4,:) = residuo;
    
    division_log{cont} = division;
    cont = cont + 1;
    clear division
    
    if orden_cociente == orden_gES
        flag = 0;
    else
        dividendo = residuo;
    end
end

cx = [residuo(1:n-k) mx]
for i_aux = 1:numel(mx)
    mx_oct(i_aux) = dec2oct(mx(i_aux));
end
mx_oct
for i_aux = 1:numel(cx)
    cx_oct(i_aux) = dec2oct(cx(i_aux));
end
cx_oct