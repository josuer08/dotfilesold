

|       PONTIFICIA UNIVERSIDAD CATÓLICA MADRE Y MAESTRA        |
| :----------------------------------------------------------: |
| ![logo](https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/EscudoPucmm.gif/240px-EscudoPucmm.gif) |
|          **FACULTAD DE CIENCIAS DE LA INGENIERÍA**           |
|          **DEPARTAMENTO DE INGENIERÍA TELEMÁTICA**           |
|                      *ST-ITT-454-P888*                       |
|                         **Reporte:**                         |
|            Conmutación de paquetes y de circuitos            |
|                     **Presentado por:**                      |
|                 *Oscar Rodriguez 2014-0147*                  |
|                **Presentado al profesor:****                 |
|                     *Ing. Timoteo Perez*                     |
|                    **Fecha de entrega:**                     |
|                 Viernes, 10 de Mayo del 2019                 |
|     **Santiago de los Caballeros, República Dominicana**     |

# Conmutación de circuitos

## Qué es la conmutación de circuitos?

Este es un modelo de comunicación en el que los equipos de comunicación se conmutan creando un camino reservado para la comunicación entre dos equipos, este **camino** creado es exclusivo para esta comunicación, lo que significa que el ancho de banda que es utilizado es fijo durante toda la comunicación y que este **camino** no se comparte con otras comunicaciones.

Una de las cosas que siempre se denota cuando se habla de este tipo de conexiones es que es totalmente transparente, lo que implica que una vez completada la conmutación entonces para los equipos es como si estuvieran verdaderamente conectados físicamente el uno al otro.

## Ventajas

+ Ancho de banda fijo durante la conmutacion
+ Transparencia en la comunicacion
+ Canal exclusivo de comunicacion
+ Transmisión de tiempo real

## Desventajas

+ Poco eficiente si la comunicación no es de naturaleza continua
+ Retraso en el inicio de la comunicación 
+ No utilización de los caminos dinámicos que podrían ser mas eficientes

# Conmutación de paquetes

## Qué es la conmutación de paquetes?

La conmutación por paquetes es un sistema de telecomunicaciones en que los datos se separan en *paquetes* (Estos no son mas que grupos de información que tienen una carga de información útil y una cabecera que ayuda a la distribución de los mismos y a la posterior reorganización dentro del ordenador que la recibe.) que son enviados individualmente por la red y enrutados cada cual por caminos posiblemente distintos, caminos que son compartidos con todos los otros paquetes que estén viajando por la red.

> Los paquetes en fin, toman diversas vías, pero nadie puede garantizar 
> que todos los paquetes vayan a llegar en algún momento determinado. En 
> síntesis, una red de conmutación de paquetes consiste en una "malla" de 
> interconexiones facilitadas por los servicios de [telecomunicaciones](https://es.wikipedia.org/wiki/Telecomunicaciones), a través de la cual los paquetes viajan desde la fuente hasta el destino.
>
> [Extraido de wikipedia](https://es.wikipedia.org/wiki/Conmutaci%C3%B3n_de_paquetes#Funciones)

Este tipo de conmutación implica que no hay  un ancho de banda fijo, mas bien los paquetes se envían en dependencia de la disponibilidad de la red, lo cual es visiblemente peor para la comunicación que debería ser continua o en tiempo real, pero es mucho mas eficientes cuando se tienen muchas comunicaciones distintas que funcionan en ráfagas.

## Ventajas

+ Se aceptan paquetes aunque la red se encuentre "lenta"
+ Se pueden manejar prioridades, para enviar un grupo de paquetes primero que otro
+ Se pueden encontrar siempre caminos alternativos para los paquetes que se van adecuando para que el envio sea lo mas rapido posible

## Desventajas

+ No tenemos un ancho de banda reservado
+ No transmisión en tiempo real
+ Canales de información compartidos
+ Comunicación no transparente
+ Necesidad de overhead

# Evolución

## Inicio de las redes telefónicas 

Cuando empezaron las redes telefónicas propiamente dichas (Incluso quizá antes de estas) solamente existían las **conmutaciones de circuitos**, estas al inicio se hacían manualmente mediante operadoras que cambiaban las clavijas, estamos hablando del alrededor del 1870, estas redes solo funcionaban por **conmutación de circuitos** manuales, pero mas adelante por las décadas de los 1890, con las maquinas de selectores automáticos, estos seguían siendo sistemas **conmutación de circuitos.**

## Evolución de la telefonía, llegada de los paquetes

Para 1910 llegaron las centrales de mando indirecto, seguidas en la década del 20 por las crossbar, pero estas tecnologías seguían siendo tecnologías de **conmutación de circuitos** y continuarían así por un largo tiempo, puesto que no fue hasta 1950 que Paul Baran utilizara por vez primera la **conmutación de paquetes** para los EEUU.

Estos trabajos fueron los que llevaron a la posterior creación de la ARPANET, pionera de las redes de telecomunicación de gran envergadura y lo que hoy es la Internet. 

## Lo que siguió después

Después de lo ocurrido hasta este momento en la historia lo que siguió fue una evolución continua de las aplicaciones de ambas tecnologías, mas no de la idea en si, saliendo de acá protocolos de multiplexacion para los sistemas de conmutación de circuitos y protocolos como el TCP se volvieron los grandes exponentes de los sistemas digitales, viviendo por un gran tiempo la tecnología digital montada sobre la tecnología análoga, mas luego se invirtió el proceso y ahora con tecnologías como FTTH y LTE las senales de voz viajan sobre IP, utilizando sistemas de paquetes.

