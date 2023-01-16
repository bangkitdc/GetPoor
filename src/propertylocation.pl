
/* INDEKS LOKASI */
indeks(go, 1).
indeks(a1, 2).
indeks(a2, 3).
indeks(a3, 4).
indeks(cf, 5).
indeks(b1, 6).
indeks(b2, 7).
indeks(b3, 8).
indeks(jl, 9).
indeks(c1, 10).
indeks(c2, 11).
indeks(c3, 12).
indeks(tx, 13).
indeks(d1, 14).
indeks(d2, 15).
indeks(d3, 16).
indeks(fp, 17).
indeks(e1, 18).
indeks(e2, 19).
indeks(e3, 20).
indeks(cc2, 21).
indeks(f1, 22).
indeks(f2, 23).
indeks(f3, 24).
indeks(wt, 25).
indeks(g1, 26).
indeks(g2, 27).
indeks(g3, 28).
indeks(tx, 29).
indeks(cc3, 30).
indeks(h1, 31).
indeks(h2, 32).


/* DESKRIPSI LOKASI */
lokasi(a1, 'Hanoi', 'Vietnam').
lokasi(a2, 'Kuala Lumpur', 'Malaysia').
lokasi(a3, 'Singapura', 'Singapura').
lokasi(b1, 'Jakarta', 'Indonesia').
lokasi(b2, 'Bangkok', 'Thailand').
lokasi(b3, 'Beijing', 'Republik Rakyat China').
lokasi(c1, 'Tokyo', 'Jepang').
lokasi(c2, 'Seoul', 'Korea Selatan').
lokasi(c3, 'Doha', 'Qatar').
lokasi(d1, 'Ankara', 'Turki').
lokasi(d2, 'Wina', 'Austria').
lokasi(d3, 'Amsterdam', 'Belanda').
lokasi(e1, 'Brussels', 'Belgia').
lokasi(e2, 'London', 'Inggris').
lokasi(e3, 'Berlin', 'Jerman').
lokasi(f1, 'Bern', 'Swiss').
lokasi(f2, 'Paris', 'Perancis').
lokasi(f3, 'Moskow', 'Rusia').
lokasi(g1, 'Roma', 'Italia').
lokasi(g2, 'Sydney', 'Australia').
lokasi(g3, 'Auckland', 'Selandia Baru').
lokasi(h1, 'Ottawa', 'Kanada').
lokasi(h2, 'Washington DC', 'Amerika Serikat').

lokasigo(go, 'GO').
lokasicc(cc, 'Chance Card').
lokasicf(cf, 'Coin Flip').
lokasiwt(wt, 'World Tour').
lokasitax(tx, 'Tax').
lokasijail(jl, 'Jail').
lokasifp(fp, 'Free Park').


/* PROPERTY DETAIL */
/* tanah(X, _harga, _sewa). */
tanah(a1, 150, 45).
tanah(a2, 200, 10000).
tanah(a3, 250, 10000).
tanah(b1, 300, 90).
tanah(b2, 350, 105).
tanah(b3, 400, 120).
tanah(c1, 450, 135).
tanah(c2, 500, 150).
tanah(c3, 550, 165).
tanah(d1, 600, 180).
tanah(d2, 650, 195).
tanah(d3, 700, 210).
tanah(e1, 750, 225).
tanah(e2, 800, 240).
tanah(e3, 850, 255).
tanah(f1, 900, 270).
tanah(f2, 950, 285).
tanah(f3, 1000, 300).
tanah(g1, 1050, 315).
tanah(g2, 1100, 330).
tanah(g3, 1150, 345).
tanah(h1, 1200, 360).
tanah(h2, 80000, 375).

