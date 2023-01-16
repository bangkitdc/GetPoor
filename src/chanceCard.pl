:- dynamic(listCardPlayer1/2).
:- dynamic(listCardPlayer2/2).

/* FACT */
randommoney(1,100).
randommoney(2,150).
randommoney(3,200).
randommoney(4,250).
randommoney(5,300).
randommoney(6,350).
randommoney(7,400).
randommoney(8,450).
randommoney(9,500).
randommoney(10,550).
randommoney(11,600).
randommoney(12,650).
randommoney(13,700).
randommoney(14,750).
randommoney(15,800).
randommoney(16,850).
randommoney(17,900).
randommoney(18,950).
randommoney(19,1000).
randommoney(20,1100).
randommoney(21,1200).
randommoney(22,1300).
randommoney(23,1400).
randommoney(24,1500).
randommoney(25,1600).
randommoney(26,1700).
randommoney(27,1800).

/* Initiation Cards */
initCard :-
    assertz(listCardPlayer1([], 0)),
    assertz(listCardPlayer2([], 0)).

/* Chance Card for P1 */
ccP1 :-
    randomCard(X),listCardPlayer1(LIST, _LENLIST),
    insertAtEnd(LIST, X, LISTNEW),
    searchX(LIST, 3, Y),
    (X =:= 1 -> tax1, !;
    (X =:= 2 -> gift1, !;
    (X =:= 3, Y =:= 0 -> getoutJail1, retractall(listCardPlayer1(_,_)),
    lengthList(LISTNEW, YYYY),
    assertz(listCardPlayer1(LISTNEW, YYYY)), !;
    (X =:= 3, Y =:= 1 -> havegetoutJail1,!;
    (X =:= 4 -> gotoJail1, !;
    (X =:= 5 -> gotofreepark1, !;
    (X =:= 6 -> gotofreego2, !;
    (X =:= 7 -> acquirecc1, !)))))))), changeTurn.

/* Tax Card for P1 */
tax1 :-
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN TAX CARD / KARTU PAJAK!'), nl,
    write('Anda diharuskan membayar pajak sejumlah 10% dari total aset yang dimiliki'), nl,
    write('Aset tersebut termasuk uang yang dimiliki'),nl, 
    write('dan semua nilai aset properti yang dimiliki.'), nl,
    listCardPlayer1(LIST, _LEN),
    deleteX(LIST, 1, NOTAX),
    retractall(listCardPlayer1(_, _)),
    lengthList(NOTAX, X),
    assertz(listCardPlayer1(NOTAX, X)),
    nl, write('BERPINDAH KE LOKASI PAJAK SELANJUTNYA!.'), nl,
    player1Pos(N),
    (N =:= 21, updatePlayer1Pos(8), !;
    N =:= 30, updatePlayer1Pos(15), !),
    taxp1, !.

/* Gift Card for P1 */
gift1 :- 
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN GIFT CARD / KARTU HADIAH!'), nl,
    randomMoney(X),
    randommoney(X,Y),
    format('Selamat! Anda mendapatkan uang sejumlah ~d', [Y]),
    listCardPlayer1(LIST, _LEN),
    deleteX(LIST, 2, NOGIFT),
    retractall(listCardPlayer1(_, _)),
    lengthList(NOGIFT, P),
    assertz(listCardPlayer1(NOGIFT, P)), updatePlayer1Money(Y).

/* Get Out From Jail Card for P1 */
havegetoutJail1 :- 
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN GET-OUT-FROM-JAIL CARD / KARTU KELUAR DARI PENJARA!'), nl,
    write('Anda sudah memiliki GET-OUT-FROM-JAIL CARD / KARTU KELUAR DARI PENJARA'), nl,
    write('Anda tidak dapat menyimpan 2 (dua) Chance Card yang sama'), nl.
    % listCardPlayer1(LIST, _LEN),
    % deleteX(LIST, 3, NOGETOUTJAIL),
    % retractall(listCardPlayer1(_, _)),
    % lengthList(NOGETOUTJAIL, P),
    % assertz(listCardPlayer1(NOGETOUTJAIL, P)).

getoutJail1 :- 
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN GET-OUT-FROM-JAIL CARD / KARTU KELUAR DARI PENJARA!'), nl,
    write('Anda dapat menggunakan kartu ini saat berada di dalam penjara'),nl,
    write('untuk langsung keluar tanpa menunggu tiga kali giliran atau membayar denda.'), nl.

