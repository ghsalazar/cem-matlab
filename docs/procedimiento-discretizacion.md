---
title: Procedimiento de discretización
layout: post
...

A continuación, se aprenderá a obtener funciones de transferencia discretas a
partir de funciones de transferencia continuas por medio de la transformación
bilineal y se aplicará la transformación bilineal a funciones de transferencia
de primer, segundo orden y tercer orden.

## Transformación bilineal

Usualmente se analizan los sistemas de control con técnicas analógicas, pero se
implementan los controladores por medio de sistemas digitales.

Existen dos estrategias para combinar estos hechos.

Una estrategia es:

1. Obtener la función de transferencia de la planta en el dominio continuo.
2. Obtener la función de transferencia de la planta en dominio discreto a partir de la continua.
3. Diseñar el sistema de control en el dominio discreto.
4. Implementar el sistema de control en el dominio discreto.

Otra estrategia, la que vamos a usar, es:

1. Obtener la función de transferencia de la planta en el dominio continuo.
2. Diseñar el sistema de control en el dominio continuo.
3. Obtener el sistema de control en el dominio discreto a partir del continuo.
4. Implementar el sistema de control en el dominio discreto.

Una forma de obtener una función de transferencia en el dominio discreto es
aplicar la aplicar la transformación bilineal sobre una función de transferencia
en el dominio continuo.

Revise la publicación [Transformación bilineal o transformación de
Tustin](https://ghsalazar.github.io/2021/03/07/transformaci%C3%B3n-bilineal.html),
donde se podrá ver  que es la transformación bilineal y como se aplica.

## Aproximaciones de Euler

Existen otras aproximaciones utilizadas en la aproximación de funciones de
transferencias.

Está la aproximación hacia adelante de Euler, definido como

$$s=\frac{z-1}{h}$$

y la aproximación hacia atrás de Euler, definida como

$$s=\frac{z-1}{hz}$$

En la publicación [Computing transfer function Cd(z)
(pag.7)](http://www-verimag.imag.fr/~tdang/DocumentsCours/2013Discretization.pdf#page=7),
se puede revisar esto.
