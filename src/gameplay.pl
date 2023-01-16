:- dynamic(turn/1).
:- dynamic(initializedGame/1).

/* Initiation Game */
initGame :-
    assertz(turn(p1)),
    assertz(initializedGame(true)),
    initJail.

/* Change Turn */
changeTurn :-
    (turn(p1), retractall(turn(_)), assertz(turn(p2)), !);
    (turn(p2), retractall(turn(_)), assertz(turn(p1))), !.

/* Buy for P1 */
buyMap :-
    turn(p1), player1Pos(H), indeks(Pos, H), beli(Pos), !.

/* Buy for P2 */
buyMap :-
    turn(p2), player2Pos(H), indeks(Pos, H), beli(Pos), !.

/* ================ ACTIONS ================ */
actions(D) :-
    /* BAGIAN FP P1 */
    turn(p1), player1Pos(N),
    (N =:= 17),
    parkirGratis,
    
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN FP P2 */
    turn(p2), player2Pos(N),
    (N =:= 17),
    parkirGratis,
    
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(_) :-
    /* BAGIAN WT */
    turn(p1), player1Pos(N),
    (N =:= 25), nl,
    write('KAMU BERADA DI WORLD TOUR!'), nl,
    write('throwDice di putaran selanjutnya untuk terbang~~'), nl,
    
    changeTurn, !.

actions(_) :-
    /* BAGIAN WT */
    turn(p2), player2Pos(N), 
    (N =:= 25), nl,
    write('KAMU BERADA DI WORLD TOUR!'), nl,
    write('throwDice di putaran selanjutnya untuk terbang~~'), nl,
    
    changeTurn, !.

actions(D) :-
    /* BAGIAN JL P1 */
    turn(p1), player1Pos(N),
    (N =:= 9), inJailP1(X), X == false, nl,
    write('KAMU LEWAT PENJARA!'), nl,
    
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN JL P2 */
    turn(p2), player2Pos(N),
    (N =:= 9), inJailP2(X), X == false, nl,
    write('KAMU LEWAT PENJARA!'), nl,
    
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN TX P1 */
    turn(p1), player1Pos(N),
    (N =:= 13; N =:= 29),
    taxp1, 
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN TX P2 */
    turn(p2), player2Pos(N),
    (N =:= 13; N =:= 29),
    taxp2, 
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN CF P1 */
    turn(p1), player1Pos(N),
    (N =:= 5),
    coinflip(1,0),
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN CF P2 */
    turn(p2), player2Pos(N),
    (N =:= 5),
    coinflip(1,0),
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN CC P1 */
    turn(p1), player1Pos(N),
    (N =:= 21; N =:= 30),
    ccP1,
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN CC P2 */
    turn(p2), player2Pos(N),
    (N =:= 21; N =:= 30),
    ccP2, 
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN GO P1 */
    turn(p1), player1Pos(N), N =:= 1, nl,
    write('====================== LOKASI GO ======================='), nl,
    write('Kamu bisa upgrade properti disini!'), nl,
    listPropertyPlayer1(List, Listname, Len),
    write('Daftar Kepemilikan Properti : '), nl,
    write('(Lokasi) - (Tingkatan) - (Harga Upgrade)'), nl,
    ((Len =:= 0, write('Player A tidak memiliki Properti'), nl, nl, !);
        printPropertysUpgradePrice(List, Listname, Len), nl,
        player1Money(Duit), write('Saldo anda saat ini: '), write(Duit), nl,
        write('Masukkan properti yang ingin diupgrade (0 untuk batal): '), nl,
        validateInput(0, Len, X),
        (X =\= 0, getElmt(List, X, Pos), indeks(Loc, Pos), 
        prop(Loc, Level, _), ambilHargaUpgrade(Loc, Level, Harga),
            (Duit >= Harga, upgrade(Loc); Duit < Harga, nl, write('Saldo anda tidak cukup!'), nl); 
        X =:= 0, write(''))),
    
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN GO P2 */
    turn(p2), player2Pos(N), N =:= 1, nl,
    write('====================== LOKASI GO ======================='), nl,
    write('Kamu bisa upgrade properti disini!'), nl,
    listPropertyPlayer2(List, Listname, Len),
    write('Daftar Kepemilikan Properti : '), nl,
    write('(Lokasi) - (Tingkatan) - (Harga Upgrade)'), nl,
    ((Len =:= 0, write('Player A tidak memiliki Properti'), nl, nl, !);
        printPropertysUpgradePrice(List, Listname, Len), nl,
        player2Money(Duit), write('Saldo anda saat ini: '), write(Duit), nl,
        write('Masukkan properti yang ingin diupgrade (0 untuk batal): '), nl,
        validateInput(0, Len, X),
        (X =\= 0, getElmt(List, X, Pos), indeks(Loc, Pos), 
        prop(Loc, Level, _), ambilHargaUpgrade(Loc, Level, Harga),
            (Duit >= Harga, upgrade(Loc); Duit < Harga, nl, write('Saldo anda tidak cukup!'), nl); 
        X =:= 0, write(''))),
    
    (D =\= 1, changeTurn;
        (write(''))), !.
    