/* Go To Jail Card for P1 */
gotoJail1 :- 
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN GO-TO-JAIL CARD / KARTU MASUK PENJARA!'), nl,
    write('Ya, sesuai namanya. Anda masuk penjara!'), nl,
    listCardPlayer1(LIST, _LEN),
    deleteX(LIST, 4, NOJAIL),
    retractall(listCardPlayer1(_, _)),
    lengthList(NOJAIL, P),
    assertz(listCardPlayer1(NOJAIL, P)), jailP1.

/* Go To Free Parking Card for P1 */
gotofreepark1 :- 
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN GO-TO-FREE-PARK CARD'), nl,
    listCardPlayer1(LIST, _LEN),
    deleteX(LIST, 5, NOPARK),
    retractall(listCardPlayer1(_, _)),
    lengthList(NOPARK, P),
    assertz(listCardPlayer1(NOPARK, P)),
    player1Pos(N), 
    (N =:= 21, updatePlayer1Pos(6), !;
    N =:= 30, updatePlayer1Pos(19), !), !.

/* Go To GO Card for P1 */
gotofreego1 :- 
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN GO-TO-GO CARD'), nl,
    listCardPlayer1(LIST, _LEN),
    deleteX(LIST, 5, NOPARK),
    retractall(listCardPlayer1(_, _)),
    lengthList(NOPARK, P),
    assertz(listCardPlayer1(NOPARK, P)),
    player1Pos(N), 
    (N =:= 21, updatePlayer1Pos(11), !;
    N =:= 30, updatePlayer1Pos(2), !), !.

/* Acquire Card for P1 */
acquirecc1 :-
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN SNATCH-PROPERTY CARD / KARTU AMBIL ALIH PROPERTI!'), nl,
    turn(Player), Player == p1, updatePropertysByProps,
    listPropertyPlayer2(LIST, LISTNAME, LENPROPERTY),
    write('Daftar Kepemilikan Properti Player Y: '), nl,
    ((LENPROPERTY =:= 0, write('Kamu kurang beruntung karena Player Y tidak memiliki Properti'), nl, nl, !);
    printPropertys(LIST, LISTNAME, LENPROPERTY), nl, 
    write('Pilih Lokasi yang akan diakuisisi: '), nl, validateInput(1, LENPROPERTY, X),integer(X),
    getElmt(LIST,X,Result), indeks(Pos, Result), prop(Pos, Tingkatan, Player2), Player2 == p2, retract(prop(Pos, Tingkatan, Player2)), asserta(prop(Pos, Tingkatan, Player))), updatePropertysByProps, !.

/* Chance Card for P2 */
ccP2 :-
    randomCard(X),listCardPlayer2(LIST, _LENLIST),
    insertAtEnd(LIST, X, LISTNEW),
    searchX(LIST, 3, Y),
    (X =:= 1 -> tax2, !;
    (X =:= 2 -> gift2, !;
    (X =:= 3, Y =:= 0 -> getoutJail2, retractall(listCardPlayer2(_,_)),
    lengthList(LISTNEW, YYYY),
    assertz(listCardPlayer2(LISTNEW, YYYY)), !;
    (X =:= 3, Y =:= 1 -> havegetoutJail2,!;
    (X =:= 4 -> gotoJail2, !;
    (X =:= 5 -> gotofreepark2, !;
    (X =:= 6 -> gotofreego2, !;
    (X =:= 7 -> acquirecc2, !)))))))), changeTurn.

/* Tax Card for P2 */
tax2 :-
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN TAX CARD / KARTU PAJAK!'), nl,
    write('Anda diharuskan membayar pajak sejumlah 10% dari total aset yang dimiliki'), nl,
    write('Aset tersebut termasuk uang yang dimiliki'),nl, 
    write('dan semua nilai aset properti yang dimiliki.'), nl,
    listCardPlayer2(LIST, _LEN),
    deleteX(LIST, 1, NOTAX),
    retractall(listCardPlayer2(_, _)),
    lengthList(NOTAX, P),
    assertz(listCardPlayer2(NOTAX, P)),
    nl, write('BERPINDAH KE LOKASI PAJAK SELANJUTNYA!.'), nl,
    player2Pos(N),
    (N =:= 21, updatePlayer2Pos(8), !;
    N =:= 30, updatePlayer2Pos(15), !),
    taxp2, !.

