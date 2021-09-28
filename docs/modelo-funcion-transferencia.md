---
title: Función de transferencia del motor de CD
layout: post
lang: es
...

Como mencionamos anteriormente, para controlar un motor es muy importante saber
cómo va a reaccionar éste a cambios en la señal de control.

Anteriormente, describimos este comportamiento por medio de ecuaciones
diferenciales y el modelo de régimen permanente. Cada modelo tiene su utilidad.
Las ecuaciones diferenciales se aplican para analizar el sistema en el estado
transitorio.

Por otro lado, el modelo de régimen permanente se aplica para el análisis del
comportamiento del motor de CD cuando se requiere una velocidad constante.
También este modelo se aplica para seleccionar el motor.
 
Ahora nos concentraremos en la función de transferencia del motor de CD para
velocidad. Esta descripción se aplica para analizar el motor en frecuencia y
diseñar controladores.

## Simplificación del modelo dinámico

En un sistema dinámico, la función de transferencia es la relación entre las
transformadas de Laplace de la salida y la entrada. Para obtener la función de
transferencia del motor de CD, partiremos de las ecuaciones diferenciales del
motor que ya vimos:

$$L_a\frac{di_a}{dt} + R_a i_a = v_a - K_v i_f \omega \tag{1}$$
$$L_f\frac{di_f}{dt} + R_f i_f = v_f \tag{2}$$
$$J \frac{d\omega}{dt} + B\omega = K_t i_f i_a + \tau_L \tag{3}$$

El problema con las ecuaciones anteriores es que tienen dos componentes
bilineales, dados por los productos $i_f i_a$ y $i_f \omega$. También tenemos
una perturbación en la forma del par de carga, $\tau_L$.

Para simplificar la obtención de la función de transferencia, haremos dos
suposiciones:

1. El voltaje de campo, $v_f$, es constante.
2. El par de carga, $\tau_L$, es despreciable.

La primera suposición es común, ya que se utiliza normalmente el voltaje de
armadura, $v_a$, para controlar el motor. Por lo tanto, lo normal es aplicar un
voltaje constante en el campo.

Como resultado de esta suposición, tenemos que en estado estacionario la
corriente de campo se vuelve constante. 

En cuanto a la segunda suposición, normalmente se utiliza una transmisión
reductora entre el motor y la carga, por lo que el par de carga se ve disminuido
notablemente.

Aplicando estas suposiciones a las ecuaciones (1), (2) y (3), el sistema
dinámico se reduce a las siguientes ecuaciones

$$L_a\frac{di_a}{dt} + R_a i_a = v_a - K_v^* \omega \tag{4}$$
$$J \frac{d\omega}{dt} + B\omega = K_t^* i_a \tag{5}$$

donde se tienen dos nuevas constantes $K_v^*$ y $K_t^*$, las cuales están
definidas por

$$K_v^* = K_v i_f, \tag{6}$$
$$K_t^* = K_t i_f, \tag{7}$$

## Función de transferencia con respecto a la velocidad

Una vez simplificado el modelo dinámico, aplicamos la transformada de Laplace a
las ecuaciones (4) y (5), asumimos condiciones iniciales cero y obtenemos las
expresiones 

$$L_a s I_a(s) + R_a I_a(s) = V_a(s) - K_v^* \Omega(s) \tag{8}$$
$$J s\Omega(s) + B\Omega(s) = K_t^* I_a(s) \tag{9}$$

Si despejamos las salidas, ambas ecuaciones se pueden expresar a partir de dos
funciones de transferencia

$$I_a(s) = \frac{1}{L_a s + R_a} \left( V_a(s) - K_v^* \Omega(s) \right) \tag{10}$$

$$\Omega(s) = \frac{1}{J s + B} K_t^* I_a(s) \tag{11}$$

A partir de estas ecuaciones se puede obtener el diagrama de bloques del motor,
donde la entrada es el voltaje de armadura, $v_a$, y la salida es la velocidad
angular, $\omega$. El diagrama se puede ver en la siguiente figura.

![Diagrama de bloques de un motor de CD](../images/modelo-motor-cd-velocidad-1.svg){: width="100%"}

Aplicando el [algebra de
bloques](https://www.tutorialspoint.com/control_systems/control_systems_block_diagram_algebra.htm),
podemos obtener la función de transferencia total, $M(s)$:

$$M(s) = \frac{K_t^*}{\left( L_a s +R_a \right)\left( J s + B \right) + K_t^*
K_v^*} \tag{12}$$

### Ejemplo

Sea un motor de CD con una resistencia de armadura de $1\;\Omega$, una
inductancia de armadura de 0.5 H y asuma que la magnitud de ambas constantes
$K_v^{*}$ y $K_t^{*}$ es 0.01. Por otro lado, el momento de inercia del rotor es de
0.01 Kg$\cdot$m y la fricción viscosa es 0.1 N.m.s/rad. Obtenga la función de
transferencia.

#### Solución

$$M(s) = \frac{0.01}{\left( 0.5 s + 1 \right)\left( 0.01 s + 0.1 \right) + 0.0001}$$


## Velocidad en estado estacionario

La función de transferencia (12) también se puede expresar, tal como se vio en
control clásico, de la forma

$$M(s) = K_{cd} \frac{\omega^2}{s^2 + 2\zeta\omega + \omega^2} \tag{13}$$

donde la constante $K_{cd}$ es la ganancia de estado estacionario del motor, la
constante $\omega_n$ es la frecuencia natural del motor, y la constante $\zeta$
es el amortiguamiento del motor.

Es importante remarcar que en estado estacionario se tiene que

$$\lim_{s\to 0} M(s)= \lim_{s\to 0} K_{cd} \frac{\omega_n^2}{s^2 +
2\zeta\omega_n s + \omega_n^2} \tag{14}$$

Es decir que para obtener $K_{cd}$ se aplica un voltaje constante de armadura, $V_a$, y
se obtiene una velocidad angular en estado estacionario, $\omega^*$. Luego, $K_{cd}$ se
calcula de la siguiente forma

$$K_{cd} = \frac{\omega^*}{V_a}. \tag{15}$$

### Ejemplo

Sea un motor de CD con un valor nominal de velocidad de 1000 RPM a 120 V.
Obtenga la constante de CD.

#### Solución

El primer paso será convertir las unidades de la velocidad angular

$$\omega^* = 1000 \mathrm{RPM} \frac{2\pi\;\mathrm{rad}}{1\;\mathrm{revolución}} 
             \frac{1\;\mathrm{minuto}}{60\;\mathrm{s}}$$

$$\omega^* = 104.7\;\frac{\mathrm{rad}}{\mathrm{s}}$$

Luego sustituimos en la ecuación (15) los valores correspondientes

$$K_{cd} = \frac{104.7\;\frac{\mathrm{rad}}{\mathrm{s}}}{120\;\mathrm{V}}$$

Con lo que tenemos de resultado.

$$K_{cd} = 0.8725\;\frac{\mathrm{rad}}{\mathrm{Vs}}$$
## Conclusiones

En esta lección aprendimos a describir el comportamiento de un motor de CD por
medio de la función de transferencia.

La función de transferencia es útil para analizar el motor en frecuencia y
diseñar controladores.
