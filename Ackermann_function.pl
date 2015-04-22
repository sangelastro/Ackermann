%% Two simple way to calculate the Ackermann function


%% Way 1: can solve acker(_,acker(_,_,_),_) 

acker(0,N,X):- number(N),pos(N),X is N+1.
acker(M,0,X):- U is M-1,acker(U,1,X).
acker(M,N,X):- number(N),pos(M),pos(N),U is M-1, V is N-1,acker(U,acker(M,V,Y),X).
acker(M,acker(M1,N1,X1),X):- acker(M1,N1,X1),acker(M,X1,X).

%% Way 2: split acker(_,acker(_,_,_),_) in acker(_,_,_), acker(_,_,_) 

acker1(0,N,X):- pos(N),X is N+1.
acker1(M,0,X):- U is M-1,acker1(U,1,X).
acker1(M,N,X):- pos(M),pos(N),U is M-1, V is N-1,acker1(M,V,Y),acker1(U,Y,X).

pos(X):- X>0.