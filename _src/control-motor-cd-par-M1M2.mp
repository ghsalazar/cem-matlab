input boxes;

prologues := 3;
outputformat := "svg";
outputtemplate := "%j-%c.%o";

beginfig(1);


%% Feedforward
pair referencia;
pair voltaje;
pair corriente;
pair velocidad;
circleit.suma(btex $+$ etex);
boxit.PI(btex PI etex);
boxit.Ma(btex ${Js+B} \over {(L_a s + R_a)(Js+B)+ K_t K_v}$ etex);
boxit.Mb(btex ${K_t} \over {Js+B}$ etex);

suma.w - referencia = (7mm, 0);
PI.w - suma.e = (7mm,0);
voltaje - PI.e = (7mm,0);
Ma.w - voltaje = (7mm,0);
corriente - Ma.e = (7mm,0);
Mb.w - corriente = (7mm,0);
velocidad - Mb.e = (7mm,0);

drawboxed(suma, PI, Ma, Mb);

label.lft(btex $R(s)$ etex, referencia);
label.top(btex $V_a(s)$ etex, voltaje);
label.bot(btex $M1$ etex, Ma.s);
label.bot(btex $M2$ etex, Mb.s);
dotlabel.top(btex $I_a(s)$ etex, corriente);
label.rt(btex $\Omega(s)$ etex, velocidad);

drawarrow referencia--suma.w;
drawarrow suma.e--PI.w;
drawarrow PI.e--voltaje--Ma.w;
drawarrow Ma.e--corriente--Mb.w;
drawarrow Mb.e--velocidad;

%% Feedback
pair nodo[];
boxit.negativo(btex $-1$ etex);

corriente - nodo1 = (0, 15mm);
Ma.c - negativo.c = (0, 15mm);
suma.c -nodo2 = (0, 15mm);

drawboxed(negativo);

drawarrow corriente--nodo1--negativo.e;
drawarrow negativo.w--nodo2--suma.s;

endfig;

end