actions(D) :-
    /* BAGIAN BUY P1 */
    /* klo blm ada yg punya */
    turn(p1), player1Pos(N),
    indeks(Pos, N),
    prop(Pos, _, Owner), Owner == 0,
    checkLocationDetail(Pos),
    nl, write('KAMU DI TANAH KOSONG!'), nl,
    player1Money(A), write('Saldo Anda: '), write(A), nl,
    tanah(Pos, B, _), write('Harga beli tanah: '), write(B), nl,
    (A >= B, 
        write('1. buy property'), nl, write('2. ignore'), nl,
        validateInput(1,2,X),
        (X =:= 1, buyMap; X =:= 2); write('')),
     
    % actions()
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN BUY P2 */
    /* klo blm ada yg punya */
    turn(p2), player2Pos(N),
    indeks(Pos, N), 
    prop(Pos, _, Owner), Owner == 0,
    checkLocationDetail(Pos),
    nl, write('KAMU DI TANAH KOSONG!'), nl,
    player2Money(A), write('Saldo Anda: '), write(A), nl,
    tanah(Pos, B, _), write('Harga beli tanah: '), write(B), nl,
    (A >= B, 
        write('1. buy property'), nl, write('2. ignore'), nl,
        validateInput(1,2,X),
        (X =:= 1, buyMap; X =:= 2); write('')),
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN BUY P1 */
    /* milik sendiri */
    turn(p1), player1Pos(N),
    indeks(Pos, N),
    prop(Pos, _, Owner), Owner == p1,
    checkLocationDetail(Pos),
    nl, write('BERADA DI PROPERTI SENDIRI!'), nl,
    player1Money(A), write('Saldo Anda: '), write(A), nl,
    prop(Pos, Level, _), ambilHargaUpgrade(Pos, Level, B),
    write('Harga upgrade bangunan: '), write(B), nl,
    (A >= B,
        write('1. upgrade property'), nl, write('2. ignore'), nl,
        validateInput(1,2,X),
        (X =:= 1, upgrade(Pos); X =:= 2); write('')),
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN BUY P2 */
    /* milik sendiri */
    turn(p2), player2Pos(N),
    indeks(Pos, N), 
    prop(Pos, _, Owner), Owner == p2,
    checkLocationDetail(Pos),
    nl, write('BERADA DI PROPERTI SENDIRI!'), nl,
    player2Money(A), write('Saldo Anda: '), write(A), nl,
    prop(Pos, Level, _), ambilHargaUpgrade(Pos, Level, B),
    write('Harga upgrade bangunan: '), write(B), nl,
    (A >= B,
        write('1. upgrade property'), nl, write('2. ignore'), nl,
        validateInput(1,2,X),
        (X =:= 1, upgrade(Pos); X =:= 2); write('')),
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN BUY P1 */
    /* milik orang, SANGGUP SEWA */
    turn(p1), player1Pos(N),
    indeks(Pos, N),
    prop(Pos, Level, Owner), Owner == p2,
    player1Money(Duit), ambilHargaSewa(Pos, Level, Harga),
    Duit >= Harga,
    checkLocationDetail(Pos), nl,
    sewa(Pos), nl, player1Money(A),
    tanah(Pos, B, _), write('Harga akuisisi tanah: '), write(B), nl,
    (A >= B,
        write('1. acquire property'), nl, write('2. ignore'), nl,
        validateInput(1,2,X),
        (X =:= 1, acquire(Pos), actions(1); X =:= 2); write('')),
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN BUY P1 */
    /* milik orang, GA SANGGUP SEWA, TAPI BISA JUAL PROP */
    turn(p1), player1Pos(N),
    indeks(Pos, N),
    prop(Pos, Level, Owner), Owner == p2,
    player1Money(Duit), ambilHargaSewa(Pos, Level, Harga),
    Duit < Harga, player1Property(Prop), Aset is Duit + Prop, Aset >= Harga,
    checkLocationDetail(Pos), nl,
    write('Saldo Anda: '), write(Duit), nl,
    write('Harga sewa: '), write(Harga), nl, nl,
    write('SALDO ANDA KURANG UNTUK MEMBAYAR SEWA!'), nl,
    write('Total aset Anda: '), write(Aset), nl,
    actionsjual, actions(1),
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(_) :-
    /* BAGIAN BUY P1 */
    /* milik orang, BANGKRUT */
    turn(p1), player1Pos(N),
    indeks(Pos, N),
    prop(Pos, Level, Owner), Owner == p2,
    player1Money(Duit), ambilHargaSewa(Pos, Level, Harga),
    Duit < Harga, player1Property(Prop), Aset is Duit + Prop, Aset < Harga,
    checkLocationDetail(Pos), nl,
    write('Saldo Anda: '), write(Duit), nl,
    write('Total aset Anda: '), write(Aset), nl,
    write('Harga sewa: '), write(Harga), nl, nl,
    write('KAMU BANGKRUT :('), nl,
    winsplashY, nl, write('Enter anything to exit.'), nl, write('>>> '),
    read(_), exit.

