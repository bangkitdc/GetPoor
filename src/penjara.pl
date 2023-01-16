% :- include('map.pl').

:- dynamic(inJailP1/1).
:- dynamic(inJailP2/1).
:- dynamic(doublecounterP1/1).
:- dynamic(doublecounterP2/1).
:- dynamic(turncounterP1/1).
:- dynamic(turncounterP2/1).
:- dynamic(tebusP1/1).
:- dynamic(tebusP2/1).
:- dynamic(getoutcardP1/1).
:- dynamic(getoutcardP2/1).

uangtebusan(500).

/* Init Jail Mechanism */
initJail :-
	assertz(inJailP1(false)),
	assertz(inJailP2(false)),
	initdoubleP1,
    init3turnP1,
    initdoubleP2,
    init3turnP2,
	inittebusP1,
	inittebusP2,
	initgetoutcardP1,
	initgetoutcardP2.

inittebusP1 :-
	retractall(tebusP1(_)),
	assertz(tebusP1(false)).

inittebusP2 :-
	retractall(tebusP2(_)),
	assertz(tebusP2(false)).

initgetoutcardP1 :-
	retractall(getoutcardP1(_)),
	assertz(getoutcardP1(false)).

initgetoutcardP2 :-
	retractall(getoutcardP2(_)),
	assertz(getoutcardP2(false)).

/* Perhitungan Dadu Player */
initdoubleP1 :-
	retractall(doublecounterP1(_)),
    assertz(doublecounterP1(0)).

incrdoubleP1 :-
    doublecounterP1(V0),
    retractall(doublecounterP1(_)),
    succ(V0, V),
    assertz(doublecounterP1(V)).

initdoubleP2 :-
	retractall(doublecounterP2(_)),
    assertz(doublecounterP2(0)).

incrdoubleP2 :-
    doublecounterP2(V0),
    retractall(doublecounterP2(_)),
    succ(V0, V),
    assertz(doublecounterP2(V)).

init3turnP1 :-
	retractall(turncounterP1(_)),
    assertz(turncounterP1(0)).

incr3turnP1 :-
    turncounterP1(V0),
    retractall(turncounterP1(_)),
    succ(V0, V),
    assertz(turncounterP1(V)).

init3turnP2 :-
	retractall(turncounterP2(_)),
    assertz(turncounterP2(0)).

incr3turnP2 :-
    turncounterP2(V0),
    retractall(turncounterP2(_)),
    succ(V0, V),
    assertz(turncounterP2(V)).

/* Kondisi Double dan Putaran Penjara Player */
is3doubleP1(3) :-
	(\+inJailP1(_) -> assertz(inJailP1(true));
	retract(inJailP1(_)), assertz(inJailP1(true))), initdoubleP1,
	jailP1, nl.

is3turnP1(3) :-
	retractall(inJailP1(_)), assertz(inJailP1(false)),
	nl, keluarpenjaraP1, nl.

is3doubleP2(3) :-
	(\+inJailP2(_) -> assertz(inJailP2(true));
	retract(inJailP2(_)), assertz(inJailP2(true))), initdoubleP2,
	jailP2, nl.

is3turnP2(3) :-
	retractall(inJailP2(_)), assertz(inJailP2(false)),
	nl, keluarpenjaraP2, nl.

/* Penjara Player */

jailP1 :-
	gotoJailPlayer1, nl, jailsplash, nl,
	write('[-][-][-]= PLAYER 1, ANDA MASUK PENJARA! =[-][-][-]'), nl,
	write('Pilih Cara Keluar Penjara : '),nl,
	write('1. Cara dadu'), nl,
	write('2. Cara tebus uang'), nl,
	write('3. Cara Memakai Kartu Keluar Penjara'), nl,
    write('Masukkan pilihan : '), validateInput(1,3,X),
    (X =:= 1 -> caradadu1, !;
    (X =:= 2 -> tebusuang1, !;
    (X =:= 3 -> kartupenjara1, !))), !.

jailP2 :-
	gotoJailPlayer2, nl, jailsplash, nl,
	write('[-][-][-]= PLAYER 2, ANDA DI PENJARA! =[-][-][-]'), nl,
	write('Pilih Cara Keluar Penjara : '),nl,
	write('1. Cara dadu'), nl,
	write('2. Cara tebus uang'), nl,
	write('3. Cara Memakai Kartu Keluar Penjara'), nl,
    write('Masukkan pilihan : '), validateInput(1,3,X),
    (X =:= 1 -> caradadu2, !;
    (X =:= 2 -> tebusuang2, !;
    (X =:= 3 -> kartupenjara2, !))), !.

