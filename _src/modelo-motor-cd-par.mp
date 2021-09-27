input boxes;

prologues := 3;
outputformat := "svg";
outputtemplate := "%j-%c.%o";

beginfig(1);

pair entrada;
pair salida;
pair nodo[];

circleit.suma(btex $+$ etex);
boxit.devanado(btex $1\over {L_as + R_a}$ etex);
boxit.parff(btex $K_t$ etex);
boxit.parfb(btex $K_t$ etex);
boxit.rotorff(btex $1 \over {Js + B}$ etex);
boxit.rotorfb(btex $1 \over {Js + B}$ etex);
boxit.generador(btex $-K_v$ etex);

%% Feedforward

suma.w - entrada = (7mm,0);
%devanado.w - suma.e = (14mm,0);
%nodo1 - devanado.e = (14mm,0);
parff.w - nodo1 = (7mm,0);
rotorff.w - parff.e = (7mm,0);
salida - rotorff.e = (7mm,0);

nodo1 - nodo2 = suma.c - nodo3 = (0,10mm);
devanado.c - rotorfb.c = (0,10mm);

%% Feedback

generador.w - nodo3 = (7mm,0);
rotorfb.w - generador.e = (7mm,0);
parfb.w - rotorfb.e = (7mm,0);
nodo2 - parfb.e = (7mm,0);


drawboxed(suma, devanado, parff, parfb, rotorff, rotorfb, rotorfb, generador);

label.lft(btex $V_a(s)$ etex, entrada);
label.rt(btex $\Omega(s)$ etex, salida);
dotlabel.top(btex $I_a(s)$ etex, nodo1);

%% Feedforward
drawarrow entrada--suma.w;
drawarrow suma.e--devanado.w;
drawarrow devanado.e--parff.w;
drawarrow parff.e--rotorff.w;
drawarrow rotorff.e--salida;

%% Feedback
drawarrow nodo1--nodo2--parfb.e;
drawarrow parfb.w--rotorfb.e;
drawarrow rotorfb.w--generador.e;
drawarrow generador.w--nodo3--suma.s;

endfig;

end