actions(D) :-
    /* BAGIAN BUY P2 */
    /* milik orang, SANGGUP SEWA */
    turn(p2), player2Pos(N),
    indeks(Pos, N), 
    prop(Pos, Level, Owner), Owner == p1,
    player2Money(Duit), ambilHargaSewa(Pos, Level, Harga),
    Duit >= Harga,
    checkLocationDetail(Pos), nl,
    sewa(Pos), nl, player2Money(A),
    tanah(Pos, B, _), write('Harga akuisisi tanah: '), write(B), nl,
    (A >= B,
        write('1. acquire property'), nl, write('2. ignore'), nl,
        validateInput(1,2,X),
        (X =:= 1, acquire(Pos), actions(1); X =:= 2); write('')),
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(D) :-
    /* BAGIAN BUY P2 */
    /* milik orang, GA SANGGUP SEWA, TAPI BISA JUAL PROP */
    turn(p2), player2Pos(N),
    indeks(Pos, N),
    prop(Pos, Level, Owner), Owner == p1,
    player2Money(Duit), ambilHargaSewa(Pos, Level, Harga),
    Duit < Harga, player1Property(Prop), Aset is Duit + Prop, Aset >= Harga,
    checkLocationDetail(Pos), nl,
    write('Saldo Anda: '), write(Duit), nl,
    write('Harga sewa: '), write(Harga), nl, nl,
    write('SALDO ANDA KURANG UNTUK MEMBAYAR SEWA!'), nl,
    write('Total aset Anda: '), write(Aset), nl,
    actionsjual, actions(1),
    (D =\= 1, changeTurn;
        (write(''))), !.

actions(_) :-
    /* BAGIAN BUY P2 */
    /* milik orang, BANGKRUT */
    turn(p2), player2Pos(N),
    indeks(Pos, N),
    prop(Pos, Level, Owner), Owner == p1,
    player2Money(Duit), ambilHargaSewa(Pos, Level, Harga),
    Duit < Harga, player2Property(Prop), Aset is Duit + Prop, Aset < Harga,
    checkLocationDetail(Pos), nl,
    write('Saldo Anda: '), write(Duit), nl,
    write('Total aset Anda: '), write(Aset), nl,
    write('Harga sewa: '), write(Harga), nl, nl,
    write('KAMU BANGKRUT :('), nl,
    winsplashX, nl, write('Enter anything to exit.'), nl, write('>>> '),
    read(_), exit.

/* ================ THROW DICE ================ */  
/* World Tour */
throwDice :-
    checkStart,
    turn(p1), player1Pos(N), N =:= 25, player1Money(M), M >= 200,
    write('Player 1 Berada di World Tour!'), nl,
    write('Bayar 200 untuk lakukan World Tour?'), nl, 
    write('1. ya'), nl, write('2. tidak'), nl, validateInput(1,2,X),
    (X =:= 1, worldTourP1, actions(0), !;
    X =:= 2, fail).

throwDice :-
    turn(p2), player2Pos(N), N =:= 25, player2Money(M), M >= 200,
    write('Player 2 Berada di World Tour!'), nl,
    write('Bayar 200 untuk lakukan World Tour?'), nl, 
    write('1. ya'), nl, write('2. tidak'), nl, validateInput(1,2,X),
    (X =:= 1, worldTourP2, actions(0), !;
    X =:= 2, fail).

