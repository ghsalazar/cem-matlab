---
title: Función de transferencia del motor de CD
layout: post
lang: es
...

Para controlar un motor es muy importante saber como va a reaccionar éste a
cambios en la señal de control.

Para describir el comportamiento de un motor de
CD, existen varias maneras.

    ecuaciones diferenciales;
    función de transferencia;
 
En esta lección nos concentraremos en las
siguientes:     y
    modelo de régimen permanente.

Cada modelo tiene su utilidad. Las ecuaciones diferenciales se aplican para analizar el sistema en el estado transitorio.

La función de transferencia se aplica para analizar el motor en frecuencia y diseñar controladores.

Por otro lado, el modelo de régimen permanente se aplica para el análisis del comportamiento del motor de CD cuando se requiere una velocidad constante. También este modelo se aplica para seleccionar el motor.
## Función de transferencia

En un sistema dinámico, la función de transferencia es la relación entre las
transformadas de Laplace de la salida y la entrada.

Si aplicamos la transformada de Laplace a las ecuaciones diferenciales lineales
y se asumen condiciones iniciales cero, se obtiene

$$L_a s I_a(s) + R_a I_a(s) = V_a(s) - K_v^* \Omega(s)$$

$$J s\Omega(s) + B\Omega(s) = K_t^* I_a(s)$$

Si despejamos las salidas, ambas ecuaciones se pueden expresar a partir de dos
funciones de transferencia

$$I_a(s) = \frac{1}{L_a s + R_a} \left( V_a(s) - K_v^* \Omega(s) \right)$$

$$\Omega(s) = \frac{1}{J s + B} K_t^* I_a(s)$$

A partir de estas ecuaciones se puede obtener el diagrama de bloques del motor,
donde la entrada es el voltaje de armadura, va, y la salida es la velocidad
angular, ω. El diagrama se puede ver en la siguiente figura.

![Diagrama de bloques de un motor de CD](../images/modelo-motor-cd-velocidad-1.svg){: width=200%}

Aplicando el [algebra de bloques], podemos obtener la función de transferencia
total, $M(s)$:

$$M(s) = \frac{K_t^*}{\left( L_a s +R_a \right)\left( J s + B \right) + K_t^* K_v^*}$$

Esta función de transferencia también se puede expresar, tal como se vio en
control clásico, de la forma

$$M(s) = K_{cd} \frac{\omega^2}{s^2 + 2\zeta\omega + \omega^2}$$

donde la constante $K_{cd}$ es la ganancia de estado estacionario del motor, la
constante $\omega_n$ es la frecuencia natural del motor, y la constante $\zeta$
es el amortiguamiento del motor.

## Velocidad en estado estacionario

Es importante remarcar que en estado estacionario se tiene que

$$\lim_{s\to 0} M(s)= \lim_{s\to 0} K_{cd} \frac{\omega_n^2}{s^2 + 2\zeta\omega_n s + \omega_n^2}$$

Es decir que para obtener $k_{cd}$ se aplica un voltaje constante de armadura, $V_a$, y
se obtiene una velocidad angular en estado estacionario, $\omega^*$. Luego, $K_{cd}$ se
calcula de la siguiente forma

$$K_{cd} = \frac{\omega^*}{V_a}.$$