/* bangunanSatu(X, _harga, _sewa). */
bangunanSatu(a1, 1000, 400).
bangunanSatu(a2, 1040, 430).
bangunanSatu(a3, 1080, 460).
bangunanSatu(b1, 1120, 490).
bangunanSatu(b2, 1160, 520).
bangunanSatu(b3, 1200, 550).
bangunanSatu(c1, 1240, 550).
bangunanSatu(c2, 1240, 610).
bangunanSatu(c3, 1280, 640).
bangunanSatu(d1, 1320, 670).
bangunanSatu(d2, 1360, 700).
bangunanSatu(d3, 1400, 730).
bangunanSatu(e1, 1440, 730).
bangunanSatu(e2, 1440, 790).
bangunanSatu(e3, 1480, 720).
bangunanSatu(f1, 1520, 720).
bangunanSatu(f2, 1560, 720).
bangunanSatu(f3, 1600, 850).
bangunanSatu(g1, 1640, 850).
bangunanSatu(g2, 1680, 880).
bangunanSatu(g3, 1680, 880).
bangunanSatu(h1, 1720, 885).
bangunanSatu(h2, 1760, 990).

/* bangunanDua(X, _harga, _sewa). */
bangunanDua(a1, 2000, 550).
bangunanDua(a2, 2050, 555).
bangunanDua(a3, 2100, 560).
bangunanDua(b1, 2150, 565).
bangunanDua(b2, 2200, 570).
bangunanDua(b3, 2250, 575).
bangunanDua(c1, 2300, 580).
bangunanDua(c2, 2300, 580).
bangunanDua(c3, 2350, 685).
bangunanDua(d1, 2400, 690).
bangunanDua(d2, 2450, 605).
bangunanDua(d3, 2500, 620).
bangunanDua(e1, 2550, 725).
bangunanDua(e2, 2550, 725).
bangunanDua(e3, 2600, 730).
bangunanDua(f1, 2600, 830).
bangunanDua(f2, 2650, 835).
bangunanDua(f3, 2650, 835).
bangunanDua(g1, 2650, 935).
bangunanDua(g2, 2700, 1040).
bangunanDua(g3, 2700, 1140).
bangunanDua(h1, 2750, 1145).
bangunanDua(h2, 2800, 1250).

/* bangunanTiga(X, _harga, _sewa). */
bangunanTiga(a1, 3000, 1500).
bangunanTiga(a2, 3050, 1525).
bangunanTiga(a3, 3100, 1550).
bangunanTiga(b1, 3100, 1575).
bangunanTiga(b2, 3150, 1600).
bangunanTiga(b3, 3200, 1625).
bangunanTiga(c1, 3200, 1650).
bangunanTiga(c2, 3250, 1675).
bangunanTiga(c3, 3250, 1700).
bangunanTiga(d1, 3250, 1725).
bangunanTiga(d2, 3300, 1750).
bangunanTiga(d3, 3300, 1775).
bangunanTiga(e1, 3350, 1800).
bangunanTiga(e2, 3350, 1825).
bangunanTiga(e3, 3400, 1850).
bangunanTiga(f1, 3450, 1875).
bangunanTiga(f2, 3450, 1900).
bangunanTiga(f3, 3500, 1925).
bangunanTiga(g1, 3500, 1950).
bangunanTiga(g2, 3550, 1975).
bangunanTiga(g3, 3550, 2000).
bangunanTiga(h1, 3550, 2025).
bangunanTiga(h2, 3600, 2050).

/* Landmark(X, _harga, _sewa). */
landmark(a1, 3000, 2000).
landmark(a2, 3100, 2100).
landmark(a3, 3100, 2100).
landmark(b1, 3100, 2100).
landmark(b2, 3100, 2100).
landmark(b3, 3100, 2100).
landmark(c1, 3200, 2200).
landmark(c2, 3200, 2200).
landmark(c3, 3200, 2200).
landmark(d1, 3300, 2300).
landmark(d2, 3300, 2300).
landmark(d3, 3300, 2300).
landmark(e1, 3300, 2300).
landmark(e2, 3300, 2300).
landmark(e3, 3400, 2400).
landmark(f1, 3400, 2400).
landmark(f2, 3450, 2450).
landmark(f3, 3500, 2500).
landmark(g1, 3500, 2500).
landmark(g2, 3550, 2550).
landmark(g3, 3550, 2550).
landmark(h1, 3600, 2600).
landmark(h2, 3700, 2700).

