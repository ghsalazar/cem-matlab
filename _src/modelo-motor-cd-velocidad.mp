input boxes;

prologues := 3;
outputformat := "svg";
outputtemplate := "%j-%c.%o";

beginfig(1);

pair entrada;
pair corriente;
pair parDesarrollado;
pair salida;
pair nodo[];

circleit.suma(btex $+$ etex);
boxit.devanado(btex $1\over {L_as + R_a}$ etex);
boxit.par(btex $K_t$ etex);
boxit.rotor(btex $1 \over {Js + B}$ etex);
boxit.generador(btex $-K_v$ etex);

suma.w - entrada = (7mm,0);
devanado.w - suma.e = (7mm,0);
corriente - devanado.e = (7mm,0);
par.w - corriente = (7mm,0);
parDesarrollado - par.e = (7mm,0);
rotor.w - parDesarrollado = (7mm,0);
nodo1 - rotor.e = (7mm,0);
salida - nodo1 = (7mm,0);

par.c - generador.c = nodo1 - nodo2 = suma.c - nodo3 = (0,10mm);

drawboxed(suma,devanado,par,rotor, generador);

label.lft(btex $V_a(s)$ etex, entrada);
label.top(btex $I_a(s)$ etex, corriente);
label.top(btex $T_d(s)$ etex, parDesarrollado);
label.rt(btex $\Omega(s)$ etex, salida);


drawarrow entrada--suma.w;
drawarrow suma.e--devanado.w;
drawarrow devanado.e--par.w;
drawarrow par.e--rotor.w;
drawarrow rotor.e--salida;
drawarrow nodo1--nodo2--generador.e;
drawarrow generador.w--nodo3--suma.s;

pickup pencircle scaled 4pt;
drawdot nodo1;

endfig;

end

