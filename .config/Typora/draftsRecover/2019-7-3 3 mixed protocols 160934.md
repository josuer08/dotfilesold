|       PONTIFICIA UNIVERSIDAD CATÓLICA MADRE Y MAESTRA        |
| :----------------------------------------------------------: |
| ![PUCMM](https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/EscudoPucmm.gif/240px-EscudoPucmm.gif) |
|          **FACULTAD DE CIENCIAS DE LA INGENIERÍA**           |
|         **ESCUELA DE SISTEMAS Y TELECOMUNICACIONES**         |
|                       ST-ITT-463-T-001                       |
|                          **TAREA:**                          |
|                            *SS7*                             |
|                     **PRESENTADO POR:**                      |
|                *OSCAR JOSUE RODRIGUEZ BLANCO*                |
|                         *2014-0147*                          |
|                      **PRESENTADO A:**                       |
|                     *ING. TIMOTEO PEREZ*                     |
|                    **FECHA DE ENTREGA:**                     |
|                *VIERNES, 7 DE JUNIO DEL 2019*                |
|     **SANTIAGO DE LOS CABALLEROS, REPÚBLICA DOMINICANA**     |
|                                                              |

---

---

---

**_Tabla de contenidos_:**

[TOC]



# OSPF

> Open Shortest Path First

Es un IGP para para redes IP que utiliza métricas de tipo link state y el algoritmo de `Dijkstra` para la realización de sus tareas. Es muy conocido y utilizado en en redes empresariales de gran tamaño por sus ventajas.

La manera de operacion es la siguiente: OSPF mantiene bases de datos en cada uno de los routers con un mapa de la red, el estado de una ruta especifica es el costo, que es calculado por cada router hacia cada una de las rutas que le es alcanzable. Por defecto, el cost ode un link depende de el bitrate de la interface ~~1Gbit/s, 10Gbit/s, etc~~. Un router con OSPF va entonces a publicar el costo de su enlace a los vecinos que tengan OSPF mediante un multicast, esto es conocido como el procedimiento de *hello*, y luego los vecinos lo van a publicar a los vecinos de llos, haciendose una cascada de informacion hasta lograr que todos conozcan a todos, para tenerlos en sus propias tablas. 

OSPF tambien puede ser dividido en areas de ruteo, esto se hace para poder lograr una mayor facilidad a la hora de administrar las redes, tambien se tiene porque ayuda con la eficiencia del sistema, normalmente se utilizan identificadores de area que tienen una nomenclatura muy parecida a la de las IP. Todas las areas deben tener una conexión hacia el area backbone o principal , estas conecciones son a traves de los Area Border Routers ~~`ABRs`~~, estos contienen tablas separadas de todas las areas a las que estan conectadas y tambien tienen rutas sumarizadas para todas las areas de la red.

## Mensajes de OSPF

A diferencia de otroas protocolos de enrutamiento, OSPF no envia los datos a traves de TCP o UDP, lo que hace es crear sus propios paquetes IP que viajan con el tag de protocolo numero `89`. Existen los siguientes tipos de mensajes:

+ **Hello**: Estos paquetes se envian de forma periodica y tienen la funcion de descubrir vecinos nuevos y conocer la forma en que se utiliza esa area OSPF, ademas tambien nos sirve para que cuando no lleguen hellos por mas de un periodo especifico ~~Dead interval~~ podamos considerar un vecino como down y asi saber que ese link esta caido y debe notificarse
+ **DBD**: *Database Description* son los mensajes que contienen descripciones de las topologias de los sistemas autonomos o areas. Estos llevan el contenido de las bases de datos Link-State, cuando se deben enviar muchos paquetes de este tipo debido al tamano de la red entonces el que recibe es temporalmente un `esclavo` y debe de enviar acknowledgements de que ha recibido los paquetes.
+ **LSR**: *Link-State request* es un tipo de mensaje que envia un router a otro para pedirle inforacion parcial sobre algunos links especificos del otro router.
+ **LSU**: *Link-State update* es un tipo de mensaje que contiene informacion sobre el estado de un link especifico. estos son enviados en respuesta a los LSR o en multicast en algunas ocasiones cuando hay algun cambio que notificar.
+ **LSAck**: *Link-State acknowledgement* son mensajes que le dan confiabilidad al proceso de intercambio de DBD, porque son acuses de recibo de los paquetes.

