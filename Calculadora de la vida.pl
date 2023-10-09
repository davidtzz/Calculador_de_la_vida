mesada(160000).
herencia_familiar(1000000).
mesa_de_jubilacion(1000000).
salario(2500000).
emprendimiento(2000000).
pareja(-500000).
hijos(-800000).

calcular_dinero(Anio, DineroTotal) :-
    (Anio >=10, Anio=<21 -> mesada(Mesada); Mesada is 0),
    herencia_familiar(Herencia),
    (Anio >=57, Anio=<80 -> mesa_de_jubilacion(Gobierno); Gobierno is 0),
    (Anio >=22, Anio=<56 -> salario(Salario); Salario is 0),
    (Anio >=24, Anio=<80 -> emprendimiento(Emprendimiento); Emprendimiento is 0),
    (Anio >=25, Anio=<80 -> pareja(Pareja); Pareja is 0), %Suponiendo que nunca hubo separación
    (Anio >= 30, Anio =< 52 -> hijos(Hijos); Hijos is 0),
    % Calcular el dinero total para el año específico
    DineroTotal is (Mesada + (Herencia/12) + Gobierno + Salario + Emprendimiento + Pareja + Hijos),
    % Imprimir el resultado
    write('Dinero obtenido por mes para el año '), write(Anio), write(': '), write(DineroTotal), nl.

calcular_dinero_para_todos_los_anios :-
    between(1, 80, Anio),
    calcular_dinero(Anio, DineroTotal),
    fail.
?- calcular_dinero_para_todos_los_anios.

