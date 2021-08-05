---
title: Fundamentos de control discreto
author: Gastón Hugo Salazar Silva
layout: post
lang: es
...

A continuación identificaremos los elementos que componen un sistema de control
discreto, y listaremos sus ventajas y desventajas.

Es importante notar que normalmente analizamos las plantas o procesos a
controlar por medio de modelos en tiempo continuo; por ejemplo, con ecuaciones
diferenciales. Esto se debe a que es más fácil usar variables agregadas para
describir el comportamiento de un sistema.

Por otro lado, es más fácil implementar un controlador por medio de un
procesador digital, ya que se puede ajustar fácilmente el
controlador, e incluso modificarlo.

## Elementos de un control discreto

En la siguiente figura podemos ver un diagrama de un sistema de control
discreto, donde podemos reconocer los diferentes elementos de un sistema de
control discreto.

| <img src="/assets/images/sistema-control-discreto-1.svg" width="1000"> |
|:----:|
| Figura: Componentes de un sistema de control discreto |

A continuación describiremos cada uno de los elementos a partir de la **planta**,
la cual es el sistema ha controlar. Sobre la planta no haremos ahorita ninguna
suposición, simplemente tiene una variable controlada (*salida*) y una variable
manipulada (*entrada*).

El siguiente elemento, que consideraremos, es el **sensor**, el cual mide la
variable controlada o salida y proporciona una señal eléctrica. 

La señal obtenida por el sensor tiende a tener problemas con respecto a la
potencia, la amplitud o la impedancia. Para reducir estos problemas , la señal
pasa por un **acondicionador de señal**. Más aún, en un sistema de control
discreto, el acondicionador de señal debe filtrar la señal por consideración a la
[frecuencia de muestreo](https://es.wikipedia.org/wiki/Frecuencia_de_muestreo).

Para la siguiente etapa, tenemos dos posibilidades: realizar la resta de la
variable de referencia y la variable controlada antes o después de convertir la
señal a digital. Optamos por hacerlo antes, ya que esta operación se
puede incluir con un [amplificador
diferencial](https://hetpro-store.com/TUTORIALES/amplificador-diferencial/) en
el acondicionador de señal. Además, reduce el número de convertidores
analógicos--digitales.

Por consiguiente, la siguiente etapa es el [convertidor
análogo--digital](https://es.wikipedia.org/wiki/Conversor_de_se%C3%B1al_anal%C3%B3gica_a_digital)
(ADC, por sus siglas en inglés), donde la señal analógica se cuantifica, es
decir que obtenemos un valor en binario a partir del valor analógico. Además,
como el proceso tarda un tiempo, se empieza introducir el tema de la latencia o
retardo. Por otro lado, el valor obtenido está en la representación de [punto
fijo](https://es.wikipedia.org/wiki/Coma_fija).

En el **procesador digital** es donde se ejecuta el programa que implementa la
ley de control. La velocidad con que se ejecuta el programa introduce nuevas
latencias o retardos e impone un límite superior sobre la frecuencia de muestreo
máxima posible. Por ello tenemos que se usan
[microcontroladores](https://es.wikipedia.org/wiki/Microcontrolador)
en aplicaciones que manejan frecuencias bajas de muestreo, y [procesadores
digitales de
señales](https://es.wikipedia.org/wiki/Procesador_de_se%C3%B1ales_digitales)
cuando se requieren altas frecuencias de muestreo.

Una vez procesada la señal discreta, se debe transformar nuevamente a una señal
analógica, lo cual se hace por medio de un [convertidor
digital--análogo](https://es.wikipedia.org/wiki/Conversor_de_se%C3%B1al_digital_a_anal%C3%B3gica)
(DAC, por sus siglas en inglés). En ocasiones se sustituye la señal analógica
por un algún tipo de señal modulada, por ejemplo a través un modulador de ancho
de pulso (PWM, por sus siglas en inglés), ya que posiblemente la etapa de
potencia utilice este tipo de señal.

La etapa de potencia acondiciona la señal para poder ser utilizada por el
actuador. Usualmente, por razones de eficiencia, la etapa de potencia consiste
en [amplificadores
conmutados](https://es.wikipedia.org/wiki/Amplificador_Clase_D).

Finalmente, viene el actuador, el cual transforma la señal eléctrica para operar
sobre la variable manipulada de la planta.

## Ventajas y desventajas de un control discreto

Como ya mencionamos, es más fácil analizar una planta por medio de modelos en
tiempo continuo; sin embargo la implementación de una ley de control es mucho
más sencilla en un procesador digital. En la siguiente tabla, veremos las ventajas
y desventajas de un sistema de control discreto.

| Ventajas | Desventajas |
|----------|-------------|
| Flexibilidad para cambiar de estrategia | Pérdida de información debido al muestreo |
|----------|-------------|
| Flexibilidad para cambiar el controlador | Pérdida de información debido a la cuantización |
|----------|-------------|
| Flexibilidad para ajustar los parámetros del controlador | Introducción de retardo al sistema de control | 
|----------|-------------|
| Robustez ante cambios ambientales | |

## Conclusiones

Finalmente, una vez más recordamos que es más sencillo modelar en tiempo
continuo las plantas o procesos, ya que es más fácil usar variables agregadas,
por medio de ecuaciones diferenciales.

Sin embargo, también ya dijimos que es más sencillo implementar una ley de
control por medio de un procesador digital. Esto se debe a que tenemos una mayor
flexibilidad para cambiar de estrategia de control, cambiar el controlador, y
ajustar los parámetros del controlador. Además, los controladores digitales son
más robustos a cambios ambientales.

Por otro lado, tenemos desventajas de un sistema de control discreto; por
ejemplo, la pérdida de información debido al muestreo y cuantización y la
introducción del retardo en el sistema de control.

## Para saber más

<iframe width="560" height="315" src="https://www.youtube.com/embed/14cMhrp5wlk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>