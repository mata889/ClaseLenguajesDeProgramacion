%ejemplo sacado de un video de youtube https://www.youtube.com/watch?v=W0l5WcUSwm4
likes(john,mary). % john likes mary
likes(john,meg). %john likes meg
likes(david,mary). %david likes mary
likes(mary,david). %mary like david

likes(mary,X):- likes(X,mary).
loves(mary,Y):- likes(Y,mary),likes(mary,Y).
 