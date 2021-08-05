---
title: Transformación bilineal o transformación de Tustin
layout: default
lang: es
...

A continuación obtendremos funciones de transferencia discretas a partir de
funciones de transferencia continuas por medio de la transformación bilineal y
aplicaremos la transformación bilineal a funciones de transferencia de primer y
segundo orden.

## Transformación bilineal

Utilizamos la transformación bilineal para obtener funciones de transferencia
discretas. Para ello partimos de la [regla del
trapecio](https://es.wikipedia.org/wiki/Regla_del_trapecio).

Observe la siguiente figura, donde se muestra una curva que representa la
derivada de la función $f$, donde $t$ representa un instante de tiempo, $h$
representa un incremento en el tiempo y $f'$ representa la derivada de $f$ con
respecto al tiempo.

| ![Área de una función sobre un intervalo](/assets/images/tustin-1.svg) |
|:----:|
| Figura: Área de una función sobre un intervalo |

El problema consiste en encontrar el área bajo la curva $f'$ sobre el intervalo
$[t,t+h]$. Para ello, partimos del [segundo teorema fundamental del
cálculo](https://es.wikipedia.org/wiki/Teorema_fundamental_del_c%C3%A1lculo#Segundo_Teorema_Fundamental_del_C%C3%A1lculo),
que se muestra a continuación

$$\int_{t}^{t+h} f'(\tau) \mathrm{d}\tau = f(t+h) - f(t) \tag{1}$$

Una forma de aproximar este resultado es utilizando la regla del trapecio, como
se puede apreciar en la siguiente figura.

| ![Aplicación de la regla del trapecio](/assets/images/tustin-2.svg) |
|:------:|
| Figura: Aplicación de la regla del trapecio |

Como se puede apreciar, el area bajo la curva está aproximada por un trapezoide,
cuya área esta coloreada de azul. La regla del trapecio se puede escribir para
nuestro caso de la siguiente forma

$$\int_{t}^{t+h} f'(\tau) \mathrm{d}\tau \approx \frac{f'(t) + f'(t+h)}{2} h. \tag{2}$$

Sustituimos el lado derecho de la ecuación (2) en el lado izquierdo de la
ecuación (1), y obtenemos la siguiente expresión

$$\frac{f'(t) + f'(t+h)}{2} h \approx f(t+h) - f(t). \tag{3}$$
 
A la ecuación (3) le aplicaremos la transformada de Laplace, asumiendo
condiciones iniciales 0, 

$$\mathcal{L} \left\{\frac{f'(t) + f'(t+h)}{2} h \right\} \approx \mathcal{L} \left\{f(t+h) - f(t)\right\}, \tag{4}$$

y el resultado que obtenemos es

$$\frac{sF(s) + e^{hs} sF(s)}{2} h \approx e^{hs} F(s) - F(S). \tag{5}$$

Para reducir la complejidad  de la simplificación que sigue, proponemos la
siguiente sustitución

$$z = e^{hs} \tag{6},$$

en la ecuación (5), con lo que obtenemos

$$\frac{sF(s) + z sF(s)}{2} h \approx z F(s) - F(S). \tag{7}$$

Finalmente, despejamos la variable $s$ de la ecuación (7), con lo que obtenemos

$$s \approx \frac{2}{h} \frac{z-1}{z+1}. \tag{8}$$

## Elección de del periodo de muestreo $h$

El *periodo de muestreo*, $h$, está dado por la siguiente expresión

$$h = \frac{1}{f_s} \tag{9}$$

donde $f_s$ es la *frecuencia de muestreo* del sistema de control discreto.

Para elegir la frecuencia de muestreo, $f_s$, aplicaremos el
[Teorema de muestreo de
Nyquist-Shannon](https://es.wikipedia.org/wiki/Teorema_de_muestreo_de_Nyquist-Shannon),
el cual dice que

$$f_s > 2 B \tag{10}$$

donde $B$ es la *frecuencia del ancho de banda* en lazo cerrado del sistema de
control.

La estrategia que seguiremos es:
1. Diseñar analógicamente el sistema de control.
2. Obtener el ancho de banda del sistema de control en lazo cerrado.
3. Seleccionar el multiplicador que se usará entre el ancho de banda y la
   frecuencia de muestreo. Debe ser mayor a 2. Usualmente la frecuencia de
   muestreo es de 10 a 40 veces el ancho de banda.
4. Obtener el periodo de muestreo a partir de la frecuencia de muestreo.
3. Convertir el controlador analógico a digital utilizando el periodo de
   muestreo obtenido.

El siguiente video presenta algunas problemáticas que hay que considerar a la
hora de seleccionar $h$.

<iframe width="560" height="315" src="https://www.youtube.com/embed/AdlCPZ5bY9M" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Ejemplo

Es importante notar, que para este ejemplo, no consideramos todo el sistema de
control, sino solamente una función de transferencia. Un sistema de control en
lazo cerrado usualmente incrementa el ancho de banda.

Para el siguiente ejemplo, utilizamos la función de transferencia publicada en
[DC Motor Speed: System
Modeling](https://ctms.engin.umich.edu/CTMS/index.php?example=MotorSpeed&section=SystemModeling), la cual expresamos como

$$H(s) = \frac{2}{s^2 + 12 s + 20}. \tag{11}$$

El ancho de banda del sistema se obtuvo por medio de Matlab y el resultado es

$$B = 0.306 \;\mathrm{Hz} \tag{12}$$

En el siguiente paso seleccionamos el multiplicador para la frecuencia de muestreo, que para este ejemplo seleccionamos 10. Entonces tenemos que la frecuencia de muestreo es

$$f_s = 10 B. \tag{13}$$

Combinando las ecuaciones (12) y (l3), nos da como resultado la frecuencia de muestreo

$$f_s = 3.06 \;\mathrm{Hz}. \tag{14}$$

Finalmente, el periodo de muestreo es

$$h = 3.268\;\mathrm{s}. \tag{15}$$

El siguiente *script* de matlab se puede usar para obtener el periodo de muestreo.

~~~
s = tf('s');

H = 2/(s^2+12*s+20);

B = bandwidth(H)/2/pi; % Hay que recordar que está en rad/s y
                       % necesitamos Hz

f_s = 10*B;

h = 1/f_s
~~~

El resultado obtenido es el mismo.

## Ejemplos

A continuación, veremos dos ejemplos de como se aplica la transformación bilineal.
Para obtener la función discreta, utilizaremos la siguiente expresión de sustitución

$$H_d(z)\approx \left.H(s)\right|_{s=\frac{2}{h}\frac{z-1}{z+1}}. \tag{16}$$

donde $H_d(s)$ representa la función de transferencia discreta.
### Primer orden

Para el siguiente ejemplo, utilizamos la función de transferencia del subsistema
eléctrico de un motor de CD, obtenida a partir de la información publicada en [DC
Motor Speed: System
Modeling](https://ctms.engin.umich.edu/CTMS/index.php?example=MotorSpeed&section=SystemModeling).
La función de transferencia es

$$H(s) = \frac{2}{s + 20}. \tag{17}$$

Obtuvimos el ancho de banda de $H(s)$ por medio de Matlab y nuevamente
utilizamos un multiplicador de 10, con lo que obtenemos el periodo de muestreo

$$h = 0.0315 \;\mathrm{s}. \tag{17}$$

Utilizamos la ecuación (16) para expresar la función de transferencia (17) de
forma discreta,

$$H_d(z) = \left.\frac{2}{s+20}\right|_{s=\frac{2}{h}\frac{z-1}{z+1}}. \tag{18}$$

Aplicamos la sustitución y obtenemos

$$H_d(z) = \frac{2}{\frac{2}{h}\frac{z-1}{z+1}+20}. \tag{19}$$

Finalmente, simplificamos la ecuación (19) y llegamos al resultado

$$H_d(z) = \frac{0.02395 z + 0.02395}{z - 0.521}. \tag{20}$$

El siguiente *script* de Matlab puede realizar ese cálculo.

```
s = tf('s');

H = 2/(s+20);

B = bandwidth(H)/2/pi;

f_s = 10*B;

h = 1/f_s;

H_d = c2d(H,h,'tustin')
```

### Segundo orden

Para el siguiente ejemplo, utilizamos nuevamente la función de transferencia (11),

$$H(s) = \frac{2}{s^2 + 12 s + 20}$$

y el periodo de muestreo que calculamos en la ecuación (15)

$$h = 0.3268\;\mathrm{s}.$$

Utilizamos la ecuación (16) para expresar la función de transferencia (11) de
forma discreta,

$$H_d(z) = \left.\frac{2}{s^2 + 12 s + 20}\right|_{z=\frac{2}{h}\frac{z-1}{z+1}}. \tag{21}$$

Al realizar la sustitución, obtenemos la expresión

$$H_d(z) = \frac{2}{\left(\frac{2}{h}\frac{z-1}{z+1}\right)^2+12(\frac{2}{h}\frac{z-1}{z+1})+20} \tag{22}$$

Simplificando la ecuación (22), obtenemos el resultado final

$$H_d(z) = \frac{0.01528 z^2 + 0.03056 z + 0.01528}{z^2 - 0.2667 z - 0.1221}. \tag{23}$$

Este resultado también se puede obtener por medio del siguiente *script*.


```
s = tf('s');

H = 2/(s^2 + 12*s + 20);

B = bandwidth(H)/2/pi;

f_s = 10*B;

h = 1/f_s;

H_d = c2d(H,h,'tustin')
```
## Para saber más

En el enlace [método de Euler de
integración](https://es.wikipedia.org/wiki/M%C3%A9todo_de_Euler) podemos revisar otros
métodos de integración que se usan para obtener aproximaciones.

En el siguiente video podemos ver diferentes aproximaciones que utiliza Matlab.

<iframe width="560" height="315" src="https://www.youtube.com/embed/rL_1oWrOplk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

En el siguiente video podemos ver otro enfoque para obtener la transformación bilineal.

<iframe width="560" height="315" src="https://www.youtube.com/embed/88tWmyBaKIQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>