# IS~IS

> Intermediate System to Intermediate System

Es un protocolo de link-state que es un IGP, este protocolo no fue ideado para su suso actual, pero ha probado ser de gran utilizad en las grandes empresas con redes de gran envergadura.

1. Cuando el enrutador recibe trafico que enrutar a un destino remoto entonces realiza una consulta a su tabla.
2. El enrutador extrae del paquete el *System ID* y *SEL* para conocer la informacion del area de la direccion destino, Si el area del destino es la misma que la suya el enruta hacia el *System ID* con la base de datos de nivel 1.
3. Si el area de destino es diferente:
   1. Si es un router de nivel 1 envia el paquete al router de nivel 2 mas cercano.
   2. Si es un router de nivel 2, busca la ruta de envio en la base de datos.
   3. Resuelve la direccion al emparejamiento mas largo (Rutas externas sumarizadas)

La principal ventaja de un protocolo de enrutamiento de link state es que el conocimiento completo de la topología permite a los enrutadores calcular rutas que satisfacen determinados criterios. Esto puede ser útil para propósitos de ingeniería de tráfico, donde las rutas se pueden restringir para cumplir con requisitos particulares de calidad de servicio. La principal desventaja de un protocolo de enrutamiento de estado de enlace es que no se escala bien a medida que se agregan más enrutadores al dominio de enrutamiento.

 Aumentar el número de enrutadores aumenta el tamaño y la frecuencia de las actualizaciones de topología, y también la cantidad de tiempo que se tarda en calcular las rutas de extremo a extremo. Esta falta de escalabilidad significa que un protocolo de enrutamiento de estado de enlace no es adecuado para enrutarse a través de Internet en general, por lo que los IGP solo enrutan el tráfico dentro de un único AS.

IS-IS se diseñó originalmente como un protocolo de enrutamiento para CLNP, pero se ha ampliado para incluir el enrutamiento IP; la versión extendida a veces se denomina IS-IS integrado.

Cada enrutador IS-IS distribuye información sobre su estado local (interfaces utilizables y vecinos accesibles, y el costo de usar cada interfaz) a otros enrutadores que usan un mensaje Link State PDU (LSP). Cada enrutador utiliza los mensajes recibidos para crear una base de datos idéntica que describe la topología del AS.

Desde esta base de datos, cada enrutador calcula su propia tabla de enrutamiento utilizando un algoritmo de ruta más corta primero (SPF) o Dijkstra. Esta tabla de enrutamiento contiene todos los destinos que conoce el protocolo de enrutamiento, asociados con una dirección IP de próximo salto y una interfaz de salida.

+ [ ] El protocolo vuelve a calcular las rutas cuando cambia la topología de la red, utilizando el algoritmo de Dijkstra, y minimiza el tráfico de protocolo de enrutamiento que genera.
+ [ ] Proporciona soporte para múltiples rutas de igual coste.
+ [ ] Proporciona una jerarquía de múltiples niveles (dos niveles para IS-IS) llamada "enrutamiento de área", de modo que la información sobre la topología dentro de un área definida del AS se oculta de los enrutadores fuera de esta área. Esto permite un nivel adicional de protección de enrutamiento y una reducción en el tráfico del protocolo de enrutamiento.
+ [ ] Todos los intercambios de protocolo se pueden autenticar de modo que solo los enrutadores de confianza puedan unirse a los intercambios de enrutamiento para el AS.

# BGP

Este es un protocolo de enrutamiento que utiliza data-vector, este fue disenado para poder intercambiar informacion de las rutas a entre AS, esto hace que sea altamente usado por los ISP que tienen multiples sistemas autonomos funcionando y necesitaban de un protocolo que les fuese adecuado para tal situacion.

