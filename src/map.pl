:- dynamic(lengthBoard/1).
:- dynamic(player1Pos/1).
:- dynamic(player2Pos/1).
:- dynamic(initializedMap/1).

/* FACT */
mapPos(1, 'GO').
mapPos(2, 'A1').
mapPos(3, 'A2').
mapPos(4, 'A3').
mapPos(5, 'CF').
mapPos(6, 'B1').
mapPos(7, 'B2').
mapPos(8, 'B3').
mapPos(9, 'JL').
mapPos(10, 'C1').
mapPos(11, 'C2').
mapPos(12, 'C3').
mapPos(13, 'TX').
mapPos(14, 'D1').
mapPos(15, 'D2').
mapPos(16, 'D3').
mapPos(17, 'FP').
mapPos(18, 'E1').
mapPos(19, 'E2').
mapPos(20, 'E3').
mapPos(21, 'CC').
mapPos(22, 'F1').
mapPos(23, 'F2').
mapPos(24, 'F3').
mapPos(25, 'WT').
mapPos(26, 'G1').
mapPos(27, 'G2').
mapPos(28, 'G3').
mapPos(29, 'TX').
mapPos(30, 'CC').
mapPos(31, 'H1').
mapPos(32, 'H2').

createMap :-
    initializedMap(init),
    assertz(lengthBoard(32)),
    createPlayerTile(1).

updatePlayer1Pos(New) :-
    player1Pos(Old),
    retractall(player1Pos(_)),
    NewPos is New + Old,
    updateNewPos(NewPos, X, 1),
    assertz(player1Pos(X)),
    map.

gotoJailPlayer1 :-
    retractall(player1Pos(_)),
    assertz(player1Pos(9)).

updatePlayer2Pos(New) :-
    player2Pos(Old),
    retractall(player2Pos(_)),
    NewPos is New + Old,
    updateNewPos(NewPos, X, 2),
    assertz(player2Pos(X)),
    map.

gotoJailPlayer2 :-
    retractall(player2Pos(_)),
    assertz(player2Pos(9)).

updateNewPos(NewPos, X, P) :-
    (NewPos > 32, X is NewPos mod 32,
        (P =:= 1 -> updatePlayer1Money(1000), 
        nl, write('KAMU LEWAT GO!'), nl, write('Menambah saldo sebesar 1000!'), nl, !;
        (P =:= 2 -> updatePlayer2Money(1000)),
        nl, write('KAMU LEWAT GO!'), nl, write('Menambah saldo sebesar 1000!'), nl, !));
    (X is NewPos).

createPlayerTile(X) :-
    assertz(player1Pos(X)),
    assertz(player2Pos(X)).

initMap :-
    assertz(initializedMap(init)),  % Penanda
    createMap,
    map.

map :-
    checkStart,
    nl,
    tab(7), write('         '), printHorizontal1Player, nl,
    tab(7), write('         '), printHorizontal1Bangunan, nl,
    tab(7), write('    ----------------------------------------------'), nl,
    printVerticalPlayer(17), printVerticalBangunan(17), write(' | FP | E1 | E2 | E3 | CC | F1 | F2 | F3 | WT |'), printVertical2Bangunan(25), tab(1), printVertical2Player(25), nl,
    printVerticalPlayer(16), printVerticalBangunan(16), write(' | D3 |----------------------------------| G1 |'), printVertical2Bangunan(26), tab(1), printVertical2Player(26), nl,
    printVerticalPlayer(15), printVerticalBangunan(15), write(' | D2 |                                  | G2 |'), printVertical2Bangunan(27), tab(1), printVertical2Player(27), nl,
    printVerticalPlayer(14), printVerticalBangunan(14), write(' | D1 |                                  | G3 |'), printVertical2Bangunan(28), tab(1), printVertical2Player(28), nl,
    printVerticalPlayer(13), printVerticalBangunan(13), write(' | TX |          M O N O P O L Y         | TX |'), printVertical2Bangunan(29), tab(1), printVertical2Player(29), nl,
    printVerticalPlayer(12), printVerticalBangunan(12), write(' | C3 |                                  | CC |'), printVertical2Bangunan(30), tab(1), printVertical2Player(30), nl,
    printVerticalPlayer(11), printVerticalBangunan(11), write(' | C2 |                                  | H1 |'), printVertical2Bangunan(31), tab(1), printVertical2Player(31), nl,
    printVerticalPlayer(10), printVerticalBangunan(10), write(' | C1 |----------------------------------| H2 |'), printVertical2Bangunan(32), tab(1), printVertical2Player(32), nl,
    printVerticalPlayer(9), printVerticalBangunan(9), write(' | JL | B3 | B2 | B1 | CF | A3 | A2 | A1 | GO |'), printVertical2Bangunan(1), tab(1), printVertical2Player(1), nl,
    tab(7), write('    ----------------------------------------------'), nl,
    tab(7), write('         '), printHorizontal2Bangunan, nl,
    tab(7), write('         '), printHorizontal2Player, nl, nl,
    playersPos.