tingkatan('-', 0).
tingkatan('Tanah', 1).
tingkatan('Bangunan Satu', 2).
tingkatan('Bangunan Dua', 3).
tingkatan('Bangunan Tiga', 4).
tingkatan('Landmark', 5).

player(0, '-').
player(p1, 'Player 1').
player(p2, 'Player 2').

:-dynamic(prop/3).

prop(a1, 0, 0).
prop(a2, 0, 0).
prop(a3, 0, 0).
prop(b1, 0, 0).
prop(b2, 0, 0).
prop(b3, 3, p2).
prop(c1, 3, p2).
prop(c2, 3, p2).
prop(c3, 3, p2).
prop(d1, 0, 0).
prop(d2, 0, 0).
prop(d3, 0, 0).
prop(e1, 0, 0).
prop(e2, 0, 0).
prop(e3, 0, 0).
prop(f1, 0, 0).
prop(f2, 0, 0).
prop(f3, 0, 0).
prop(g1, 0, 0).
prop(g2, 0, 0).
prop(g3, 0, 0).
prop(h1, 3, p2).
prop(h2, 0, 0).

/*player1 beli tanah kosong*/
beli(A) :-
    turn(Player), Player == p1, player1Money(X), tanah(A, Y, _Z), X >= Y,
    prop(A, 0, 0),
    retract(prop(A, 0, 0)), asserta(prop(A, 1, Player)),
    write('Saldo awal anda : '), write(X), nl,
    X1 is -Y, XX is X-Y,
    updatePlayer1Money(X1),
    write('Selamat Anda berhasil membeli tanah seharga '),
    write(Y), write(' dan sisa saldo anda sebesar '), write(XX), updatePropertysByProps, !.

/*player2 beli tanah kosong*/
beli(A) :-
    turn(Player), Player == p2, player2Money(X), tanah(A, Y, _Z), X >= Y,
    prop(A, 0, 0),
    retract(prop(A, 0, 0)), asserta(prop(A, 1, Player)), updatePropertysByProps,
    write('Saldo awal anda : '), write(X), nl,
    X1 is -Y, XX is X-Y,
    updatePlayer2Money(X1),
    write('Selamat Anda berhasil membeli tanah seharga '),
    write(Y), write(' dan sisa saldo anda sebesar '), write(XX), updatePropertysByProps, !.

/*player1 upgrade properti miliknya sendiri*/
upgrade(A) :-
    turn(Player), Player == p1, player1Money(X), prop(A, Tingkatan, Player),
    write('Saldo awal anda : '), write(X), nl,
    ((Tingkatan =:= 1) -> bangunanSatu(A, Y, _Z), write('Selamat Anda berhasil membangun Bangunan Satu seharga ');
    (Tingkatan =:= 2) -> bangunanDua(A, Y, _Z), write('Selamat Anda berhasil membangun Bangunan Dua seharga ');
    (Tingkatan =:= 3) -> bangunanTiga(A, Y, _Z), write('Selamat Anda berhasil membangun Bangunan Tiga seharga ');
    (Tingkatan =:= 4) -> landmark(A, Y, _Z), write('Selamat Anda berhasil membangun Landmark seharga ')),
    X1 is -Y, XX is X-Y, write(Y), nl, updatePlayer1Money(X1),
    write('Saldo anda sekarang : '), write(XX),
    IncTingkatan is Tingkatan+1,
    retract(prop(A, Tingkatan, Player)), asserta(prop(A, IncTingkatan, Player)), updatePropertysByProps, !.

