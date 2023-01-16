/* UTILITY */

/* For Loop (kecil -> besar) */
upto(Low, High, Low) :- Low =< High.
upto(Low, High, X) :-
    Inc is Low + 1,
    Inc =< High,
    upto(Inc, High, X).

/* For Loop (besar -> kecil) */
downto(High, Low, High) :- High >= Low.
downto(High, Low, X) :-
    Inc is High - 1,
    Inc >= Low,
    downto(Inc, Low, X).

/* Pangkat 2 (X ^ Y = Z)*/
pow2(_, 0, 1) :- !.
pow2(X, Y, Z) :- Y1 is Y - 1, pow2(X, Y1, Z1), Z is Z1 * X.

/* validateInput (batasBawah, batasAtas, Result)*/
validateInput(X, Y, N) :-
    nl, write('>> '), read(A),
    integer(A),
    A >= X, A =< Y, N is A, !.
validateInput(X, Y, N) :-
    nl, write('Input tidak valid!'), 
    validateInput(X, Y, N), !.

/* Generate 2 random numbers for dice */
randomDice(X, Y) :-
    pow2(2, 16, T),
    lcg(75, 74, T + 1, 96797, X1), X is (X1 mod 6) + 1,
    format('Dadu 1: ~d', [X]), nl,
    lcg(75, 74, T + 1, 96797, Y1), Y is (Y1 mod 6) + 1,
    format('Dadu 2: ~d', [Y]), nl.

/* Generate 1 random numbers for card */
randomCard(X) :-
    X is 4.
    % pow2(2, 16, T),
    % lcg(75, 74, T + 1, 96797, X1), X is (X1 mod 7) + 1.

% LCG algorithm -> Xn+1 = (aXn + c) mod m
lcg(A, C, M, N, X) :-
    (N =:= 0, real_time(T), X1 is T, X is (A * X1 + C) mod M);
    (N1 is (N - 1), lcg(A, C, M, N1, X1), X is (A * X1 + C) mod M), !.

/* Generate 1 random number for random money (gift card) */
randomMoney(X) :-
    pow2(2, 16, T),
    lcg(75, 74, T + 1, 967, X1), X is (X1 mod 18) + 1.


/* isEqual X, Y, Result */
isEqual(X, Y, Result) :- X =:= Y, Result is 1, !.
isEqual(X, Y, Result) :- X =\= Y, Result is 0, !.

/* LIST */

/* Length */
lengthList([], 0) :- !.
lengthList([_|T], Count) :- lengthList(T, Count1), Count is (Count1 + 1).

/* Get Index (List, Element, Index)*/
getIndex([], _, _) :- !, fail.
getIndex([H|T], X, Index) :-
    (H == X, Index is 1, !);
    (getIndex(T, X, Index1), Index is (Index1 + 1)).

/* Get Element (List, Index, Element)*/
getElmt([H|_], 1, Result) :- Result is H, !.
getElmt([_|T], I, Result) :- 
    I1 is I - 1, getElmt(T, I1, Result).

/* Set Element (oldList, Index, newElmt, newList)*/
setElmt([H|T], I, X, Result) :- 
    ((I =:= 1), Result = [X|T], !);
    (I1 is I - 1, setElmt(T, I1, X, Result2), Result = [H|Result2]).

/* Append (oldList, X, newList)*/
insertAtEnd([], X, [X]) :- !.
insertAtEnd([H|A], X, [H|B]) :- insertAtEnd(A, X, B).

/* SearchX (List, X, Result)*/
searchX([], _, 0) :- !.
searchX([X|_], X, 1) :- !.
searchX([_|T], X, Result) :- searchX(T, X, Result).

/* deleteIndex (List, Index, Result) Index dimulai dari 1*/
deleteIndex([_|T], 1, T) :- !.
deleteIndex([H|T], I, Result) :-
    I1 is I - 1, deleteIndex(T, I1, Result2), Result = [H|Result2].

/* deleteX (oldList, X, newList) */
deleteX([], _, []) :- !.
deleteX([X|T], X, T) :- !.
deleteX([H|T], X, Result) :-
    deleteX(T, X, Result2), Result = [H|Result2].

/* isEmpty (List, Result) */
isEmpty([], 1) :- !.
isEmpty([_|_], 0) :- !.