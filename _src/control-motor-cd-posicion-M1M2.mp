input boxes;

prologues := 3;
outputformat := "svg";
outputtemplate := "%j-%c.%o";

beginfig(1);


%% Feedforward
pair referencia;
circleit.sumaOuter(btex $+$ etex);
boxit.PID(btex PID etex);
circleit.sumaInner(btex $+$ etex);
boxit.PI(btex PI etex);
pair voltaje;
boxit.M1(btex ${Js+B} \over {(L_a s + R_a)(Js+B)+ K_t K_v}$ etex);
pair corriente;
boxit.M2(btex ${K_t} \over {Js+B}$ etex);
pair velocidad;
boxit.integral(btex $1\over s$ etex);
pair posicion[];

sumaOuter.w - referencia = (7mm, 0);
PID.w - sumaOuter.e = (7mm,0);
sumaInner.w - PID.e = (7mm, 0);
PI.w - sumaInner.e = (7mm,0);
voltaje - PI.e = (7mm,0);
M1.w - voltaje = (7mm,0);
corriente - M1.e = (7mm,0);
M2.w - corriente = (7mm,0);
velocidad - M2.e = (7mm,0);
integral.w - velocidad = (7mm,0);
posicion1 - integral.e = (7mm,0);
posicion2 - posicion1 = (7mm,0);

drawboxed(sumaOuter, PID, sumaInner, PI, M1, M2, integral);

label.lft(btex $R(s)$ etex, referencia);
label.top(btex $V_a(s)$ etex, voltaje);
label.bot(btex $M1$ etex, M1.s);
label.bot(btex $M2$ etex, M2.s);
dotlabel.top(btex $I_a(s)$ etex, corriente);
label.top(btex $\Omega(s)$ etex, velocidad);
label.rt(btex $\Theta(s)$ etex, posicion2);

drawarrow referencia--sumaOuter.w;
drawarrow sumaOuter.e--PID.w;
drawarrow PID.e--sumaInner.w;
drawarrow sumaInner.e--PI.w;
drawarrow PI.e--voltaje--M1.w;
drawarrow M1.e--corriente--M2.w;
drawarrow M2.e--velocidad--integral.w;
drawarrow integral.e--posicion1--posicion2;

%% Feedback inner loop
pair innerLoop[];
boxit.negativo1(btex $-1$ etex);

corriente - innerLoop1 = (0, 15mm);
M1.c - negativo1.c = (0, 15mm);
sumaInner.c -innerLoop2 = (0, 15mm);

drawboxed(negativo1);

drawarrow corriente--innerLoop1--negativo1.e;
drawarrow negativo1.w--innerLoop2--sumaInner.s;

%% Feedback outer loop

pair outerLoop[];
boxit.negativo2(btex $-1$ etex);

posicion1 - outerLoop1 = (0, 30mm);
negativo1.c - negativo2.c = (0, 15mm);
sumaOuter.c - outerLoop2 = (0, 30mm);

drawboxed(negativo2);
drawarrow posicion1--outerLoop1--negativo2.e;
drawarrow negativo2.w--outerLoop2--sumaOuter.s;


endfig;

end

