destinationDisplay :-
    write('Destinasi:'), nl,
    write(' 1. GO    2. A1    3. A2    4. A3'), nl,
    write(' 5. CF    6. B1    7. B2    8. B3'), nl,
    write(' 9. JL   10. C1   11. C2   12. C3'), nl,
    write('13. TX   14. D1   15. D2   16. D3'), nl,
    write('17. FP   18. E1   19. E2   20. E3'), nl,
    write('21. CC   22. F1   23. F2   24. F3'), nl,
    write('25. WT   26. G1   27. G2   28. G3'), nl,
    write('29. TX   30. CC   31. H1   32. H2'), nl.


worldTourP1 :-
    map, nl,
    destinationDisplay,
    write('Masukkan destinasi tujuan!'), validateInput(1,32,X),
    Idx is (X + 7) mod 32,
    updatePlayer1Pos(Idx), updatePlayer1Money(-200), !.
    % retractall(player1Pos(_)),
    % dest(X, K), indeks(K, NewPos), updateNewPos(NewPos, N, 1),
    % assertz(player1Pos(N)).

worldTourP2 :-
    map, nl,
    destinationDisplay,
    write('Masukkan destinasi tujuan!'), validateInput(1,32,X),
    Idx is (X + 7) mod 32,
    updatePlayer2Pos(Idx), updatePlayer2Money(-200), !.
    % retractall(player2Pos(_)),
    % dest(X, K), indeks(K, NewPos), updateNewPos(NewPos, N, 2),
    % assertz(player2Pos(N)).
