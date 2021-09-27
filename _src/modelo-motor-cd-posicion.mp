input boxes;

prologues := 3;
outputformat := "svg";
outputtemplate := "%j-%c.%o";

beginfig(1);

%% Feedforward

pair voltaje;
boxit.M1(btex ${Js+B} \over {(L_a s + R_a)(Js+B)+ K_t K_v}$ etex);
pair corriente;
boxit.M2(btex ${K_t} \over {Js+B}$ etex);
pair velocidad;
boxit.integrador(btex $1\over s$ etex);
pair angulo;

M1.w - voltaje = (7mm,0);
corriente - M1.e = (7mm,0);
M2.w - corriente = (7mm,0);
velocidad - M2.e = (7mm,0);
integrador.w - velocidad = (7mm,0);
angulo - integrador.e = (7mm,0); 

drawboxed(M1, M2, integrador);

label.lft(btex $V_a(s)$ etex, voltaje);
label.bot(btex $M1$ etex, M1.s);
label.bot(btex $M2$ etex, M2.s);
label.top(btex $I_a(s)$ etex, corriente);
label.top(btex $\Omega(s)$ etex, velocidad);
label.rt(btex $\Theta(s)$ etex, angulo);

%% Feedforward

drawarrow voltaje--M1.w;
drawarrow M1.e--corriente--M2.w;
drawarrow M2.e--velocidad--integrador.w;
drawarrow integrador.e--angulo;

endfig;

end

