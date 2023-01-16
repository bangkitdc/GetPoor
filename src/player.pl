:- dynamic(player1Money/1).
:- dynamic(player2Money/1).
:- dynamic(player1Property/1).
:- dynamic(player2Property/1).
:- dynamic(initializedPlayer1/1).
:- dynamic(initializedPlayer2/1).
:- dynamic(player1Name/1).
:- dynamic(player2Name/1).
:- dynamic(listPropertyPlayer1/3).
:- dynamic(listPropertyPlayer2/3).
:- dynamic(listCardPlayer1/2).
:- dynamic(listCardPlayer2/2).

/* Player Initiation */
initPlayer :-
    assertz(initializedPlayer1(init)),  % Penanda
    assertz(initializedPlayer2(init)),  % Penanda
    assertz(player1Money(500)),
    assertz(player2Money(500)),
    assertz(player1Property(0)),
    assertz(player2Property(0)),
    assertz(player1Name(0'X)),
    assertz(player2Name(0'Y)),
    assertz(listPropertyPlayer1([], [], 0)),
    assertz(listPropertyPlayer2([], [], 0)),
    assertz(listCardPlayer1([], 0)),
    assertz(listCardPlayer2([], 0)).

/* MONEY SECTION */
updateNewMoney(NewMoney, X) :-
    (NewMoney =< 0, X is 0, !);
    (X is NewMoney).

/* Update Player 1 Money */
updatePlayer1Money(New) :-
    player1Money(Old),
    retractall(player1Money(_)),
    NewMoney is New + Old,
    updateNewMoney(NewMoney, X),
    assertz(player1Money(X)).

/* Update Player 2 Money */
updatePlayer2Money(New) :-
    player2Money(Old),
    retractall(player2Money(_)),
    NewMoney is New + Old,
    updateNewMoney(NewMoney, X),
    assertz(player2Money(X)).

/* PROPERTY SECTION */
updateNewProperty(NewProperty, X) :-
    (NewProperty =< 0, X is 0, !);
    (X is NewProperty).

/* Update Player 1 Property (In Money) */
updatePlayer1Property(New) :-
    player1Property(Old),
    retractall(player1Property(_)),
    NewProperty is New + Old,
    updateNewProperty(NewProperty, X),
    assertz(player1Property(X)).

/* Update Player 2 Property (In Money) */
updatePlayer2Property(New) :-
    player2Property(Old),
    retractall(player2Property(_)),
    NewProperty is New + Old,
    updateNewProperty(NewProperty, X),
    assertz(player2Property(X)).

/* Update Player 1 Property (By ListProperty) */
iteratePlayer1Property(LIST, LISTTYPE, X) :-
    getElmt(LIST, X, HASIL),
    indeks(POSISI, HASIL),  %posisi -> a1, a2, ...
    getElmt(LISTTYPE, X, HASILTYPE),    % tanah(a1, 150, 10).
    (HASILTYPE =:= 1, tanah(POSISI, HARGAPROPERTY, HARGASEWA);
    (HASILTYPE =:= 2, bangunanSatu(POSISI, HARGAPROPERTY, HARGASEWA);
    (HASILTYPE =:= 3, bangunanDua(POSISI, HARGAPROPERTY, HARGASEWA);
    (HASILTYPE =:= 4, bangunanTiga(POSISI, HARGAPROPERTY, HARGASEWA);
    (HASILTYPE =:= 5, landmark(POSISI, HARGAPROPERTY, HARGASEWA)
    ))))),
    updatePlayer1Property(HARGAPROPERTY).

updatePlayer1Propertys :-
    listPropertyPlayer1(LISTPROPERTY, LISTTYPE, LEN),
    retractall(player1Property(_)),
    assertz(player1Property(0)),
    forall(upto(1, LEN, X),
        iteratePlayer1Property(LISTPROPERTY, LISTTYPE, X)
    ).
    
/* Update Player 2 Property (By ListProperty) */
iteratePlayer2Property(LIST, LISTTYPE, X) :-
    getElmt(LIST, X, HASIL),
    indeks(POSISI, HASIL),  %posisi -> a1, a2, ...
    getElmt(LISTTYPE, X, HASILTYPE),    % tanah(a1, 150, 10).
    (HASILTYPE =:= 1, tanah(POSISI, HARGAPROPERTY, HARGASEWA);
    (HASILTYPE =:= 2, bangunanSatu(POSISI, HARGAPROPERTY, HARGASEWA);
    (HASILTYPE =:= 3, bangunanDua(POSISI, HARGAPROPERTY, HARGASEWA);
    (HASILTYPE =:= 4, bangunanTiga(POSISI, HARGAPROPERTY, HARGASEWA);
    (HASILTYPE =:= 5, landmark(POSISI, HARGAPROPERTY, HARGASEWA)
    ))))), 
    updatePlayer2Property(HARGAPROPERTY).

updatePlayer2Propertys :-
    listPropertyPlayer2(LISTPROPERTY, LISTTYPE, LEN),
    retractall(player2Property(_)),
    assertz(player2Property(0)),
    forall(upto(1, LEN, X),
        iteratePlayer2Property(LISTPROPERTY, LISTTYPE, X)
    ).

/* Update by props */
updateListPropertyByProps(LOC, TYPE, OWNER) :-
    (OWNER == p1,
    listPropertyPlayer1(LISTPROP, LISTTYPE, LEN),
    indeks(LOC, ANGKA), % ANGKA -> POSISI DI MAP
    insertAtEnd(LISTPROP, ANGKA, LISTNEW1), 
    insertAtEnd(LISTTYPE, TYPE, LISTNEW2),
    LENNEW is LEN + 1,
    retractall(listPropertyPlayer1(_, _, _)),
    assertz(listPropertyPlayer1(LISTNEW1, LISTNEW2, LENNEW));
    (OWNER == p2,
    listPropertyPlayer2(LISTPROP, LISTTYPE, LEN),
    indeks(LOC, ANGKA), % ANGKA -> POSISI DI MAP
    insertAtEnd(LISTPROP, ANGKA, LISTNEW1), 
    insertAtEnd(LISTTYPE, TYPE, LISTNEW2),
    LENNEW is LEN + 1,
    retractall(listPropertyPlayer2(_, _, _)),
    assertz(listPropertyPlayer2(LISTNEW1, LISTNEW2, LENNEW));
    (write('')))).

updatePropertysByProps :-
    retractall(listPropertyPlayer1(_, _, _)),
    retractall(listPropertyPlayer2(_, _, _)),
    assertz(listPropertyPlayer1([], [], 0)),
    assertz(listPropertyPlayer2([], [], 0)),
    forall(prop(LOC, TYPE, OWNER),
        updateListPropertyByProps(LOC, TYPE, OWNER)
    ),
    updatePlayer1Propertys, updatePlayer2Propertys.

/* Player Detail */
/* Print Property (1 by 1) */
printProperty(LIST, LISTNAME, X) :-
    getElmt(LIST, X, HASIL),
    getElmt(LISTNAME, X, HASILNAME),
    mapPos(HASIL, LOC),
    (HASILNAME =:= 1, LOCNAME = 'Tanah';
    (HASILNAME =:= 2, LOCNAME = 'Bangunan 1';
    (HASILNAME =:= 3, LOCNAME = 'Bangunan 2';
    (HASILNAME =:= 4, LOCNAME = 'Bangunan 3';
    (HASILNAME =:= 5, LOCNAME = 'Landmark'
    ))))), indeks(Pos, HASIL), ambilHargaProperty(Pos, HASILNAME, Harga),
    format('~d. ~w - ~w - ', [X, LOC, LOCNAME]), write(Harga), nl.

/* Print Property (keseluruhan) */
printPropertys(LIST, LISTNAME, LEN) :-
    forall(upto(1, LEN, X),
        printProperty(LIST, LISTNAME, X)
    ).

printPropertyUpgradePrice(LIST, LISTNAME, X) :-
    getElmt(LIST, X, HASIL),
    getElmt(LISTNAME, X, HASILNAME),
    mapPos(HASIL, LOC),
    (HASILNAME =:= 1, LOCNAME = 'Tanah';
    (HASILNAME =:= 2, LOCNAME = 'Bangunan 1';
    (HASILNAME =:= 3, LOCNAME = 'Bangunan 2';
    (HASILNAME =:= 4, LOCNAME = 'Bangunan 3';
    (HASILNAME =:= 5, LOCNAME = 'Landmark'
    ))))), indeks(Pos, HASIL), ambilHargaUpgrade(Pos, HASILNAME, Harga),
    format('~d. ~w - ~w - ', [X, LOC, LOCNAME]), write(Harga), nl.

/* Print Property (keseluruhan) */
printPropertysUpgradePrice(LIST, LISTNAME, LEN) :-
    forall(upto(1, LEN, X),
        printPropertyUpgradePrice(LIST, LISTNAME, X)
    ).

/* Print Card (1 by 1) */
printCard(LISTCARD, X) :-
    getElmt(LISTCARD, X, HASILCARD),
    (HASILCARD =:= 1, CARDNAME = 'Tax Card';
    (HASILCARD =:= 2, CARDNAME = 'Gift Card';
    (HASILCARD =:= 3, CARDNAME = 'Get Out From Jail Card';
    (HASILCARD =:= 4, CARDNAME = 'Go To Jail Card')))),
    format('~d. ~w', [X, CARDNAME]), nl.

/* Print Card (keseluruhan) */
printCards(LISTCARD, LEN) :-
    forall(upto(1, LEN, X),
        printCard(LISTCARD, X)
    ).

/* Check Details Player */
checkPlayerDetail(P) :-
    checkStart,
    ((P == x, nl, write('Informasi Player X'), nl, nl,
    player1Pos(X), mapPos(X, LOC), player1Money(MONEY), 
    updatePropertysByProps, player1Property(PROPERTY),
    listPropertyPlayer1(LIST, LISTNAME, LENPROPERTY),
    listCardPlayer1(LISTCARD, LENCARD),
    format('Lokasi                      : ~w', [LOC]), nl,
    format('Total Uang                  : ~d', [MONEY]), nl,
    format('Total Nilai Properti        : ~d', [PROPERTY]), nl,
    format('Total Aset                  : ~d', [MONEY + PROPERTY]), nl, nl,

    write('Daftar Kepemilikan Properti : '), nl,
    ((LENPROPERTY =:= 0, write('Player X tidak memiliki Properti'), nl, nl, !);
    printPropertys(LIST, LISTNAME, LENPROPERTY), nl),

    write('Daftar Kepemilikan Card     : '), nl,
    ((LENCARD =:= 0, write('Player X tidak memiliki Card'), nl, !);
    printCards(LISTCARD, LENCARD))
    , !);
    (P == y, nl, write('Informasi Player Y'), nl, nl,
    player2Pos(X), mapPos(X, LOC), player2Money(MONEY), 
    updatePropertysByProps, player2Property(PROPERTY),
    listPropertyPlayer2(LIST, LISTNAME, LENPROPERTY),
    listCardPlayer2(LISTCARD, LENCARD),
    format('Lokasi                      : ~w', [LOC]), nl,
    format('Total Uang                  : ~d', [MONEY]), nl,
    format('Total Nilai Properti        : ~d', [PROPERTY]), nl,
    format('Total Aset                  : ~d', [MONEY + PROPERTY]), nl, nl,

    write('Daftar Kepemilikan Properti : '), nl,
    ((LENPROPERTY =:= 0, write('Player Y tidak memiliki Properti'), nl, nl, !);
    printPropertys(LIST, LISTNAME, LENPROPERTY), nl),

    write('Daftar Kepemilikan Card     : '), nl,
    ((LENCARD =:= 0, write('Player Y tidak memiliki Card'), nl, !);
    printCards(LISTCARD, LENCARD))
    );
    (P \= x, P \= y, nl, write('Perintah tidak valid, masukkan checkPlayerDetail(x/y)!'), nl)).
