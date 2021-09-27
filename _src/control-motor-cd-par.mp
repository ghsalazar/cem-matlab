input boxes;

prologues := 3;
outputformat := "svg";
outputtemplate := "%j-%c.%o";

beginfig(1);

pair referencia;
pair entrada;
pair salida;
pair nodo[];

circleit.sumaPI(btex $+$ etex);
boxit.PI(btex PI etex);
circleit.suma(btex $+$ etex);
boxit.devanado(btex $1\over {L_as + R_a}$ etex);
boxit.parff(btex $K_t$ etex);
boxit.parfb(btex $K_t$ etex);
boxit.rotorff(btex $1 \over {Js + B}$ etex);
boxit.rotorfb(btex $1 \over {Js + B}$ etex);
boxit.generador(btex $-K_v$ etex);
boxit.negativo(btex $-1$ etex);

%% Feedforward

sumaPI.w - referencia = (7mm,0);
PI.w - sumaPI.e = (7mm,0);
entrada - PI.e = (7mm,0);
suma.w - entrada = (7mm,0);
parff.w - nodo1 = (7mm,0);
rotorff.w - parff.e = (7mm,0);
salida - rotorff.e = (7mm,0);

%% Feedback interno

generador.w - nodo3 = (7mm,0);
rotorfb.w - generador.e = (7mm,0);
parfb.w - rotorfb.e = (7mm,0);
nodo2 - parfb.e = (7mm,0);

%% Feedback PI

%% Resticciones verticales
nodo1 - nodo2 = suma.c - nodo3 = (0,10mm);
devanado.c - rotorfb.c = (0,10mm);
rotorfb.c - negativo.c = (0,10mm);
nodo2 - nodo4 = (0,10mm);
sumaPI.c - nodo5 = (0, 20mm);

drawboxed(sumaPI, PI, suma, devanado, parff, parfb, rotorff, rotorfb, rotorfb, generador, negativo);

label.lft(btex $R$ etex, referencia);
label.top(btex $V_a(s)$ etex, entrada);
label.rt(btex $\Omega(s)$ etex, salida);
dotlabel.top(btex $I_a(s)$ etex, nodo1);

%% Feedforward
drawarrow referencia--sumaPI.w;
drawarrow sumaPI.e--PI.w;
drawarrow PI.e--suma.w;
drawarrow suma.e--devanado.w;
drawarrow devanado.e--parff.w;
drawarrow parff.e--rotorff.w;
drawarrow rotorff.e--salida;

%% Feedback
drawarrow nodo1--nodo2--parfb.e;
drawarrow parfb.w--rotorfb.e;
drawarrow rotorfb.w--generador.e;
drawarrow generador.w--nodo3--suma.s;

%% Feedback PI
drawarrow nodo2--nodo4--negativo.e;
drawarrow negativo.w--nodo5--sumaPI.s;

pickup pencircle scaled 4pt;
drawdot nodo2;

endfig;

end