Este es el unico protocolo disenado para manejar una red de una envergadura tan grande como la que puede llegar a existir en la de un ISP, o incluso multiples ISP, convirtiendose en lo que llamarian un protocolo para internet.

Este protocolo no incluye el balanceo de carga por lo que no hara un balanceo si hay multiples caminos por los que llegar a un destino, mas bien este protocolo interAS tiene el objetivo de intercambiar informacion entre los AS sobre las redes que pueden alcanzar. A este solo le importa la direccion de destino y las politicas aplicadas a este.

Hay ciertos tipos de mensajes ne BGP que se resumen en lo siguiente:

+ **Open**: Se utiliza para iniciar una sesion BGP cuando ya ha y una conexion TCP
+ **Update**: Es un mensaje de actualizacion y es el que anuncia nuevos prefijos
+ **KeepAlive** Es un mensaje que se envia de forma periodica y que sirve para confirmar que el otro par esta `vivo`
+ **Notification** Este notifica que una sesion de BGP se va a cerrar por alguna razon

Los atributos del BGp son los siguientes:

+ Origin: Identifica el mecanismo por el cual se anunció el prefijo IP por primera vez. Puede ser por IGP (0), EGP (1) o INCOMPLET (2).
+ AS-PATH: Almacena una cadena de número de AS que indican la ruta por la cual ha pasado el anuncio.
+ Next-hop: identifica la dirección ip del siguiente salto.
+ Multi-Exit-Discriminator: Es un indicador que indica cuando un sistema autónomo tiene varios enlaces para llegar a otro sistema autónomo.
+ Local-Pref: es útil cuando el sistema autónomo está conectado a múltiples sistemas autónomos al mismo tiempo, de manera que puede haber rutas múltiples a un mismo destino.
+ Comunity: Se puede gestionar la distribución de información a un grupo de destinatarios llamados comunity.

# QoS

## Factores

# RSVP

> Resource Reservation Protocol

Es un protocolo de control de red que habilita aplicaciones de internet para obtener multiples calidades de servicio para sus flujos de datos. Diferentes aplicaciones tienen distintos requerimientos del desempeno de la red. Aplicaciones como:

+ E-Mail Requiere entrega segura pero no puntualidad en la misma.
+ Videoconferencia, telefonia IP - La entrega de datos debe ser oportuna, pero no necesariamente fiable.

Este protocolo es **_NO_** es un protocolo de enrutamiento, es un protocolo que trabaja en conjunto con protocolos de enrutamiento. Esto significa que par amigrar a RSVP no es necesario migrar a un nuevo protocolo de enrutamiento. Todo esto se explica desde su `RFC 2205`.

En RSVP esxisten lo que son los flujos de datos:

> Flujo de datos es una secuencia de datagramas que tienen la misma fuente,
> destino y calidad de servicio (QoS).

Estos flujos de datos tienen una especificacion del flujo, esta estructura permite que los hosts soliciten uno de los siguientes 3 tipos de flujos:

+ Best effort: Se requier eque la transmision sea confiable sin importar la velocidad de la entrega de estos datos.
+ Rate sensitive: Una velocidad garantizada desde la fuente hasta el destino, por ejemplo para videollamadas
+ Delay sensitive: Este permite una velocidad variable, como por ejemplo Video.

Es un atributo que determina el camino en que se intercambian los datos y la forma en uqe los datos son tratados a traves de cada unop de los esquipos que hay en esta ruta.

**Inicio de sesion:**

+ Unirse al grupo multicast mediante IGMP
+ En la sesion unicast e esrutamiento unicast cumple la funcion IGMP
+ El emisor envia un mensaje de ruta a la IP destino
+ La aplicacion del receptor envia un mensaje de solicitud de reservacion con la descripcion del flujo deseada usando RSVP
+ Luego el emisor recibe esa solicitud y empieza a enviar los paquetes de datos.

## Mensajes RSVP