/*player2 upgrade properti miliknya sendiri*/
upgrade(A) :-
    turn(Player), Player == p2, player2Money(X), prop(A, Tingkatan, Player),
    write('Saldo awal anda : '), write(X), nl,
    ((Tingkatan =:= 1) -> bangunanSatu(A, Y, _Z), write('Selamat Anda berhasil membangun Bangunan Satu seharga ');
    (Tingkatan =:= 2) -> bangunanDua(A, Y, _Z), write('Selamat Anda berhasil membangun Bangunan Dua seharga ');
    (Tingkatan =:= 3) -> bangunanTiga(A, Y, _Z), write('Selamat Anda berhasil membangun Bangunan Tiga seharga ');
    (Tingkatan =:= 4) -> landmark(A, Y, _Z), write('Selamat Anda berhasil membangun Landmark seharga ')),
    X1 is -Y, XX is X-Y, write(Y), nl, updatePlayer2Money(X1),
    write('Saldo anda sekarang : '), write(XX),
    IncTingkatan is Tingkatan+1,
    retract(prop(A, Tingkatan, Player)),  asserta(prop(A, IncTingkatan, Player)), updatePropertysByProps, !.

ambilHargaUpgrade(Pos, Lv, Harga) :-
    ((Lv =:= 1) -> bangunanSatu(Pos, Y, _Z);
    (Lv =:= 2) -> bangunanDua(Pos, Y, _Z);
    (Lv =:= 3) -> bangunanTiga(Pos, Y, _Z);
    (Lv =:= 4) -> landmark(Pos, Y, _Z)), Harga is Y.



/*Ini kalo player1 mau upgrade lebih dari 1 tingkatan*/
upgradeJump(Pos, Level) :-
    turn(Player), Player == p1, player1Money(X), prop(Pos, Tingkatan, _),
    retract(prop(Pos, Tingkatan, _)), asserta(prop(Pos, Level, Player)),
    write('Saldo awal anda : '), write(X), nl,
    Selisih is Level-Tingkatan,
    ((Level =:= 1) -> tanah(Pos, Harga, Sewa), write('Selamat Anda berhasil membangun Tanah seharga ');
    (Level =:= 2) -> bangunanSatu(Pos, Harga, Sewa), write('Selamat Anda berhasil membangun Bangunan Satu seharga ');
    (Level =:= 3) -> bangunanDua(Pos, Harga, Sewa), write('Selamat Anda berhasil membangun Bangunan Dua seharga ');
    (Level =:= 4) -> bangunanTiga(Pos, Harga, Sewa), write('Selamat Anda berhasil membangun Bangunan Tiga seharga ')),
    ((Selisih =:= 1) -> B is (1.0*Harga);
    (Selisih =:= 2) -> B is (1.45*Harga);
    (Selisih =:= 3) -> B is (1.9*Harga);
    (Selisih =:= 4) -> B1 is (1.9*Harga), B is B1+10.0),
    Bayar is round(B),
    X1 is -Bayar, XX is X-Bayar, write(Bayar), nl, updatePlayer1Money(X1),
    write('Saldo anda sekarang : '), write(XX), updatePropertysByProps, !.

