
taxp1 :- player1Money(Money),
    updatePropertysByProps, 
    player1Property(PropertyVal),
    Taxprice is (0.1*(Money+PropertyVal)), nl,
    write('Saldo awal anda: '),
    write(Money), nl,
    write('Besar pajak: '), format('~g',[Taxprice]), nl,
    (Money >= Taxprice, MoneyNew is Money - Taxprice, 
    
    MoneyNewR is round(MoneyNew),
    nl,
    write('Saldo anda sekarang : '),
    write(MoneyNewR),nl,
    retractall(player1Money(_)),
    assertz(player1Money(MoneyNewR));actionsjual,taxp1(Taxprice)),taxsplash,updatePropertysByProps,!.

taxp1(Taxprice) :- player1Money(Money),
    updatePropertysByProps, 
    nl,
    write('Saldo awal anda: '),
    write(Money), nl,
    write('Besar pajak: '), format('~g',[Taxprice]), nl,
    (Money >= Taxprice, MoneyNew is Money - Taxprice, 
    
    MoneyNewR is round(MoneyNew),
    nl,
    write('Saldo anda sekarang : '),
    write(MoneyNewR),nl,
    retractall(player1Money(_)),
    assertz(player1Money(MoneyNewR));actionsjual,taxp1(Taxprice)),!.


taxp2 :- player2Money(Money),
    updatePropertysByProps, 
    player2Property(PropertyVal),
    Taxprice is (0.1*(Money+PropertyVal)), nl,
    write('Saldo awal anda: '),
    write(Money), nl,
    write('Besar pajak: '), format('~g',[Taxprice]), nl,
    (Money >= Taxprice, MoneyNew is Money - Taxprice, 
    
    MoneyNewR is round(MoneyNew),
    nl,
    write('Saldo anda sekarang : '),
    write(MoneyNewR),nl,nl,
    retractall(player2Money(_)),
    assertz(player2Money(MoneyNewR));actionsjual,taxp2(Taxprice)),taxsplash,updatePropertysByProps,!.

taxp2(Taxprice) :- player2Money(Money),
    updatePropertysByProps, 
    nl,
    write('Saldo awal  anda: '),
    write(Money), nl,
    write('Besar pajak: '), format('~g',[Taxprice]), nl,
    (Money >= Taxprice, MoneyNew is Money - Taxprice, 
    
    MoneyNewR is round(MoneyNew),
    nl,
    write('Saldo anda sekarang : '),
    write(MoneyNewR),nl,nl,
    retractall(player2Money(_)),
    assertz(player2Money(MoneyNewR));actionsjual,taxp2(Taxprice)),!.

taxsplash :-
    nl,nl,                               
    write('        _|_|_|_|_|    _|_|    _|      _|  '),nl,
    write('            _|      _|    _|    _|  _|    '),nl,
    write('            _|      _|_|_|_|      _|      '),nl,
    write('            _|      _|    _|    _|  _|    '),nl,
    write('            _|      _|    _|  _|      _|  '),nl,nl.
                                          
                                          
       


jual(I):- 
    turn(Player),Player == p1,player1Money(Money),indeks(A,I),
    prop(A, X, Player), ambilHargaProperty(A, X, Y),
    % (X =:= 1 -> tanah(A,Y,Z);
    % X =:= 2 -> bangunanSatu(A,Y,Z);
    % X =:= 3 -> bangunanDua(A,Y,Z);
    % X =:= 4 -> bangunanTiga(A,Y,Z);
    % X =:= 5 -> landmark(A,Y,Z)),
    retract(prop(A, X, Player)),
    assertz(prop(A, 0, 0)),
    write('Saldo awal anda : '), write(Money), nl,
    X1 is Y, XX is Money+Y,
    updatePlayer1Money(X1),
    write('Saldo anda sekarang : '), write(XX),nl,nl, !.

jual(I):- 
    turn(Player),Player == p2,player2Money(Money),indeks(A,I),
    prop(A, X, Player), ambilHargaProperty(A, X, Y),
    % (X =:= 1 -> tanah(A,Y,Z);
    % X =:= 2 -> bangunanSatu(A,Y,Z);
    % X =:= 3 -> bangunanDua(A,Y,Z);
    % X =:= 4 -> bangunanTiga(A,Y,Z);
    % X =:= 5 -> landmark(A,Y,Z)),
    retract(prop(A, X, Player)),
    assertz(prop(A, 0, 0)),
    write('Saldo awal anda : '), write(Money), nl,
    X1 is Y, XX is Money+Y,
    updatePlayer2Money(X1),
    write('Saldo anda sekarang : '), write(XX),nl, !.

actionsjual :-
    turn(p1),nl,write('Uang anda tidak cukup, pilih properti untuk dijual : '),nl,
    updatePropertysByProps,listPropertyPlayer1(LIST, LISTNAME, LENPROPERTY),
    printPropertys(LIST,LISTNAME,LENPROPERTY), turn(Player),
    validateInputJ(Player, N),
    jual(N).

actionsjual :-
    turn(p2),nl,write('Uang anda tidak cukup, pilih properti untuk dijual : '),nl,
    updatePropertysByProps,listPropertyPlayer2(LIST, LISTNAME, LENPROPERTY),
    printPropertys(LIST,LISTNAME,LENPROPERTY), turn(Player),
    validateInputJ(Player, N),
    jual(N).


validateInputJ(Player, N) :-
    Player == p1, 
    updatePropertysByProps,listPropertyPlayer1(LIST, _, _),
    nl, write('>> '), read(I),integer(I),
    getElmt(LIST, I, Result),
    indeks(A,Result),
    prop(A,X,P), P == Player, X \== 0,
    N is Result, !.

validateInputJ(Player, N) :-
    Player == p2, 
    updatePropertysByProps,listPropertyPlayer2(LIST, _, _),
    nl, write('>> '), read(I),integer(I),
    getElmt(LIST, I, Result),
    indeks(A,Result),
    prop(A,X,P), P == Player, X \== 0,
    N is Result, !.

validateInputJ(Player, N) :-
    nl, write('Input tidak valid!'), 
    validateInputJ(Player, N), !.