+ Reservation Request Messages: Es un mensaje entregado a los hosts emisores para establecer los parametros apropiados de control de trafico.
+ Path Messages: Cada emisor a lo largo de todas las rutas unicast o multicast. se usa para almacenar el estado de la ruta. 
+ Teardown Messages: Elimina la ruta y estado de reservacion sin tener la necesidad de esperar que el timer de cleanup.
+ Error and confirmation messages: fallos de admision, ancho de banda disponible, servicio no soportado y Reservation-request ack

**ESTRUCTURA DE LOS PAQUETES RSVP**

| Version | Flags | Type | Checksum | Length | Reserved | Send TTl | Message ID | Reserved | MF   | Fragment  offset |
| ------- | ----- | ---- | -------- | ------ | -------- | -------- | ---------- | -------- | ---- | ---------------- |
| 4       | 4     | 8    | 16       | 16     | 8        | 8        | 32         | 15       | 1    | 16               |

Version: Version del protocolo

Flags: campo sin banderas definidas

Checksum: Representa el Checksum standar TCP/UDP

Length: Representa la longitud del paquete

Send TTL:  Representando el time to live con el que se ha enviado el mensaje

Type: Tiene los posibles valores de los tipos de mensajes

Message: Provee una etiqueta compartida por todos los fragmentos de un mensaje

MF: Se coloca siempre en uno para todos los fragmentos excepto el ultimo, indica que faltan mensajes por llegar

Fragment offset: Desplazamiento de los fragmentos del mensaje

# DSCP

Es una arquitectura de redes de ordenadores que especifica un simple mecanismo para clasificar y administrar el trafico de una red para poder brindar calidad de servicio en redes IP modernas.

Este protocolo utiliza 6 bits(differentiated services code point) en los 8 bits de DS field (esto es algo que reemplaza el TOS en los antiguos IPv4).

l tráfico de red que ingresa a un dominio DiffServ está sujeto a clasificación y condicionamiento. Un clasificador de tráfico puede inspeccionar muchos parámetros diferentes en los paquetes entrantes, como la dirección de origen, la dirección de destino o el tipo de tráfico y asignar paquetes individuales a una clase de tráfico específica. Los clasificadores de tráfico pueden respetar cualquier marca DiffServ en los paquetes recibidos o pueden optar por ignorar o anular esas marcas. Para un control estricto de los volúmenes y el tipo de tráfico en una clase dada, un operador de red puede optar por no cumplir con las marcas en el ingreso al dominio DiffServ. El tráfico en cada clase puede ser condicionado aún más si se somete el tráfico a limitadores de velocidad, agentes de control de tráfico o modeladores. 

El comportamiento por salto está determinado por el campo DS en el encabezado IP. El campo DS contiene el valor DSCP de 6 bits. La Notificación de congestión explícita (ECN) ocupa los 2 bits menos significativos del campo TOS de IPv4 y el campo de clase de tráfico (TC) de IPv6.

En teoría, una red podría tener hasta 64 clases de tráfico diferentes utilizando los 64 valores DSCP disponibles. Las RFC de DiffServ recomiendan, pero no requieren, ciertas codificaciones. Esto le da a un operador de red una gran flexibilidad para definir las clases de tráfico. Sin embargo, en la práctica, la mayoría de las redes utilizan los siguientes comportamientos por salto definidos comúnmente:

+ Default forwarding: Este es normalmente el trafico de best effort
+ Expedited forwarding: Trafico de baja perdida y baja latencia
+ Assured forwarding: Asegurar que se envien los mensajes
+ Class selector: Mantiene compatibilidad con los campos IP

# GLBP

> Gateway Load Balancing Protocol

Es un protocolo propietario de CISCO que intenta superar las limitaciones de todos los protocolos que existian hasta el momento para la redundancia de los routers, ademas de agregar load balancing. Ademas de que este protocolo es capaz de establecer prioridades en los routers de pasarela tambien puede crear la ponderacion para los routers intermedios.



En GLBP se elige una puerta de enlace virtual activo ~~AVG~~ para cada grupo. otros miembros del grupo actuan como respaldo en caso de fallo del AVG. aqui se utilizan hello y hold timers para determinar el momento en que se va a cambiar de AVG en caso de que exista un problema con esto.