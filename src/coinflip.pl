/* Coin Flip Splash */
coinflipMsg :- 
    write('====================== COIN FLIP ======================'), nl,
    write('    Tebak hasil coin flip untuk dapatkan hadiah!'), nl,
    write('1x Benar -> 1000 ; 2x Benar -> 3000 ; 3x Benar -> 6000'), nl,
    write('======================================================='), nl, nl.

/* Coin Flip for P1 */
coinflip(Round, Hadiah) :-
    turn(p1), nl,
    (Round =:= 1, coinflipMsg; Round =\= 1, write('')),
    format('                       RONDE ~d', [Round]), nl,
    write('             1. Head  2. Tail  3. Keluar'), nl,
    validateInput(1,3,X), real_time(T), Y is (T mod 2) + 1,
    (Y =:= 1, X =\= 3, write('                       HEAD!'), nl;
    Y =:= 2, X =\= 3, write('                       TAIL!'), nl;
    X =:= 3, write('')),
    (X =:= Y, 
        NewHadiah is Hadiah + (Round * 1000), nl,
        write('Dapet Hadiah sebesar '), write(NewHadiah), write('!'), nl,
        (Round < 3, 
            write('Lanjut? Kalo salah hadiahnya bakal ilang lohh~'), nl,
            NewRound is Round + 1, coinflip(NewRound, NewHadiah);
        Round =:= 3, 
            updatePlayer1Money(NewHadiah));
    X =:= 3,
        nl, write('Dapet Hadiah sebesar '), write(Hadiah), nl,
        updatePlayer1Money(Hadiah);
    X =\= 3, X =\= Y,
        nl, write('Yah gadapet hadiah :('), nl), !.

/* Coin Flip for P2 */
coinflip(Round, Hadiah) :-
    turn(p2), nl,
    (Round =:= 1, coinflipMsg; Round =\= 1, write('')),
    format('                       RONDE ~d', [Round]), nl,
    write('             1. Head  2. Tail  3. Keluar'), nl,
    validateInput(1,3,X), real_time(T), Y is (T mod 2) + 1,
    (Y =:= 1, X =\= 3, write('                       HEAD!'), nl;
    Y =:= 2, X =\= 3, write('                       TAIL!'), nl;
    X =:= 3, write('')),
    (X =:= Y, 
        NewHadiah is Hadiah + (Round * 1000), nl,
        write('Dapet Hadiah sebesar '), write(NewHadiah), write('!'), nl,
        (Round < 3, 
            write('Lanjut? Kalo salah hadiahnya bakal ilang lohh~'), nl,
            NewRound is Round + 1, coinflip(NewRound, NewHadiah);
        Round =:= 3, 
            updatePlayer2Money(NewHadiah));
    X =:= 3,
        nl, write('Dapet Hadiah sebesar '), write(Hadiah), nl,
        updatePlayer2Money(Hadiah);
    X =\= 3, X =\= Y,
        nl, write('Yah gadapet hadiah :('), nl), !.
