%Practica de laboratorio: Prolog
%Diego Matamoros 11641131

%UnirO(L1,L2,L3) donde L1 y L2 son listas ordenadas, y L3 es una lista
%ordenada que  es la concatenacion de las dos listas 
%Por ejemplo
%unirO([1,3,5,13],[1,2,4,7,14],L)
%L = [1, 1, 2, 3, 4, 5, 7, 13, 14]

%Por si los necesita
%  menor o igual :   =<
%  mayor o igual     >=

unirO([],L,L).
unirO(L,[],L).
unirO([X|Y],[H|T],L3):-
    X=<H
    ,unirO(Y, [H|T], L4),
    L3=[X|L4],!.
unirO([X|Y],[H|T],L3):- 
    unirO([X|Y],T,L4),
    L3=[H|L4].

%dividirL(L1,N,L2,L3) divide la lista l1 en dos listas L1 y L3.
%L2 tiene un tama�o N y L3 tiene el resto de los elementos de L1 si 
%N es menor que el tama�o de L1
%Si el tama�o de L1 es menor o igual a N entonces L2 es igual L1.
%Por ejemplo
%dividir([1,3,5,13,3,3,3,3,34],5,L1,L2)
%L1 = [1, 3, 5, 13],
%L2 = [3, 3, 3, 3, 34]


dividir(L1,0,[],L1).
dividir([C|T],N,F,B):-N>=0,
    !,
    N2 is N -1,
    dividir(T,N2,F1,B),
    F= [C|F1].

