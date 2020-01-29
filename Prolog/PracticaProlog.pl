mujer(mary).
mujer(sandra).
mujer(juliet).
mujer(lisa).
hombre(peter).
hombre(paul).
hombre(dick).
hombre(bob).
hombre(harry).
% parent(padre o madre, hijo o hija)
parent(bob,lisa).
parent(bob,paul).
parent(bob,mary).
parent(juliet,lisa).
parent(juliet,paul).
parent(juliet,mary).
parent(peter,harry).
parent(lisa,harry).
parent(mary,dick).
parent(mary,sandra).
% X es padre de Y
padre(X,Y):-hombre(X),parent(X,Y).
%Definir la regla hermana(X,Y) X es hermana de Y
hermana(X,Y):-mujer(X),parent(Z,X),!,parent(Z,Y),X\=Y.
%X es abuelo de Y
abuelo(X,Y):- hombre(X),parent(X,Z),parent(Z,Y).
%X es abuela de Y
abuela(X,Y):- mujer(X),parent(X,Z),parent(Z,Y).
%X es tio de Y
tio(X,Y):- hombre(X),parent(Z,X),parent(Y,Z).
%X es primo de Y
primo(X,Y):- tio(Z,Y),parent(Z,X).

%aqui se hizo un cambio para el merge, hola mata