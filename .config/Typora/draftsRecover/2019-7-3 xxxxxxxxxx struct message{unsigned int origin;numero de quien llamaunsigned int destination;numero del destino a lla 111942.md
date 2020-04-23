``` c
struct message{
unsigned int origin;//numero de quien llama
unsigned int destination;//numero del destino a llamar
unsigned int protocol;//Para version del protocolo
bool request;// True: request; False: Response
unsigned int type:4;//tipo de mensaje o tipo de respuesta
unsigned int answer:4;//para definir mas informacion sobre el mensaje
unsigned int payloadsize;//Sizeof(payload)
char* payload;//puntero a el mensaje carga. el mensaje carga es un JSON
}msg;
```
| origin | destination | protocol | request | type | answer | payloadsize |     payload     |
| :----: | :---------: | :------: | :-----: | :--: | :----: | :---------: | :-------------: |
|   8    |      8      |    8     |    1    |  4   |   4    |      8      | ~~payloadsize~~ |