/*Ini kalo player2 mau upgrade lebih dari 1 tingkatan*/
upgradeJump(Pos, Level) :-
    turn(Player2), Player2 == p2, player2Money(X), prop(Pos, Tingkatan, _),
    retract(prop(Pos, Tingkatan, _)), asserta(prop(Pos, Level, Player2)),
    write('Saldo awal anda : '), write(X), nl,
    Selisih is Level-Tingkatan,
    ((Level =:= 1) -> tanah(Pos, Harga, Sewa), write('Selamat Anda berhasil membangun Tanah seharga ');
    (Level =:= 2) -> bangunanSatu(Pos, Harga, Sewa), write('Selamat Anda berhasil membangun Bangunan Satu seharga ');
    (Level =:= 3) -> bangunanDua(Pos, Harga, Sewa), write('Selamat Anda berhasil membangun Bangunan Dua seharga ');
    (Level =:= 4) -> bangunanTiga(Pos, Harga, Sewa), write('Selamat Anda berhasil membangun Bangunan Tiga seharga ')),
    ((Selisih =:= 1) -> B is (1.0*Harga);
    (Selisih =:= 2) -> B is (1.45*Harga);
    (Selisih =:= 3) -> B is (1.9*Harga);
    (Selisih =:= 4) -> B1 is (1.9*Harga), B is B1+10.0),
    Bayar is round(B),
    X1 is -Bayar, XX is X-Bayar, write(Bayar), nl, updatePlayer2Money(X1),
    write('Saldo anda sekarang : '), write(XX), updatePropertysByProps, !.

/*player1 sewa properti player2 */
sewa(A) :-
    turn(Player), Player == p1, prop(A, Status, Player2), Player2 == p2, player1Money(SaldoAwal),
    ((Status =:= 1) -> tanah(A, _, SewaTanah), X is -SewaTanah, updatePlayer1Money(X), updatePlayer2Money(SewaTanah);
    (Status =:= 2) -> bangunanSatu(A, _, SewaB1), X is -SewaB1, updatePlayer1Money(X), updatePlayer2Money(SewaB1);
    (Status =:= 3) -> bangunanDua(A, _, SewaB2), X is -SewaB2, updatePlayer1Money(X), updatePlayer2Money(SewaB2);
    (Status =:= 4) -> bangunanTiga(A, _, SewaB3), X is -SewaB3, updatePlayer1Money(X), updatePlayer2Money(SewaB3);
    (Status =:= 5) -> landmark(A, _, SewaL), X is -SewaL, updatePlayer1Money(X), updatePlayer2Money(SewaL)),
    player1Money(SaldoAkhir),
    write('Kamu memasuki wilayah Player 2, Bayar dulu sewanya :D'), nl,
    write('Saldo awal anda : '), write(SaldoAwal), nl,
    write('Saldo anda sekarang : '), write(SaldoAkhir), nl, updatePropertysByProps, !.

/*player2 sewa properti player1 */
sewa(A) :-
    turn(Player2), Player2 == p2, prop(A, Status, Player), Player == p1, player2Money(SaldoAwal),
    ((Status =:= 1) -> tanah(A, _, SewaTanah), X is -SewaTanah, updatePlayer2Money(X), updatePlayer1Money(SewaTanah);
    (Status =:= 2) -> bangunanSatu(A, _, SewaB1), X is -SewaB1, updatePlayer2Money(X), updatePlayer1Money(SewaB1);
    (Status =:= 3) -> bangunanDua(A, _, SewaB2), X is -SewaB2, updatePlayer2Money(X), updatePlayer1Money(SewaB2);
    (Status =:= 4) -> bangunanTiga(A, _, SewaB3), X is -SewaB3, updatePlayer2Money(X), updatePlayer1Money(SewaB3);
    (Status =:= 5) -> landmark(A, _, SewaL), X is -SewaL, updatePlayer2Money(X), updatePlayer1Money(SewaL)),
    player2Money(SaldoAkhir),
    write('Kamu memasuki wilayah Player 1, Bayar dulu sewanya :D'), nl,
    write('Saldo awal anda : '), write(SaldoAwal), nl,
    write('Saldo anda sekarang : '), write(SaldoAkhir), nl, updatePropertysByProps, !.

ambilHargaSewa(Pos, Lv, Harga) :-
    ((Lv =:= 1) -> tanah(Pos, _, X);
    (Lv =:= 2) -> bangunanSatu(Pos, _, X);
    (Lv =:= 3) -> bangunanDua(Pos, _, X);
    (Lv =:= 4) -> bangunanTiga(Pos, _, X);
    (Lv =:= 5) -> landmark(Pos, _, X)), Harga is X.