/* Gift Card for P2 */
gift2 :- 
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN GIFT CARD / KARTU HADIAH!'), nl,
    randomMoney(X),
    randommoney(X,Y),
    format('Selamat! Anda mendapatkan uang sejumlah ~d', [Y]),
    listCardPlayer2(LIST, _LEN),
    deleteX(LIST, 2, NOGIFT),
    retractall(listCardPlayer2(_, _)),
    lengthList(NOGIFT, P),
    assertz(listCardPlayer2(NOGIFT, P)), updatePlayer2Money(Y).

/* Get Out From Jail Card for P2 */
havegetoutJail2 :- 
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN GET-OUT-FROM-JAIL CARD / KARTU KELUAR DARI PENJARA!'), nl,
    write('Anda sudah memiliki GET-OUT-FROM-JAIL CARD / KARTU KELUAR DARI PENJARA'), nl,
    write('Anda tidak dapat menyimpan 2 (dua) Chance Card yang sama'), nl,
    listCardPlayer2(LIST, _LEN),
    deleteX(LIST, 3, NOGETOUTJAIL),
    retractall(listCardPlayer2(_, _)),
    lengthList(NOGETOUTJAIL, X),
    assertz(listCardPlayer2(NOGETOUTJAIL, X)).

getoutJail2 :- 
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN GET-OUT-FROM-JAIL CARD / KARTU KELUAR DARI PENJARA!'), nl,
    write('Anda dapat menggunakan kartu ini saat berada di dalam penjara'),nl,
    write('untuk langsung keluar tanpa menunggu tiga kali giliran atau membayar denda.'), nl.

/* Go To Jail Card for P2 */
gotoJail2 :- 
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN GO-TO-JAIL CARD / KARTU MASUK PENJARA!'), nl,
    write('Ya, sesuai namanya. Anda masuk penjara!'), nl,
    listCardPlayer2(LIST, _LEN),
    deleteX(LIST, 4, NOJAIL),
    retractall(listCardPlayer2(_, _)),
    lengthList(NOJAIL, X),
    assertz(listCardPlayer2(NOJAIL, X)), jailP2.

/* Go To Free Parking Card for P2 */
gotofreepark2 :- 
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN GO-TO-FREE-PARK CARD'), nl,
    listCardPlayer2(LIST, _LEN),
    deleteX(LIST, 5, NOPARK),
    retractall(listCardPlayer2(_, _)),
    lengthList(NOPARK, P),
    assertz(listCardPlayer2(NOPARK, P)),
    player2Pos(N), 
    (N =:= 21, updatePlayer2Pos(6), !;
    N =:= 30, updatePlayer2Pos(19), !), !.

/* Go To GO Card for P2 */
gotofreego2 :- 
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN GO-TO-GO CARD'), nl,
    listCardPlayer2(LIST, _LEN),
    deleteX(LIST, 6, NOPARK),
    retractall(listCardPlayer2(_, _)),
    lengthList(NOPARK, P),
    assertz(listCardPlayer2(NOPARK, P)),
    player2Pos(N), 
    (N =:= 21, updatePlayer2Pos(11), !;
    N =:= 30, updatePlayer2Pos(2), !), !.

/* Acquire Card for P2 */
acquirecc2 :-
    write('**~~~{} CHANCE CARD }~~~**'),nl,
    write('ANDA MENDAPATKAN SNATCH-PROPERTY CARD / KARTU AMBIL ALIH PROPERTI!'), nl,
    turn(Player2), Player2 == p2, updatePropertysByProps,
    listPropertyPlayer1(LIST, LISTNAME, LENPROPERTY),
    write('Daftar Kepemilikan Properti Player X: '), nl,
    ((LENPROPERTY =:= 0, write('Kamu kurang beruntung karena Player X tidak memiliki Properti'), nl, nl, !);
    printPropertys(LIST, LISTNAME, LENPROPERTY), nl, 
    write('Pilih Lokasi yang akan diakuisisi: '), nl, validateInput(1, LENPROPERTY, X),integer(X),
    getElmt(LIST,X,Result), indeks(Pos, Result), prop(Pos, Tingkatan, Player), Player == p1, retract(prop(Pos, Tingkatan, Player)), asserta(prop(Pos, Tingkatan, Player2))), updatePropertysByProps, !.
