sumarL([],0).
sumarL([X|Y],Z):-sumarL(Y,U), Z is X+U.
%El predicado contar(L,R) cuenta los elementos de la lista L y lo almacena en R
contarL([],0).
contarL([_|Y],C):-contarL(Y,U), C is U+1.
%El predicado map(C,X,Y)la lista y se compone de cada elemento de la lista X mas
%(3,[2,4,6],[5,7,9])
map(_,[],[]).
map(C,[X|Y],[U|V]):-map(C,Y,V),U is X+C.
%tarea hacer promedio(L,P) es el promedio de la lista L.
promedio(L,P):-sumarL(L,S),contarL(L,C),P is S/C.
%factorial
fact(0,1).
fact(N,F):-N>0,N1 is N-1,fact(N1,F1),F is F1*N.
%esMiembtro(C,X) es C miembro de la lista X
esMiembro(_,[]):-false.
esMiembro(C,[X|_]):-C=X,!.
esMiembro(C,[_|Y]):-esMiembro(C,Y).
%unirl(L1,L2,L3) L3 es la lista que se compone de L1 y L2
%unirl([2,3,5],[6,4,3,6,9],[2,3,4,6,4,3,6,9])
unirl([],L,L).
unirl([X|Y],L,[X|W]):-unirl(Y,L,W).
%reversarL
%reversarL([1,2,3],[3,2,])
reversarL([],[]).
reversarL([X|Y],L):-reversarL(Y,L1),unirL(L1,[X],L).
%elimElem(E,L1,L2)L2 es con los elementos E
%eliminados de la lista L1
%elimElem(2,[1,2,4,3,2,5,2],[1,4,3,5])

%eliminarRep(L1,L2) L2 contiene los elementos no 
%repetidos de L1
%eliminarRep([1,2,3,5,3,2,2,1,1,1,5,1,1,2],[1,2,3,5])