ambilHargaProperty(Pos, Lv, Harga) :-
    ((Lv =:= 1) -> tanah(Pos, X, _);
    (Lv =:= 2) -> bangunanSatu(Pos, X, _);
    (Lv =:= 3) -> bangunanDua(Pos, X, _);
    (Lv =:= 4) -> bangunanTiga(Pos, X, _);
    (Lv =:= 5) -> landmark(Pos, X, _)), Harga is X.
    

/*player1 ambil alih properti player2 */
acquire(A) :-
    turn(Player), Player == p1, prop(A, Status, Player2), Player2 == p2, player1Money(SaldoAwal), indeks(A, Angka), mapPos(Angka, Map),
    ((Status =:= 1) -> tanah(A, BeliTanah, _), X is -BeliTanah, updatePlayer1Money(X), updatePlayer2Money(BeliTanah);
    (Status =:= 2) -> bangunanSatu(A, BeliB1, _), X is -BeliB1, updatePlayer1Money(X), updatePlayer2Money(BeliB1);
    (Status =:= 3) -> bangunanDua(A, BeliB2, _), X is -BeliB2, updatePlayer1Money(X), updatePlayer2Money(BeliB2);
    (Status =:= 4) -> bangunanTiga(A, BeliB3, _), X is -BeliB3, updatePlayer1Money(X), updatePlayer2Money(BeliB3);
    (Status =:= 5) -> write('Tidak dapat meng-acquire Landmark ):')), retract(prop(A, Status, Player2)), assertz(prop(A, Status, Player)),
    player1Money(SaldoAkhir),
    write('Kamu telah mengambil alih wilayah '), write(Map), nl,
    write('Saldo awal anda : '), write(SaldoAwal), nl,
    write('Saldo anda sekarang : '), write(SaldoAkhir), nl, updatePropertysByProps, !.

/*player2 ambil alih properti player1 */
acquire(A) :-
    turn(Player2), Player2 == p2, prop(A, Status, Player), Player == p1, player2Money(SaldoAwal), indeks(A, Angka), mapPos(Angka, Map),
    ((Status =:= 1) -> tanah(A, BeliTanah, _), X is -BeliTanah, updatePlayer2Money(X), updatePlayer1Money(BeliTanah);
    (Status =:= 2) -> bangunanSatu(A, BeliB1, _), X is -BeliB1, updatePlayer2Money(X), updatePlayer1Money(BeliB1);
    (Status =:= 3) -> bangunanDua(A, BeliB2, _), X is -BeliB2, updatePlayer2Money(X), updatePlayer1Money(BeliB2);
    (Status =:= 4) -> bangunanTiga(A, BeliB3, _), X is -BeliB3, updatePlayer2Money(X), updatePlayer1Money(BeliB3);
    (Status =:= 5) -> write('Tidak dapat meng-acquire Landmark ):')), retract(prop(A, Status, Player)), assertz(prop(A, Status, Player2)),
    player2Money(SaldoAkhir),
    write('Kamu telah mengambil alih wilayah '), write(Map), nl,
    write('Saldo awal anda : '), write(SaldoAwal), nl,
    write('Saldo anda sekarang : '), write(SaldoAkhir), nl, updatePropertysByProps, !.

/*cek status*/
status(A) :-
    prop(A, B, P),
    ((B =:= 1) -> write('Status lokasi '), write(A), write(' berupa tanah milik pemain ');
    (B =:= 2) -> write('Status lokasi '), write(A), write(' berupa Bangunan Satu milik pemain ');
    (B =:= 3) -> write('Status lokasi '), write(A), write(' berupa Bangunan Dua milik pemain ');
    (B =:= 4) -> write('Status lokasi '), write(A), write(' berupa Bangunan Tiga milik pemain ');
    (B =:= 5) -> write('Status lokasi '), write(A), write(' berupa Landmark milik pemain ');
    (B =:= 0) ->  write('Status lokasi '), write(A), write(B)),
    write(P), !.

