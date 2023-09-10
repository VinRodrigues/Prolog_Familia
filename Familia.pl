progenitor(pedro,joao).
progenitor(antonia,joao).
progenitor(pedro,clara).
progenitor(antonia,clara).
progenitor(pedro,francisco).
progenitor(antonia,francisco).
progenitor(pedro,ana).
progenitor(antonia,ana).
progenitor(ana,helena).
progenitor(ana,joana).
progenitor(joao,mario).
progenitor(mario,carlos).
progenitor(helena,carlos).
progenitor(clara, pietro).
progenitor(clara,enzo).
casal(pedro,antonia).
casal(francisco,milene).
casal(mario,helena).
casal(pietro,francisca).
casal(enzo,antonia).
sexo(pedro,masculino).
sexo(joao,masculino).
sexo(francisco,masculino).
sexo(mario,masculino).
sexo(carlos,masculino).
sexo(pietro,masculino).
sexo(enzo,masculino).
sexo(antonia,feminino).
sexo(clara,feminino).
sexo(ana,feminino).
sexo(helena,feminino).
sexo(francisca,feminino).

irma(X,Y):- progenitor(A,X),
    progenitor(A,Y),
    X\==Y,
    sexo(X,feminino).

irmao(X,Y):- progenitor(A,X),
    progenitor(A,Y),
    X\==Y,
    sexo(X,masculino).

tio(X, A) :-
    progenitor(Y, A),
    irmao(X, Y).

tia(X, A) :-
    progenitor(Y, A),
    irma(X, Y).
	
avo(X,Y):- progenitor(X,A),
    progenitor(A,Y),
    sexo(X,masculino).
avoa(X,Y) :- progenitor(X,A),
    progenitor(A,Y),
    sexo(X,feminino).

primo(X, Y) :-
    progenitor(A, X),
    progenitor(B, Y),
    irmao(A, B),
    X \== Y.

prima(X, Y) :-
    progenitor(A, X),
    progenitor(B, Y),
    irma(A, B),
    X \== Y.

descendente(Y,X):- progenitor(X,Y).

descendente(Y,X):- progenitor(X,A),
    descendente(A,Y).

ascendente(X, Y) :-
    progenitor(Y, X).
    
ascendente(X, Y) :-
    progenitor(A, X),
    ascendente(A, Y).