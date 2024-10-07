% Parte 1: Relaciones familiares 
padre(eddard, robb).
padre(eddard, sansa).
madre(catelyn, robb).
madre(catelyn, sansa).
hermano(robb, sansa).
abuelo(rickard, robb).
abuelo(rickard, sansa).
tio(benjen, robb).
tio(benjen, sansa).
primo(jon, robb).
primo(jon, sansa).

% Parte 2: Definimos el nivel de consanguinidad
nivel_consanguinidad(X, Y, 1) :- padre(X, Y).
nivel_consanguinidad(X, Y, 1) :- madre(X, Y).
nivel_consanguinidad(X, Y, 2) :- hermano(X, Y).
nivel_consanguinidad(X, Y, 2) :- abuelo(X, Y).
nivel_consanguinidad(X, Y, 3) :- tio(X, Y).
nivel_consanguinidad(X, Y, 3) :- primo(X, Y).

% Parte 3: Distribución de la herencia
distribuir_herencia(Total, Distribucion) :-
    findall((Herederos, Nivel), nivel_consanguinidad(_, Herederos, Nivel), ListaHerederos),
    contar_herederos_por_nivel(ListaHerederos, Nivel1, Nivel2, Nivel3),
    calcular_porcentaje(Nivel1, Nivel2, Nivel3, PorcentajeNivel1, PorcentajeNivel2, PorcentajeNivel3),
    ajustar_porcentajes([PorcentajeNivel1, PorcentajeNivel2, PorcentajeNivel3], Total, Distribucion).

contar_herederos_por_nivel([], 0, 0, 0).
contar_herederos_por_nivel([(_, 1)|T], Nivel1, Nivel2, Nivel3) :- 
    contar_herederos_por_nivel(T, N1, Nivel2, Nivel3), 
    Nivel1 is N1 + 1.
contar_herederos_por_nivel([(_, 2)|T], Nivel1, Nivel2, Nivel3) :- 
    contar_herederos_por_nivel(T, Nivel1, N2, Nivel3), 
    Nivel2 is N2 + 1.
contar_herederos_por_nivel([(_, 3)|T], Nivel1, Nivel2, Nivel3) :- 
    contar_herederos_por_nivel(T, Nivel1, Nivel2, N3), 
    Nivel3 is N3 + 1.

calcular_porcentaje(Nivel1, Nivel2, Nivel3, PorcentajeNivel1, PorcentajeNivel2, PorcentajeNivel3) :-
    PorcentajeNivel1 is Nivel1 * 30,
    PorcentajeNivel2 is Nivel2 * 20,
    PorcentajeNivel3 is Nivel3 * 10.

ajustar_porcentajes(Porcentajes, Total, Distribucion) :-
    sum_list(Porcentajes, SumaTotal),
    (   SumaTotal =< 100
    ->  calcular_distribucion(Porcentajes, Total, Distribucion)
    ;   FactorAjuste is 100 / SumaTotal,
        maplist({FactorAjuste}/[X, Y]>>(Y is X * FactorAjuste), Porcentajes, PorcentajesAjustados),
        calcular_distribucion(PorcentajesAjustados, Total, Distribucion)
    ).

calcular_distribucion([], _, []).
calcular_distribucion([Porcentaje|T], Total, [(Porcentaje, Monto)|Distribucion]) :-
    Monto is Total * (Porcentaje / 100),
    calcular_distribucion(T, Total, Distribucion).