/* Output deskripsi negara */
outputnegara(X, Y):-
    nl, write('Nama lokasi           :   '), write(X),
    nl, write('Deskripsi lokasi      :   Ibukota '), write(Y), nl.

/* CHECK PROPERTY */
checkPropertyDetail(X):-
    initializedGame(true),
    (lokasi(X, _loc, _country),
    tanah(X, _hargaT, _sewaT),
    bangunanSatu(X, _hargaB1, _sewaB1),
    bangunanDua(X, _hargaB2, _sewaB2),
    bangunanTiga(X, _hargaB3, _sewaB3),
    landmark(X, _hargaL, _sewaL),
    nl, write('==================== DETAIL PROPERTI ===================='), nl,
    outputnegara(_loc, _country),
    nl, write('Harga tanah           :   '), write(_hargaT),
    nl, write('Harga bangunan 1      :   '), write(_hargaB1),
    nl, write('Harga bangunan 2      :   '), write(_hargaB2),
    nl, write('Harga bangunan 3      :   '), write(_hargaB3),
    nl, write('Harga landmark        :   '), write(_hargaL), nl,
    nl, write('Biaya Sewa tanah      :   '), write(_sewaT),
    nl, write('Biaya Sewa bangunan 1 :   '), write(_sewaB1),
    nl, write('Biaya Sewa bangunan 2 :   '), write(_sewaB2),
    nl, write('Biaya Sewa bangunan 3 :   '), write(_sewaB3),
    nl, write('Biaya Sewa landmark   :   '), write(_sewaL),
    nl, nl, write('========================================================='),!).

/* Kalau Input Salah */
checkPropertyDetail(X):-
    checkStart,
    (\+ lokasi(X, _loc, _country),
    nl, write('Sayangnya, '), write(X),
    write(' bukan properti yang valid.'),
    nl, write('Silahkan masukkan properti yang benar ya ^~^'), nl, !).
    
/* CHECK LOCATION */
checkLocationDetail(X) :-
    initializedGame(true),
    lokasi(X, _loc, _country),
    nl, write('===================== DETAIL LOKASI ====================='), nl,
    outputnegara(_loc, _country),
    prop(X, Tingkatan, Y), tingkatan(Jenis, Tingkatan), player(Y, Player),
    ((Tingkatan =:= 1) -> tanah(X, J, K);
    (Tingkatan =:= 2) -> bangunanSatu(X, J, K);
    (Tingkatan =:= 3) -> bangunanDua(X, J, K);
    (Tingkatan =:= 4) -> bangunanTiga(X, J, K);
    (Tingkatan =:= 5) -> landmark(X, J, K);
    (Tingkatan =:= 0) ->  tingkatan(J, Tingkatan), tingkatan(K, Tingkatan)),
    nl, write('Kepemilikan           :   '), write(Player),
    nl, write('Biaya Sewa Saat Ini   :   '), write(K),
    nl, write('Biaya Akuisisi        :   '), write(J),
    nl, write('Tingkatan Properti    :   '), write(Jenis),
    nl, nl, write('========================================================='), !.

/* check Lokasi Chance Card */
checkLocationDetail(X):-
    initializedGame(true),
    lokasicc(X, _locCC),
    nl, write('===================== DETAIL LOKASI ====================='), nl,
    nl, write('Nama lokasi           :   '), write(_locCC),
    nl, write('Deskripsi lokasi      :   Apakah Anda sedang merasa beruntung?'),
    nl, write('Disinilah tempatnya! Anda berhak mendapatkan salah satu dari'),
    nl, write('kartu di bawah ini ^~^ :'), nl, 
    nl, write('1. TAX CARD                  Kartu bayar pajak 10%'),
    nl, write('2. GIFT CARD                 Kartu hadiah uang'),
    nl, write('3. GET-OUT-FROM-JAIL CARD    Kartu keluar penjara'),
    nl, write('4. GO_TO_JAIL CARD           Kartu masuk penjara'),
    nl, write('5. GO_TO_FREE-PARK CARD      Kartu pergi menuju Free Park'),
    nl, write('6. GO_TO_GO CARD             Kartu pergi menuju GO'),
    nl, write('7. SNATCH_PROPERTY CARD      Kartu ambil alih properti'),
    nl, nl, write('========================================================='), !.