/* Keluar Penjara (Tebus Uang) P1 */
throwDice :-
    \+ inJailP1(false), 
    turn(p1), tebusP1(true), %write('P1'), 
    retractall(inJailP1(_)), assertz(inJailP1(false)), retractall(tebusP1(_)),
    assertz(tebusP1(false)), initdoubleP1, throwDice, !.

/* Keluar Penjara (Card) P1*/
throwDice :-
    \+ inJailP1(false), 
    turn(p1), getoutcardP1(true), %write('P1'), 
    retractall(inJailP1(_)), assertz(inJailP1(false)), retractall(getoutcardP1(_)),
    assertz(getoutcardP1(false)), initdoubleP1, throwDice, !.

/* Di Penjara P1*/
throwDice :-
    \+ inJailP1(false), tebusP1(false), getoutcardP1(false), write('===MASIH DI PENJARA==='), nl,
    (turn(p1), write('Sekarang giliran pemain 1.')), nl, nl,
    randomDice(X, Y),
    ((X =:= Y, write('Double!'), nl, keluarpenjaraP1, changeTurn, nl), !;
    ( write('Anda di penjara. Posisi tidak berubah'), changeTurn, incr3turnP1, turncounterP1(P1), is3turnP1(P1),  nl)).

/* Keluar Penjara (Tebus Uang) P2 */
throwDice :-
    \+ inJailP2(false), 
    turn(p2), tebusP2(true), %write('P2'),
    retractall(inJailP2(_)), assertz(inJailP2(false)), retractall(tebusP2(_)),
    assertz(tebusP2(false)), initdoubleP2, throwDice, !.

/* Keluar Penjara (Card) P1*/
throwDice :-
    \+ inJailP2(false), 
    turn(p2), getoutcardP2(true), %write('P2'), 
    retractall(inJailP2(_)), assertz(inJailP2(false)), retractall(getoutcardP2(_)),
    assertz(getoutcardP2(false)), initdoubleP2, throwDice, !.

/* Di Penjara P2*/
throwDice :-
    \+ inJailP2(false), tebusP2(false), getoutcardP2(false), write('===MASIH DI PENJARA==='), nl,
    (turn(p2), write('Sekarang giliran pemain 2.')), nl, nl,
    randomDice(X, Y),
    ((X =:= Y, write('Double!'), nl, keluarpenjaraP2, changeTurn, nl), !;
    ( write('Anda di penjara. Posisi tidak berubah'), changeTurn, incr3turnP2, turncounterP2(P2), is3turnP2(P2),  nl)).

/* P1 */
throwDice :-
    inJailP1(false),
    (turn(p1), write('Sekarang giliran pemain 1.')), nl, nl,
    randomDice(X, Y),
    (X =:= Y, write('Double! Jika anda Double 3x, anda akan masuk penjara'), nl, format('Anda maju sebanyak ~d langkah.', [X + Y]), incrdoubleP1;
    (X =\= Y, format('Anda maju sebanyak ~d langkah.', [X + Y]), nl, initdoubleP1;
    (write('')))),

    /* Check Double 3x */
    doublecounterP1(P1),
    (P1 =:= 3 -> nl, write('Nah kan, dibilangin jangan double 3x'), nl, is3doubleP1(P1); write('')),

    inJailP1(Z),
    (Z == false, updatePlayer1Pos(X + Y), isEqual(X,Y,D), actions(D), !;
    (Z == true)).

/* P2 */
throwDice :-
    inJailP2(false),
    (turn(p2), write('Sekarang giliran pemain 2.')), nl, nl,
    randomDice(X, Y), 
    (X =:= Y, write('Double! Jika anda Double 3x, anda akan masuk penjara'), nl, format('Anda maju sebanyak ~d langkah.', [X + Y]), incrdoubleP2;
    (X =\= Y, format('Anda maju sebanyak ~d langkah.', [X + Y]), nl, initdoubleP2;
    (write('')))),
    
    /* Check Double 3x */
    doublecounterP2(P2),
    (P2 =:= 3 -> nl, write('Nah kan, dibilangin jangan double 3x'), nl, is3doubleP2(P2); write('')),
    
    inJailP2(Z),
    (Z == false, updatePlayer2Pos(X + Y), isEqual(X,Y,D), actions(D);
    (Z == true)), !.
    