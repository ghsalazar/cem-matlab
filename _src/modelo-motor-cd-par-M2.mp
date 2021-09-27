input boxes;

prologues := 3;
outputformat := "svg";
outputtemplate := "%j-%c.%o";

beginfig(1);

%% Feedforward

pair corriente;
pair velocidad;

boxit.parff(btex $K_t$ etex);
boxit.rotorff(btex $1 \over {Js + B}$ etex);

parff.w - corriente = (7mm,0);
rotorff.w - parff.e = (7mm,0);
velocidad - rotorff.e = (7mm,0);

drawboxed(parff, rotorff);

label.lft(btex $I_a(s)$ etex, corriente);
label.rt(btex $\Omega(s)$ etex, velocidad);

%% Feedforward
drawarrow corriente--parff.w;
drawarrow parff.e--rotorff.w;
drawarrow rotorff.e--velocidad;

endfig;

end

