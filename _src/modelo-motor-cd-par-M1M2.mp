input boxes;

prologues := 3;
outputformat := "svg";
outputtemplate := "%j-%c.%o";

beginfig(1);

pair entrada;
pair corriente;
pair salida;

boxit.Ma(btex ${Js+B} \over {(L_a s + R_a)(Js+B)+ K_t K_v}$ etex);
boxit.Mb(btex ${K_t} \over {Js+B}$ etex);

%% Feedforward

Ma.w - entrada = (7mm,0);
corriente - Ma.e = (7mm,0);
Mb.w - corriente = (7mm,0);
salida - Mb.e = (7mm,0);

drawboxed(Ma, Mb);

label.lft(btex $V_a(s)$ etex, entrada);
label.rt(btex $\Omega(s)$ etex, salida);
label.bot(btex $M1$ etex, Ma.s);
label.bot(btex $M2$ etex, Mb.s);
label.top(btex $I_a(s)$ etex, corriente);

%% Feedforward
drawarrow entrada--Ma.w;
drawarrow Ma.e--corriente--Mb.w;
drawarrow Mb.e--salida;

endfig;

end

