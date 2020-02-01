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

eliminarC(_,[],[]).
eliminarC(C,[X|Y],L):-X\=C, eliminarC(C,Y,L1),L=[X|L1].
eliminarC(C,[_|Y],L):-eliminarC(C,Y,L1),L=L1.
miembroDe(_,[]):-false.
miembroDe(X,[Y|_]):-X=Y,!.
miembroDe(X,[_,L]):-miembroDe(X,L).
eliminaDup([],[]).
eliminaDup([X|Y],L):-eliminaDup(Y,L1),\+ miembroDe(X,L1),L=[X|L1].
eliminaDup([X|Y],L):-eliminaDup(Y,L1),miembroDe(X,L1),L=L1.



listamayores(L1,K,Resp1):-listamayores(L1,K,[],Resp),invertir(Resp,Resp1).
listamayores([],_,R,R).
listamayores([H|T],K,Temp,Resp):-H>K,listamayores(T,K,[H|Temp],Resp),!.
listamayores([H|T],K,Temp,Resp):-H<K,listamayores(T,K,Temp,Resp).



miembrode([H|_],H):-!.
miembrode([H|T],X):- X \=H, miembrode(T,X).

diferenciasim(L1,L2,Resp):-diferencia(L1,L2,[],Resp1),diferencia(L2,L1,[],Resp2),invertir(Resp2,Resp3),unir(Resp1,Resp3,Resp).
diferencia([],_,R,R):-!.
diferencia([H|T],Lista,Temp,Resp):-not(miembrode(Lista,H)),diferencia(T,Lista,[H|Temp],Resp),!.
diferencia([H|T],Lista,Temp,Resp):-miembrode(Lista,H),diferencia(T,Lista,Temp,Resp).


unir([],L2,L2).
unir([H|T],L2,Resp):-unir(T,[H|L2],Resp).

invertir(L,R):-invertir(L,[],R).
invertir([],R,R).
invertir([H|T],Temp,R):-invertir(T,[H|Temp],R).

%dividir([a,b,c,d,e,f,g,h),3,L1,L2).


dividir(L1,0,[],L1).
dividir([H|T],I,F,B):-
    I2 is I - 1,
    dividir(T,I2,F1,B),
    F = [H|F1].

%Dividir lista de numeros en orden

dividir([],_,[],[]).
dividir([H|L],N,[H|L2],L3):-H=<N,dividir(L,N,L2,L3).
dividir([H|L1],N,L2,[H|L3]):-H>=N,dividir(L1,N,L2,L3).
-------------------------
%dividir([1,2,3,4,5,6],4,L1,L2).

pack([],[]).
pack([X|Xs],[Z|Zs]) :- transfer(X,Xs,Ys,Z), pack(Ys,Zs).

% transfer(X,Xs,Ys,Z) Ys is the list that remains from the list Xs
%    when all leading copies of X are removed and transfered to Z

transfer(X,[],[],[X]).
transfer(X,[Y|Ys],[Y|Ys],[X]) :- X \= Y.
transfer(X,[X|Xs],Ys,[X|Zs]) :- transfer(X,Xs,Ys,Zs).