keluarpenjaraP1 :-
	gotoJailPlayer1, initdoubleP1, init3turnP1, retractall(inJailP1(_)), assertz(inJailP1(false)),
	nl, write('[|][|][|] ANDA BERHASIL KELUAR PENJARA [|][|][|]'),nl.

keluarpenjaraP2 :-
	gotoJailPlayer2, initdoubleP2, init3turnP2, retractall(inJailP2(_)), assertz(inJailP2(false)),
	nl, write('[|][|][|] ANDA BERHASIL KELUAR PENJARA [|][|][|]'),nl.

keluartebuspenjaraP1 :-
	retractall(inJailP1(_)), assertz(inJailP1(true)), changeTurn,
	retractall(tebusP1(_)), assertz(tebusP1(true)), !.

keluartebuspenjaraP2 :-
	retractall(inJailP2(_)), assertz(inJailP2(true)), changeTurn,
	retractall(tebusP2(_)), assertz(tebusP2(true)), !.

keluarcardP1 :-
	retractall(inJailP1(_)), assertz(inJailP1(true)),
	retractall(getoutcardP1(_)), assertz(getoutcardP1(true)), changeTurn, !.

keluarcardP2 :-
	retractall(inJailP2(_)), assertz(inJailP2(true)),
	retractall(getoutcardP2(_)), assertz(getoutcardP2(true)), changeTurn, !.

caradadu1 :-
	nl, write('[.][:][.] CARA DADU [.][:][.]'), nl,
	nl, write('Jalankan dadu 3x untuk keluar dari penjara'), nl,
	nl, write('Tapi kalo Double, bisa dibicarakan "/'), nl,
	retractall(inJailP1(_)), assertz(inJailP1(true)), changeTurn, !. 

caradadu2 :-
	nl, write('[.][:][.] CARA DADU [.][:][.]'), nl,
	nl, write('Jalankan dadu 3x untuk keluar dari penjara'), nl,
	nl, write('Tapi kalo Double, bisa dibicarakan "/'), nl,
	retractall(inJailP2(_)), assertz(inJailP2(true)), changeTurn, !. 

tebusuang1 :-
	nl, write('[$][$][$] TEBUS UANG PENJARA [$][$][$]'), nl,
	nl, write('Anda telah menyogok polisi untuk keluar dari penjara!'), nl,
    player1Money(Money), uangtebusan(X),
    (Money >= X , updatePlayer1Money(-X),
    keluartebuspenjaraP1);
    write('Uang anda tidak cukup untuk menebus keluar penjara'),nl, jailP1.

tebusuang2 :-
	nl, write('[$][$][$] TEBUS UANG PENJARA [$][$][$]'), nl,
	nl, write('Anda telah menyogok polisi untuk keluar dari penjara!'), nl,
    player2Money(Money), uangtebusan(X),
    (Money >= X , updatePlayer2Money(-X),
    keluartebuspenjaraP2, !);
    write('Uang anda tidak cukup untuk menebus keluar penjara'),nl,jailP2.

kartupenjara1 :-
    nl, write('[o][o][o] MEMAKAI KARTU KELUAR PENJARA [o][o][o]'), nl,
	nl, write('Anda punya orang dalam yang telah membantu anda keluar penjara!'), nl,
	listCardPlayer1(LIST, _), searchX(LIST, 3, Y), 
	(Y =:= 1, keluarcardP1, !);
	write('Anda tidak memiliki GET-OUT-JAIL CARD / KARTU KELUAR PENJARA'),nl, jailP1, !.

kartupenjara2 :-
    nl, write('[o][o][o] MEMAKAI KARTU KELUAR PENJARA [o][o][o]'), nl,
	nl, write('Anda punya orang dalam yang telah membantu anda keluar penjara!'), nl,
	listCardPlayer2(LIST, _), searchX(LIST, 3, Y), 
	(Y =:= 1, keluarcardP2;
	(write('Anda tidak memiliki GET-OUT-JAIL CARD / KARTU KELUAR PENJARA'),nl, jailP2)). 
	