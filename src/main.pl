:- include('map.pl').
:- include('propertylocation.pl').
:- include('utility.pl').
:- include('gameplay.pl').
:- include('penjara.pl').
:- include('player.pl').
:- include('worldTour.pl').
:- include('perpajakan.pl').
:- include('chanceCard.pl').
:- include('parkirGratis.pl').
:- include('coinflip.pl').
:- include('bangkrut.pl').

/* START */
start :-
    (initializedGame(true), nl, write('Game sudah start! Ketik `help` untuk melihat command yang tersedia!'), nl, !);
    (\+ initializedGame(true), 
    intro,
    help,
    gameDesc,
    initGame,
    initPlayer,
    initMap
    ), !.

/* INTRO */
intro :-
    nl,
    write('=========================== WELCOME PLAYER =============================='), nl,
    write('                      SELAMAT DATANG DI GETPOOR !!!                      '), nl, nl.

/* HELP */
help :-
    write('========================================================================='), nl,
    write('||                             ~COMMANDS~                              ||'), nl,
    write('||                                                                     ||'), nl,
    write('|| 1. map                     : Display map GetPoor.                   ||'), nl,
    write('|| 2. throwDice               : Melempar dadu, bergerak memutari map.  ||'), nl,
    write('|| 3. checkPlayerDetail(p)    : p -> player(x/y), detail player.       ||'), nl,
    write('|| 4. checkLocationDetail(l)  : l -> lokasi(a1/..), detail lokasi.     ||'), nl,
    write('|| 5. checkPropertyDetail(l)  : l -> lokasi(a1/..), detail properti.   ||'), nl,
    write('|| 6. help                    : Melihat available commands.            ||'), nl,
    write('|| 7. exit                    : Keluar dari permainan GetPoor.         ||'), nl,
    write('========================================================================='), nl, nl,
    write('============================= DISCLAIMER ================================'), nl,
    write('                 AKHIRI SEMUA PERINTAH DENGAN TITIK YA ><                '), nl, nl.

/* GAME DESCRIPTION */
gameDesc :-
    write('========================================================================='), nl,
    write('||                              ~GAME DESC~                            ||'), nl,
    write('||                                                                     ||'), nl,
    write('|| 1. GO   : Tempat pemain memulai permainan dan setiap melewati akan  ||'), nl,
    write('||           mendapat uang, jika berhenti di sini pemain bisa upgrade  ||'), nl,
    write('||           bangunan yang dia punya.                                  ||'), nl,
    write('|| 2. CC   : Tempat pemain mendapatkan `Chance Card`.                  ||'), nl,
    write('|| 3. CF   : Tempat pemain bermain Coin Flip.                          ||'), nl,
    write('|| 4. JL   : Tempat pemain dihukum (Jail) karena hoki (3x Double) atau ||'), nl,
    write('||           karena tidak hoki (dapet Chance Card).                    ||'), nl,
    write('|| 5. TX   : Pemain harus membayar pajak (Tax) jika berhenti di sini.  ||'), nl,
    write('|| 6. FP   : Parkir gratis, tempat gabut.                              ||'), nl,
    write('|| 7. WT   : Tempat pemain liburan gratis, bisa pergi kemana saja.     ||'), nl,
    write('|| 8. Sisa : Properti yang dapat dibeli oleh pemain.                   ||'), nl,
    write('========================================================================='), nl, nl,
    write('                     SELAMAT BERMAIN, SEMOGA HOKI !!!                    '), nl.

/* EXIT */
exit :-
    (initializedGame(true), retractall(initializedGame(true)), 
    write('========================== THANK YOU PLAYER ============================='), nl,
    write('                 SAMPAI JUMPA, JANGAN LUPA MAIN LAGI !!!                 '), nl, nl,
    halt(0), !); 
    (\+ initializedGame(true), nl, print('Silahkan `start.` terlebih dahulu!'), nl, fail).

/* CHECK START */
checkStart :-
    (initializedGame(true), write(''));
    (\+ initializedGame(true), nl, print('Silahkan `start.` terlebih dahulu!'), nl, fail).

:- initialization(start).