/* check Lokasi World Tour */
checkLocationDetail(X):-
    initializedGame(true),
    lokasiwt(X, _locWT),
    nl, write('======================DETAIL LOKASI======================'), nl,
    nl, write('Nama lokasi           :   '), write(_locWT),
    nl, write('Deskripsi lokasi      :   Anda dapat berpindah kemana saja,'),
    nl, write('tentunya dengan membayar uang sebesar 200.'),
    nl, nl, write('========================================================='), !.

/* check Lokasi Coin Flip */
checkLocationDetail(X):-
    initializedGame(true),
    lokasicf(X, _locCF),
    nl, write('======================DETAIL LOKASI======================'), nl,
    nl, write('Nama lokasi           :   '), write(_locCF),
    nl, write('Deskripsi lokasi      :   Dapatkan Jackpot dengan bermain coin flip'),
    nl, nl, write('========================================================='), !.

/* check Lokasi Free Parkir */
checkLocationDetail(X):-
    lokasifp(X, _locFP),
    nl, write('======================DETAIL LOKASI======================'), nl,
    nl, write('Nama lokasi           :   '), write(_locFP),
    nl, write('Deskripsi lokasi      :   Lokasi bebas biaya!'),
    nl, nl, write('========================================================='), !.

/* check Lokasi Tax */
checkLocationDetail(X):-
    lokasitax(X, _locTax),
    nl, write('======================DETAIL LOKASI======================'), nl,
    nl, write('Nama lokasi           :   '), write(_locTax),
    nl, write('Deskripsi lokasi      :   Anda wajib membayar 10% dari '),
    nl, write('total aset yang anda miliki.'),
    nl, nl, write('========================================================='), !.

/* check Lokasi Jail */
checkLocationDetail(X):-
    lokasijail(X, _locJail),
    nl, write('======================DETAIL LOKASI======================'), nl,
    nl, write('Nama lokasi           :   '), write(_locJail),
    nl, write('Deskripsi lokasi      :   Lokasi dimana player tidak dapat '),
    nl, write('keluar selama 3 kali putaran, kecuali mendapatkan double dadu'),
    nl, write('bayar uang tebus, atau menggunakan Get-Out-From-Jail CARD.'),
    nl, nl, write('========================================================='), !.

/* check Lokasi Tax */
checkLocationDetail(X):-
    lokasigo(X, _locGo),
    nl, write('======================DETAIL LOKASI======================'), nl,
    nl, write('Nama lokasi           :   '), write(_locGo),
    nl, write('Deskripsi lokasi      :   Anda dapat mengupgrade properti '),
    nl, write('yang anda miliki dari GO. Anda juga mendapatkan saldo 1000'),
    nl, write('ketika melewati GO.'),
    nl, nl, write('========================================================='), !.


/* Kalau Input Salah */  
checkLocationDetail(X) :-
    checkStart,
    (\+ lokasi(X, _loc, _country),
    \+ lokasicc(X, _locCC),
    \+ lokasiwt(X, _locWT),
    \+ lokasicf(X, _locCF),
    \+ lokasifp(X, _locFP),
    \+ lokasitax(X, _locTax),
    \+ lokasijail(X, _locJail),
    nl, write('Sayangnya, '), write(X),
    write(' bukan lokasi yang valid.'),
    nl, write('Silahkan masukkan lokasi yang benar ya ^~^'), nl, !).
