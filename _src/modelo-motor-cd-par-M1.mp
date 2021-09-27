input boxes;

prologues := 3;
outputformat := "svg";
outputtemplate := "%j-%c.%o";

beginfig(1);


%% Feedforward

pair entrada;
pair salida;
pair corriente;
pair nodo[];

circleit.suma(btex $+$ etex);
boxit.devanado(btex $1\over {L_as + R_a}$ etex);

suma.w - entrada = (7mm,0);
corriente - nodo1 = (7mm,0);

%% Feedback

boxit.generador(btex $-K_v$ etex);
boxit.parfb(btex $K_t$ etex);
boxit.rotorfb(btex $1 \over {Js + B}$ etex);

nodo1 - nodo2 = (0,10mm);
suma.c - nodo3 = (0,10mm);
devanado.c - rotorfb.c = (0,10mm);

generador.w - nodo3 = (7mm,0);
rotorfb.w - generador.e = (7mm,0);
parfb.w - rotorfb.e = (7mm,0);
nodo2 - parfb.e = (7mm,0);


drawboxed(suma, devanado, parfb, rotorfb, rotorfb, generador);

label.lft(btex $V_a(s)$ etex, entrada);
label.rt(btex $I_a(s)$ etex, corriente);

%% Feedforward
drawarrow entrada--suma.w;
drawarrow suma.e--devanado.w;
drawarrow devanado.e--corriente;

%% Feedback
drawarrow nodo1--nodo2--parfb.e;
drawarrow parfb.w--rotorfb.e;
drawarrow rotorfb.w--generador.e;
drawarrow generador.w--nodo3--suma.s;

pickup pencircle scaled 4pt;
drawdot nodo1;

endfig;

end

