# CHAN_SIP.C

## Que es un channel driver?

Un driver de canal es básicamente lo que le permite a un dispositivo o software comunicarse vía algún protocolo.

## De donde viene chan sip?

Este fue desarrollado al los inicios de SIP, básicamente era el único que existía antes del 2014, momento cuando con Asterisk 12 aparecio el PJSIP que es otro canal para SIP

## Que es?

Puesto de la forma mas entendible posible este es un API que nos da la habilidad de hablar SIP. Este es un programa en `C` con una documentacion que explica lo que hace cada una de las partes del programa.

+ SIP DtmfMode
+ SIP Add Header
+ SIP Remove Header
+ SIP Send Custom Info
+ SIP_HEADER
+ SIPPEER
+ CHECKSIPDOMAIN

Estas son todas las funciones principales del código en C de este driver, como se puede observar cubre todo lo mas necesario como API para enviar y recibir mensajes SIP y extraer la información de los mensajes INVITE que se han recibido, este programa es altamente complejo y tiene un total de `35,822` lineas de código en su ultima versión actualización en GitHub.

![chan_sip.c](/home/josuer08/Pictures/chansip.png)

