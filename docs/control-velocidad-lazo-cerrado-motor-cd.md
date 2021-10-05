---
title:  Control de velocidad en lazo cerrado para un motor de CD
author: Gastón Hugo Salazar Silva
layout: post
...

## Introducción

En esta lección, analizaremos un sistema de control de velocidad en lazo cerrado
para un motor de CD, el cual sintonizaremos.

## Sistema de control de velocidad en lazo cerrado para un motor de CD en dominio continuo

### Controlador PID

Como se vio anteriormente, un motor de CD con voltaje de campo constante se
puede modelar como un sistema lineal de segundo orden. Un controlador adecuado
para dicha clase de sistema es un controlador Proporcional-Derivativo (PD). Sin
embargo, al modelar el sistema se hicieron ciertas suposiciones que no siempre
se cumplen del todo. Por ello conviene utilizar un controlador
Proporcional-Integral-Derivativo (PID).

La ley de control del controlador PID se muestra a continuación 

$$u(t) = K_p e(t) + K_i \int_0^t e(\tau) d\tau + K_d \frac{de}{dt} \tag{1}$$

donde $u(t)$ es la señal de control, $K_p$ es la constante proporcional, $K_i$
es la constante integral y $K_d$ es la constante derivativa. En cuanto $e(t)$,
ésta es la señal del error que se define como

$$e(t) = r(t) - y(t) \tag{2}$$

donde $r(t)$ es la señal de referencia y $y(t)$ es la medición de salida de la
planta, en este caso la velocidad angular.

La función de transferencia de (1), C(s), esta dada por la expresión

$$C(s) = K_p + \frac{K_i}{s} + K_d s \tag{3}$$

El principal problema con esta función es que no es propia, y por lo tanto se
complica su implementación. Otro problema reside en que el derivador es un
filtro pasa-altas con su polo en el infinito, y por lo tanto amplifica altas
frecuencias.

Una forma de resolver ambos problemas es utilizar la siguiente variante del PID

$$C(s) = K_p + \frac{K_i}{s} + K_d \frac{Ns}{s+N} \tag{4}$$

donde la constante N es la frecuencia de corte de un filtro pasa-altas. Esto
reduce de la amplificación de ruido y vuelve propio al sistema. Simplificando la
función de transferencia, obtenemos

$$C(s) = \frac{(K_p+K_d N)s^2 + (K_i + K_p N)s + K_i N}{s^2+Ns} \tag{5}$$

la cual es una función de transferencia propia.

### Diagrama de bloques

|![control-velocidad-lazo-cerrado-cd](../assets/figures/control-velocidad-lazo-cerrado-cd.png)|
|------------------------------------------------------------|
|Figura 1: Diagrama de bloques del sistema de control|


La figura 1 muestra el sistema de control de velocidad en lazo cerrado para un
motor de CD en el dominio continuo.

### Ejemplo

En la figura 2, podemos ver el modelo de Simscape de un sistema de control de velocidad en lazo cerrado para un motor de CD en el dominio continuo.

|![simulink-control-velocidad-lazo-cerrado-cd](../assets/figures/simulink-control-velocidad-lazo-cerrado-cd.png)|
|---|
|Figura 2: Modelo de Simscape de un sistema de control de velocidad en lazo cerrado para un motor de CD en el dominio continuo.|

Para modelar el motor, utilizamos nuevamente los parámetros publicados en [DC
Motor Speed: System
Modeling](https://ctms.engin.umich.edu/CTMS/index.php?example=MotorSpeed&section=SystemModeling),
y que se muestran a continuación en código Matlab.

~~~
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
~~~

Si bien, Simulink dispone en la librería componentes para implementar PID,
decidimos utilizar la función de transferencia descrita en la ecuación (5). En
cuanto a los coeficientes del controlador PID, utilizamos los obtenidos para el
mismo motor en la publicación [DC Motor Speed: System
Modeling](https://ctms.engin.umich.edu/CTMS/index.php?example=MotorSpeed&section=SystemModeling),
y que se muestran a continuación en código Matlab.

~~~
Kp = 100;
Ki = 200;
Kd = 10;
N = 100;
~~~

Si aplicamos estos coeficientes a la ecuación (5), obtenemos la siguiente
función de transferencia para el PID

$$C(s) = \frac{1100s^2 + 10200s + 20000}{s^2 + 100s} \tag{6}$$                                     

Con la función de transferencia (6), la aplicamos al modelo de la figura 2 en el
bloque de "Controlador PID", como se puede ver en la figura 3.



|![Parámetros del bloque de "Controlador PID"](../assets/figures/parametros-pid.png)|
|---|
|Figura 3: Parámetros del bloque de "Controlador PID".|

El resultado obtenido aparece en la figura 4.

|![Comportamiento del sistema de control de velocidad en lazo cerrado](../assets/figures/control-velocidad-lazo-cerrado-cd-resultado.png)|
|---|
|Figura 4: Comportamiento del sistema de control de velocidad en lazo cerrado.|

Como se puede apreciar, la reacción del sistema de control en lazo cerrado es más rápida que en lazo abierto.