playersPos :-
    player1Name(X1), player1Pos(P1), mapPos(P1, LOC1),
    player2Name(X2), player2Pos(P2), mapPos(P2, LOC2),
    tab(8), write('    '), write('Posisi pemain:'), nl,
    tab(8), write('    '), format('~c = ~w', [X1, LOC1]), nl,
    tab(8), write('    '), format('~c = ~w', [X2, LOC2]), nl.

printHorizontal1Bangunan :-
    forall(upto(18, 24, X),
        printCharHBangunan(X)
    ).

printHorizontal1Player :-
    forall(upto(18, 24, X),
        printCharHPlayer(X)
    ).

printHorizontal2Bangunan :-
    forall(downto(8, 2, X),
        printCharHBangunan(X)
    ).

printHorizontal2Player :-
    forall(downto(8, 2, X),
        printCharHPlayer(X)
    ).

printVerticalBangunan(Y) :-
    printCharVBangunan(Y).

printVertical2Bangunan(Y) :-
    printCharV2Bangunan(Y).

printVerticalPlayer(Y) :-
    printCharVPlayer(Y).

printVertical2Player(Y) :-
    printCharV2Player(Y).

/* ================ VERTICAL ================ */

printCharVBangunan(X) :-
    (listPropertyPlayer1(LIST, TYPE, _),
    searchX(LIST, X, HASILPOS), getIndex(LIST, X, INDEX), getElmt(TYPE, INDEX, LOCTYPE),
    HASILPOS =:= 1, !,
    (LOCTYPE =:= 5, write(' XL');
    (format(' X~d', [LOCTYPE - 1])))).

printCharVBangunan(X) :-
    (listPropertyPlayer2(LIST, TYPE, _),
    searchX(LIST, X, HASILPOS), getIndex(LIST, X, INDEX), getElmt(TYPE, INDEX, LOCTYPE),
    HASILPOS =:= 1, !,
    (LOCTYPE =:= 5, write(' YL');
    (format(' Y~d', [LOCTYPE - 1])))).

printCharVBangunan(_) :-
    (tab(3)).

printCharV2Bangunan(X) :-
    (listPropertyPlayer1(LIST, TYPE, _),
    searchX(LIST, X, HASILPOS), getIndex(LIST, X, INDEX), getElmt(TYPE, INDEX, LOCTYPE),
    HASILPOS =:= 1, !,
    (LOCTYPE =:= 5, write(' XL');
    (format(' X~d', [LOCTYPE - 1])))).

printCharV2Bangunan(X) :-
    (listPropertyPlayer2(LIST, TYPE, _),
    searchX(LIST, X, HASILPOS), getIndex(LIST, X, INDEX), getElmt(TYPE, INDEX, LOCTYPE),
    HASILPOS =:= 1, !,
    (LOCTYPE =:= 5, write(' YL');
    (format(' Y~d', [LOCTYPE - 1])))).

printCharV2Bangunan(_) :-
    (tab(3)).

/* Player aja */
printCharVPlayer(X) :-
    (player1Pos(X), player2Pos(X), !, write('  *X'), write(' *Y')).

printCharVPlayer(X) :-
    (player1Pos(X), !, tab(3), write('  *X')).

printCharVPlayer(X) :-
    (player2Pos(X), !, tab(3), write('  *Y')).

printCharVPlayer(_) :-
    (tab(7)).

printCharV2Player(X) :-
    (player1Pos(X), player2Pos(X), !, write('*X'), write(' *Y ')).

printCharV2Player(X) :-
    (player1Pos(X), !, write('*X ')).

printCharV2Player(X) :-
    (player2Pos(X), !, write('*Y ')).

printCharV2Player(_) :-
    (tab(7)).

/* ================ HORIZONTAL ================ */

printCharHBangunan(X) :-
    (listPropertyPlayer1(LIST, TYPE, _),
    searchX(LIST, X, HASILPOS), getIndex(LIST, X, INDEX), getElmt(TYPE, INDEX, LOCTYPE),
    HASILPOS =:= 1, !,
    (LOCTYPE =:= 5, write('  XL ');
    (format('  X~d ', [LOCTYPE - 1])))).

printCharHBangunan(X) :-
    (listPropertyPlayer2(LIST, TYPE, _),
    searchX(LIST, X, HASILPOS), getIndex(LIST, X, INDEX), getElmt(TYPE, INDEX, LOCTYPE),
    HASILPOS =:= 1, !,
    (LOCTYPE =:= 5, write('  YL ');
    (format('  Y~d ', [LOCTYPE - 1])))).

printCharHBangunan(_) :-
    (tab(5)).

printCharHPlayer(X) :-
    (player1Pos(X), player2Pos(X), !, write(' *X*Y ')).

printCharHPlayer(X) :-
    (player1Pos(X), !, write('  *X ')).

printCharHPlayer(X) :-
    (player2Pos(X), !, write('  *Y ')).

printCharHPlayer(_) :-
    (tab(5)).
