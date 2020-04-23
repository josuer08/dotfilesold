| **PONTIFICIA UNIVERSIDAD CATÓLICA MADRE Y MAESTRA** |
| :-------------------------------------------------: |
|      **Facultad de Ciencias de la Ingeniería**      |
|      **Departamento de Ingeniería Telemática**      |
|    **ITT-564-T-001 Diseño y Seguridad de Redes**    |
|           **Tarea:** **Explorando NMAP**            |

[TOC]



# Partes A y B

+ De la siguiente lista de Comandos deben elegir 5 opciones para realizar sus respectivos análisis con NMAP (versión Kali Linux), deben subir capturas de pantalla y explicar lo que realiza cada opción.
  1. nmap -A x.x.x.x
  2. nmap -sA x.x.x.x
  3. nmap -v -sS -O x.x.x.x
  4. nmap -v -sU O x.x.x.x
  5. nmap -v -sF O x.x.x.x
+ Realice dos pruebas más con opciones no listadas en el punto anterior, realizar sus respectivos análisis con NMAP (versión Kali Linux), deben subir capturas de pantalla y explicar lo que realiza cada opción.

> Se utilizaron IP de la red local para estas partes de la practica

<p style="color:red;">Para la realizacion de estas dos primeras partes de la practica se utilizo el siguiente script par aautomatizar y almacenar las capturas:</p>

```sh
#!/bin/bash
echo "El primer scan que tendremos es el modo '-A' el cual habilita el escaneo de sistema operativo, deteccion de version, escaneo de script y trazado de ruta" >> logfile;
echo primero;
sudo nmap -A 10.0.0.1/24 >> logfile;
echo "Ahora en este scan '-sA' que esta creado para poder determinar las reglas de un firewall, ya que no revisa si un puerto esta abierto o filtrado, determina si un puerto es statefull o no, es decir, si son alcanzables o no, independientemente de que esten abiertos" >> logfile;
echo segundo;
sudo nmap -sA 10.0.0.1/24 >> logfile;
echo "Ahora una busqueda con el metodo SYN connect, en modo vervoso y con busqueda de sistema operativo" >> logfile;
echo tercero;
sudo nmap -v -sS -O 10.0.0.1/24 >> logfile;
echo "Ahora un scan UDP tambien con escaneo de sistema operativo" >> logfile;
echo cuarto;
sudo nmap -v -sU -O 10.0.0.1/24 >> logfile;
echo "Este es un escaneo de tipo FIN con escaneo de sistema operativo activado" >> logfile;
echo quinto;
sudo nmap -v -sF -O 10.0.0.1/24 >> logfile;
echo "Este es un modo de 'tracear' la ruta a cada equipo que se logro escanear en la red" >> logfile;
echo sexto;
sudo nmap -v --traceroute -O 10.0.0.1/24 >> logfile;
echo "Este ultimo no escanea los puertos, solo detecta los host que se encuentran activos" >> logfile;
echo septimo;
sudo nmap -sn 10.0.0.1/24 >> logfile;
echo "" >> logfile;

```

## A1

_El primer scan que tendremos es el modo '-A' el cual habilita el escaneo de sistema operativo, deteccion de version, escaneo de script y trazado de ruta:_

```bash

Starting Nmap 7.70 ( https://nmap.org ) at 2019-10-04 13:25 EDT
Nmap scan report for 10.0.0.1
Host is up (0.0017s latency).
Not shown: 995 closed ports
PORT   STATE    SERVICE  VERSION
21/tcp filtered ftp
22/tcp filtered ssh
23/tcp filtered telnet
53/tcp open     domain   (generic dns response: NOTIMP)
| fingerprint-strings: 
|   DNSVersionBindReqTCP: 
|     version
|_    bind
80/tcp open     ssl/http
| fingerprint-strings: 
|   FourOhFourRequest, GetRequest: 
|     HTTP/1.1 400 Bad Request
|     Connection: Keep-Alive
|   GenericLines: 
|     HTTP/1.1 404 Not Found
|     Connection: Keep-Alive
|     requested URL was not found on this server.
|   HTTPOptions, RTSPRequest, SIPOptions: 
|     HTTP/1.1 404 Not Found
|     Content-Type:text/html
|     Pragma:no-cache
|     Cache-control:no-cache, no-store, max-age=0
|     Transfer-Encoding:chunked
|     X-Frame-Options:SAMEORIGIN
|     Connection:Keep-Alive
|_    requested URL was not found on this server.
|_http-title: Site doesn't have a title (text/html).
| ssl-cert: Subject: commonName=Huawei Technologies Co., Ltd/organizationName=Huawei Technologies Co., Ltd/stateOrProvinceName=Guangdong/countryName=CN
| Not valid before: 2014-12-05T10:33:44
|_Not valid after:  2024-12-04T10:33:44
|_ssl-date: TLS randomness does not represent time
2 services unrecognized despite returning data. If you know the service/version, please submit the following fingerprints at https://nmap.org/cgi-bin/submit.cgi?new-service :
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port53-TCP:V=7.70%I=7%D=10/4%Time=5D97811A%P=x86_64-pc-linux-gnu%r(DNSV
SF:ersionBindReqTCP,20,"\0\x1e\0\x06\x81\x85\0\x01\0\0\0\0\0\0\x07version\
SF:x04bind\0\0\x10\0\x03")%r(DNSStatusRequestTCP,E,"\0\x0c\0\0\x90\x84\0\0
SF:\0\0\0\0\0\0");
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port80-TCP:V=7.70%T=SSL%I=7%D=10/4%Time=5D97811C%P=x86_64-pc-linux-gnu%
SF:r(GenericLines,67,"HTTP/1\.1\x20404\x20Not\x20Found\r\nConnection:\x20K
SF:eep-Alive\r\n\r\n2f\r\nThe\x20requested\x20URL\x20was\x20not\x20found\x
SF:20on\x20this\x20server\.\r\n")%r(GetRequest,39,"HTTP/1\.1\x20400\x20Bad
SF:\x20Request\r\nConnection:\x20Keep-Alive\r\n\r\n0\r\n\r\n")%r(HTTPOptio
SF:ns,F8,"HTTP/1\.1\x20404\x20Not\x20Found\r\nContent-Type:text/html\r\nPr
SF:agma:no-cache\r\nCache-control:no-cache,\x20no-store,\x20max-age=0\r\nT
SF:ransfer-Encoding:chunked\r\nX-Frame-Options:SAMEORIGIN\r\nConnection:Ke
SF:ep-Alive\r\n\r\n2f\r\nThe\x20requested\x20URL\x20was\x20not\x20found\x2
SF:0on\x20this\x20server\.\r\n0\r\n\r\n")%r(RTSPRequest,F8,"HTTP/1\.1\x204
SF:04\x20Not\x20Found\r\nContent-Type:text/html\r\nPragma:no-cache\r\nCach
SF:e-control:no-cache,\x20no-store,\x20max-age=0\r\nTransfer-Encoding:chun
SF:ked\r\nX-Frame-Options:SAMEORIGIN\r\nConnection:Keep-Alive\r\n\r\n2f\r\
SF:nThe\x20requested\x20URL\x20was\x20not\x20found\x20on\x20this\x20server
SF:\.\r\n0\r\n\r\n")%r(FourOhFourRequest,39,"HTTP/1\.1\x20400\x20Bad\x20Re
SF:quest\r\nConnection:\x20Keep-Alive\r\n\r\n0\r\n\r\n")%r(SIPOptions,F8,"
SF:HTTP/1\.1\x20404\x20Not\x20Found\r\nContent-Type:text/html\r\nPragma:no
SF:-cache\r\nCache-control:no-cache,\x20no-store,\x20max-age=0\r\nTransfer
SF:-Encoding:chunked\r\nX-Frame-Options:SAMEORIGIN\r\nConnection:Keep-Aliv
SF:e\r\n\r\n2f\r\nThe\x20requested\x20URL\x20was\x20not\x20found\x20on\x20
SF:this\x20server\.\r\n0\r\n\r\n");
MAC Address: 7C:A2:3E:49:AA:16 (Huawei Technologies)
No exact OS matches for host (If you know what OS is running on it, see https://nmap.org/submit/ ).
TCP/IP fingerprint:
OS:SCAN(V=7.70%E=4%D=10/4%OT=53%CT=1%CU=41796%PV=Y%DS=1%DC=D%G=Y%M=7CA23E%T
OS:M=5D978154%P=x86_64-pc-linux-gnu)SEQ(SP=FF%GCD=1%ISR=106%TI=Z%CI=I%TS=7)
OS:SEQ(SP=FF%GCD=1%ISR=106%TI=Z%CI=RI%II=I%TS=7)OPS(O1=M5B4ST11NW2%O2=M5B4S
OS:T11NW2%O3=M5B4NNT11NW2%O4=M5B4ST11NW2%O5=M5B4ST11NW2%O6=M5B4ST11)WIN(W1=
OS:3890%W2=3890%W3=3890%W4=3890%W5=3890%W6=3890)ECN(R=Y%DF=Y%T=40%W=3908%O=
OS:M5B4NNSNW2%CC=Y%Q=)T1(R=Y%DF=Y%T=40%S=O%A=S+%F=AS%RD=0%Q=)T2(R=N)T3(R=N)
OS:T4(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T5(R=Y%DF=Y%T=40%W=0%S=Z%A=S
OS:+%F=AR%O=%RD=0%Q=)T6(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T7(R=N)U1(
OS:R=Y%DF=N%T=40%IPL=164%UN=0%RIPL=G%RID=G%RIPCK=G%RUCK=G%RUD=G)IE(R=Y%DFI=
OS:N%T=40%CD=S)

Network Distance: 1 hop

TRACEROUTE
HOP RTT     ADDRESS
1   1.67 ms 10.0.0.1

Nmap scan report for 10.0.0.2
Host is up (0.0082s latency).
Not shown: 998 closed ports
PORT     STATE SERVICE VERSION
8080/tcp open  http    T-Home Telekom Media Receiver httpd
|_http-title: Site doesn't have a title.
8086/tcp open  http    Microsoft Mediaroom httpd (IPTV tuner)
| http-auth: 
| HTTP/1.1 401 Unauthorized\x0D
|_  Server returned status 401 but no WWW-Authenticate header.
|_http-title: Site doesn't have a title.
MAC Address: 50:39:55:EC:0E:6D (Cisco Spvtg)
Device type: media device
Running: Motorola embedded, Telekom embedded
OS CPE: cpe:/h:motorola:vip1232 cpe:/h:telekom:mr_303
OS details: Motorola VIP1232 digital set top box or Telekom Media Receiver MR 303
Network Distance: 1 hop
Service Info: Device: media device

TRACEROUTE
HOP RTT     ADDRESS
1   8.18 ms 10.0.0.2

Nmap scan report for 10.0.0.232
Host is up (-0.048s latency).
All 1000 scanned ports on 10.0.0.232 are filtered
MAC Address: B8:1D:AA:E5:F8:B0 (LG Electronics (Mobile Communications))
Too many fingerprints match this host to give specific OS details
Network Distance: 1 hop

TRACEROUTE
HOP RTT ADDRESS
1   --  10.0.0.232

Nmap scan report for 10.0.0.4
Host is up (0.000040s latency).
All 1000 scanned ports on 10.0.0.4 are closed
Too many fingerprints match this host to give specific OS details
Network Distance: 0 hops

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 256 IP addresses (4 hosts up) scanned in 235.61 seconds
```

## A2

_Ahora en este scan '-sA' que esta creado para poder determinar las reglas de un firewall, ya que no revisa si un puerto esta abierto o filtrado, determina si un puerto es statefull o no, es decir, si son alcanzables o no, independientemente de que esten abiertos:_

```bash
Starting Nmap 7.70 ( https://nmap.org ) at 2019-10-04 13:28 EDT
Nmap scan report for 10.0.0.1
Host is up (0.0021s latency).
Not shown: 997 unfiltered ports
PORT   STATE    SERVICE
21/tcp filtered ftp
22/tcp filtered ssh
23/tcp filtered telnet
MAC Address: 7C:A2:3E:49:AA:16 (Huawei Technologies)

Nmap scan report for 10.0.0.2
Host is up (0.0099s latency).
All 1000 scanned ports on 10.0.0.2 are unfiltered
MAC Address: 50:39:55:EC:0E:6D (Cisco Spvtg)

Nmap scan report for 10.0.0.5
Host is up (0.058s latency).
All 1000 scanned ports on 10.0.0.5 are unfiltered
MAC Address: A0:CC:2B:8D:67:C6 (Murata Manufacturing)

Nmap scan report for 10.0.0.232
Host is up (0.14s latency).
All 1000 scanned ports on 10.0.0.232 are unfiltered
MAC Address: B8:1D:AA:E5:F8:B0 (LG Electronics (Mobile Communications))

Nmap scan report for 10.0.0.4
Host is up (0.000027s latency).
All 1000 scanned ports on 10.0.0.4 are unfiltered

Nmap done: 256 IP addresses (5 hosts up) scanned in 455.53 seconds

```



## A3

Ahora una busqueda con el metodo SYN connect, en modo vervoso y con busqueda de sistema operativo:_

```bash
Starting Nmap 7.70 ( https://nmap.org ) at 2019-10-04 13:36 EDT
Initiating ARP Ping Scan at 13:36
Scanning 255 hosts [1 port/host]
Completed ARP Ping Scan at 13:36, 2.46s elapsed (255 total hosts)
Initiating Parallel DNS resolution of 255 hosts. at 13:36
Completed Parallel DNS resolution of 255 hosts. at 13:36, 13.00s elapsed
Nmap scan report for 10.0.0.0 [host down]
Nmap scan report for 10.0.0.3 [host down]
Nmap scan report for 10.0.0.6 [host down]
Nmap scan report for 10.0.0.7 [host down]
Nmap scan report for 10.0.0.8 [host down]
(...)#continue
Nmap scan report for 10.0.0.254 [host down]
Nmap scan report for 10.0.0.255 [host down]
Initiating Parallel DNS resolution of 1 host. at 13:36
Completed Parallel DNS resolution of 1 host. at 13:37, 13.00s elapsed
Initiating SYN Stealth Scan at 13:37
Scanning 4 hosts [1000 ports/host]
Discovered open port 80/tcp on 10.0.0.1
Discovered open port 53/tcp on 10.0.0.1
Discovered open port 8080/tcp on 10.0.0.2
Increasing send delay for 10.0.0.1 from 0 to 5 due to 11 out of 34 dropped probes since last increase.
Increasing send delay for 10.0.0.2 from 0 to 5 due to 13 out of 41 dropped probes since last increase.
Increasing send delay for 10.0.0.232 from 0 to 5 due to 13 out of 41 dropped probes since last increase.
Increasing send delay for 10.0.0.5 from 0 to 5 due to 35 out of 115 dropped probes since last increase.
Increasing send delay for 10.0.0.232 from 5 to 10 due to 11 out of 36 dropped probes since last increase.
Increasing send delay for 10.0.0.1 from 5 to 10 due to 11 out of 32 dropped probes since last increase.
Increasing send delay for 10.0.0.232 from 10 to 20 due to 11 out of 30 dropped probes since last increase.
Increasing send delay for 10.0.0.1 from 10 to 20 due to 11 out of 29 dropped probes since last increase.
Increasing send delay for 10.0.0.2 from 5 to 10 due to max_successful_tryno increase to 4
Increasing send delay for 10.0.0.1 from 20 to 40 due to 11 out of 24 dropped probes since last increase.
Increasing send delay for 10.0.0.232 from 20 to 40 due to 11 out of 27 dropped probes since last increase.
Increasing send delay for 10.0.0.2 from 10 to 20 due to 11 out of 26 dropped probes since last increase.
Increasing send delay for 10.0.0.232 from 40 to 80 due to 11 out of 27 dropped probes since last increase.
Increasing send delay for 10.0.0.1 from 40 to 80 due to 11 out of 26 dropped probes since last increase.
Increasing send delay for 10.0.0.2 from 20 to 40 due to 11 out of 27 dropped probes since last increase.
Increasing send delay for 10.0.0.232 from 80 to 160 due to max_successful_tryno increase to 4
Increasing send delay for 10.0.0.5 from 5 to 10 due to max_successful_tryno increase to 4
Increasing send delay for 10.0.0.2 from 40 to 80 due to 11 out of 19 dropped probes since last increase.
Increasing send delay for 10.0.0.2 from 80 to 160 due to max_successful_tryno increase to 5
Increasing send delay for 10.0.0.5 from 10 to 20 due to 11 out of 22 dropped probes since last increase.
Increasing send delay for 10.0.0.1 from 80 to 160 due to 11 out of 20 dropped probes since last increase.
Increasing send delay for 10.0.0.1 from 160 to 320 due to max_successful_tryno increase to 4
Increasing send delay for 10.0.0.5 from 20 to 40 due to max_successful_tryno increase to 5
Increasing send delay for 10.0.0.5 from 40 to 80 due to 11 out of 32 dropped probes since last increase.
Increasing send delay for 10.0.0.5 from 80 to 160 due to 11 out of 36 dropped probes since last increase.
SYN Stealth Scan Timing: About 22.66% done; ETC: 13:39 (0:01:46 remaining)
Increasing send delay for 10.0.0.5 from 160 to 320 due to 64 out of 213 dropped probes since last increase.
SYN Stealth Scan Timing: About 55.96% done; ETC: 13:40 (0:01:28 remaining)
Discovered open port 8086/tcp on 10.0.0.2
SYN Stealth Scan Timing: About 67.87% done; ETC: 13:40 (0:01:07 remaining)
SYN Stealth Scan Timing: About 79.95% done; ETC: 13:40 (0:00:43 remaining)
Completed SYN Stealth Scan against 10.0.0.2 in 198.04s (3 hosts left)
Completed SYN Stealth Scan against 10.0.0.232 in 198.04s (2 hosts left)
Completed SYN Stealth Scan against 10.0.0.5 in 274.04s (1 host left)
Completed SYN Stealth Scan at 13:42, 304.52s elapsed (4000 total ports)
Initiating OS detection (try #1) against 4 hosts
Retrying OS detection (try #2) against 3 hosts
Retrying OS detection (try #3) against 10.0.0.1
Retrying OS detection (try #4) against 10.0.0.1
Retrying OS detection (try #5) against 10.0.0.1
Nmap scan report for 10.0.0.1
Host is up (0.0016s latency).
Not shown: 995 closed ports
PORT   STATE    SERVICE
21/tcp filtered ftp
22/tcp filtered ssh
23/tcp filtered telnet
53/tcp open     domain
80/tcp open     http
MAC Address: 7C:A2:3E:49:AA:16 (Huawei Technologies)
No exact OS matches for host (If you know what OS is running on it, see https://nmap.org/submit/ ).
TCP/IP fingerprint:
OS:SCAN(V=7.70%E=4%D=10/4%OT=53%CT=1%CU=31413%PV=Y%DS=1%DC=D%G=Y%M=7CA23E%T
OS:M=5D97847A%P=x86_64-pc-linux-gnu)SEQ(SP=FE%GCD=1%ISR=10C%TI=Z%CI=I%TS=7)
OS:SEQ(SP=FE%GCD=1%ISR=10C%TI=Z%CI=I%II=I%TS=7)OPS(O1=M5B4ST11NW2%O2=M5B4ST
OS:11NW2%O3=M5B4NNT11NW2%O4=M5B4ST11NW2%O5=M5B4ST11NW2%O6=M5B4ST11)WIN(W1=3
OS:890%W2=3890%W3=3890%W4=3890%W5=3890%W6=3890)ECN(R=Y%DF=Y%T=40%W=3908%O=M
OS:5B4NNSNW2%CC=Y%Q=)T1(R=Y%DF=Y%T=40%S=O%A=S+%F=AS%RD=0%Q=)T2(R=N)T3(R=N)T
OS:4(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T5(R=Y%DF=Y%T=40%W=0%S=Z%A=S+
OS:%F=AR%O=%RD=0%Q=)T6(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T7(R=N)U1(R
OS:=Y%DF=N%T=40%IPL=164%UN=0%RIPL=G%RID=G%RIPCK=G%RUCK=G%RUD=G)IE(R=Y%DFI=N
OS:%T=40%CD=S)

Uptime guess: 5.049 days (since Sun Sep 29 12:31:11 2019)
Network Distance: 1 hop
TCP Sequence Prediction: Difficulty=254 (Good luck!)
IP ID Sequence Generation: All zeros

Nmap scan report for 10.0.0.2
Host is up (0.019s latency).
Not shown: 998 closed ports
PORT     STATE SERVICE
8080/tcp open  http-proxy
8086/tcp open  d-s-n
MAC Address: 50:39:55:EC:0E:6D (Cisco Spvtg)
Device type: media device
Running: Motorola embedded, Telekom embedded
OS CPE: cpe:/h:motorola:vip1232 cpe:/h:telekom:mr_303
OS details: Motorola VIP1232 digital set top box or Telekom Media Receiver MR 303
Network Distance: 1 hop
TCP Sequence Prediction: Difficulty=141 (Good luck!)
IP ID Sequence Generation: Incremental

Nmap scan report for 10.0.0.5
Host is up (0.023s latency).
All 1000 scanned ports on 10.0.0.5 are closed
MAC Address: A0:CC:2B:8D:67:C6 (Murata Manufacturing)
Too many fingerprints match this host to give specific OS details
Network Distance: 1 hop

Nmap scan report for 10.0.0.232
Host is up (0.043s latency).
All 1000 scanned ports on 10.0.0.232 are closed
MAC Address: B8:1D:AA:E5:F8:B0 (LG Electronics (Mobile Communications))
Too many fingerprints match this host to give specific OS details
Network Distance: 1 hop

Initiating SYN Stealth Scan at 13:42
Scanning 10.0.0.4 [1000 ports]
Completed SYN Stealth Scan at 13:42, 1.58s elapsed (1000 total ports)
Initiating OS detection (try #1) against 10.0.0.4
Retrying OS detection (try #2) against 10.0.0.4
WARNING: OS didn't match until try #2
Nmap scan report for 10.0.0.4
Host is up (0.000028s latency).
All 1000 scanned ports on 10.0.0.4 are closed
Device type: remote management|phone|general purpose|webcam|storage-misc
Running: Avocent embedded, Google Android 2.X, Linux 2.6.X, AXIS embedded, ZyXEL embedded
OS CPE: cpe:/o:google:android:2.2 cpe:/o:linux:linux_kernel:2.6 cpe:/o:linux:linux_kernel:2.6.17 cpe:/h:axis:210a_network_camera cpe:/h:axis:211_network_camera cpe:/h:zyxel:nsa-210
Too many fingerprints match this host to give specific OS details
Network Distance: 0 hops

Read data files from: /usr/bin/../share/nmap
OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 256 IP addresses (5 hosts up) scanned in 350.78 seconds
           Raw packets sent: 6939 (311.924KB) | Rcvd: 7534 (340.930KB)
```

## A4

_Ahora un scan UDP tambien con escaneo de sistema operativo:_

```bash
Starting Nmap 7.70 ( https://nmap.org ) at 2019-10-04 13:42 EDT
Initiating ARP Ping Scan at 13:42
Scanning 255 hosts [1 port/host]
Completed ARP Ping Scan at 13:42, 2.06s elapsed (255 total hosts)
Initiating Parallel DNS resolution of 255 hosts. at 13:42
Completed Parallel DNS resolution of 255 hosts. at 13:42, 13.00s elapsed
Nmap scan report for 10.0.0.0 [host down]
Nmap scan report for 10.0.0.3 [host down]
(...)#continue
Nmap scan report for 10.0.0.251 [host down]
Nmap scan report for 10.0.0.252 [host down]
Nmap scan report for 10.0.0.253 [host down]
Nmap scan report for 10.0.0.254 [host down]
Nmap scan report for 10.0.0.255 [host down]
Initiating Parallel DNS resolution of 1 host. at 13:42
Completed Parallel DNS resolution of 1 host. at 13:42, 13.00s elapsed
Initiating UDP Scan at 13:42
Scanning 4 hosts [1000 ports/host]
Increasing send delay for 10.0.0.2 from 0 to 50 due to 22 out of 73 dropped probes since last increase.
Discovered open port 53/udp on 10.0.0.1
Increasing send delay for 10.0.0.2 from 50 to 100 due to 17 out of 55 dropped probes since last increase.
Increasing send delay for 10.0.0.5 from 0 to 50 due to max_successful_tryno increase to 4
Increasing send delay for 10.0.0.1 from 0 to 50 due to max_successful_tryno increase to 4
Increasing send delay for 10.0.0.232 from 0 to 50 due to max_successful_tryno increase to 4
Increasing send delay for 10.0.0.5 from 50 to 100 due to max_successful_tryno increase to 5
Increasing send delay for 10.0.0.2 from 100 to 200 due to 11 out of 23 dropped probes since last increase.
Increasing send delay for 10.0.0.1 from 50 to 100 due to max_successful_tryno increase to 5
Increasing send delay for 10.0.0.232 from 50 to 100 due to max_successful_tryno increase to 5
Increasing send delay for 10.0.0.1 from 100 to 200 due to max_successful_tryno increase to 6
Increasing send delay for 10.0.0.232 from 100 to 200 due to max_successful_tryno increase to 6
Increasing send delay for 10.0.0.5 from 100 to 200 due to max_successful_tryno increase to 6
Increasing send delay for 10.0.0.232 from 200 to 400 due to max_successful_tryno increase to 7
Increasing send delay for 10.0.0.5 from 200 to 400 due to max_successful_tryno increase to 7
Increasing send delay for 10.0.0.5 from 400 to 800 due to max_successful_tryno increase to 8
Increasing send delay for 10.0.0.1 from 200 to 400 due to 11 out of 11 dropped probes since last increase.
Increasing send delay for 10.0.0.232 from 400 to 800 due to 11 out of 12 dropped probes since last increase.
UDP Scan Timing: About 9.58% done; ETC: 13:48 (0:04:53 remaining)
Increasing send delay for 10.0.0.1 from 400 to 800 due to 11 out of 12 dropped probes since last increase.
Increasing send delay for 10.0.0.2 from 200 to 400 due to max_successful_tryno increase to 4
UDP Scan Timing: About 14.34% done; ETC: 13:49 (0:06:05 remaining)
Increasing send delay for 10.0.0.232 from 800 to 1000 due to 16 out of 52 dropped probes since last increase.
UDP Scan Timing: About 18.31% done; ETC: 13:51 (0:06:46 remaining)
UDP Scan Timing: About 25.42% done; ETC: 14:14 (0:23:22 remaining)
UDP Scan Timing: About 28.98% done; ETC: 14:12 (0:20:45 remaining)
UDP Scan Timing: About 32.71% done; ETC: 14:10 (0:18:27 remaining)
UDP Scan Timing: About 36.66% done; ETC: 14:08 (0:16:21 remaining)
UDP Scan Timing: About 40.43% done; ETC: 14:07 (0:14:41 remaining)
UDP Scan Timing: About 44.38% done; ETC: 14:06 (0:13:07 remaining)
UDP Scan Timing: About 48.37% done; ETC: 14:05 (0:11:42 remaining)
Stats: 0:11:35 elapsed; 251 hosts completed (4 up), 4 undergoing UDP Scan
UDP Scan Timing: About 49.39% done; ETC: 14:05 (0:11:23 remaining)
Stats: 0:11:37 elapsed; 251 hosts completed (4 up), 4 undergoing UDP Scan
UDP Scan Timing: About 49.79% done; ETC: 14:05 (0:11:15 remaining)
Completed UDP Scan against 10.0.0.2 in 694.61s (3 hosts left)
UDP Scan Timing: About 54.13% done; ETC: 14:04 (0:10:05 remaining)
UDP Scan Timing: About 59.52% done; ETC: 14:04 (0:08:57 remaining)
UDP Scan Timing: About 64.80% done; ETC: 14:05 (0:07:49 remaining)
UDP Scan Timing: About 70.10% done; ETC: 14:05 (0:06:40 remaining)
UDP Scan Timing: About 75.35% done; ETC: 14:05 (0:05:31 remaining)
UDP Scan Timing: About 80.63% done; ETC: 14:05 (0:04:24 remaining)
UDP Scan Timing: About 86.17% done; ETC: 14:06 (0:03:15 remaining)
UDP Scan Timing: About 91.56% done; ETC: 14:07 (0:02:03 remaining)
Completed UDP Scan against 10.0.0.232 in 1392.86s (2 hosts left)
Completed UDP Scan against 10.0.0.1 in 1417.49s (1 host left)
UDP Scan Timing: About 92.84% done; ETC: 14:08 (0:01:52 remaining)
UDP Scan Timing: About 93.03% done; ETC: 14:10 (0:01:58 remaining)
UDP Scan Timing: About 93.23% done; ETC: 14:13 (0:02:03 remaining)
UDP Scan Timing: About 93.43% done; ETC: 14:15 (0:02:07 remaining)
Increasing send delay for 10.0.0.5 from 800 to 1000 due to 230 out of 765 dropped probes since last increase.
UDP Scan Timing: About 93.64% done; ETC: 14:17 (0:02:12 remaining)
UDP Scan Timing: About 93.87% done; ETC: 14:19 (0:02:16 remaining)
UDP Scan Timing: About 94.10% done; ETC: 14:22 (0:02:19 remaining)
UDP Scan Timing: About 94.33% done; ETC: 14:24 (0:02:21 remaining)
UDP Scan Timing: About 94.57% done; ETC: 14:26 (0:02:23 remaining)
UDP Scan Timing: About 94.81% done; ETC: 14:29 (0:02:25 remaining)
UDP Scan Timing: About 95.06% done; ETC: 14:31 (0:02:25 remaining)
UDP Scan Timing: About 95.30% done; ETC: 14:34 (0:02:25 remaining)
UDP Scan Timing: About 95.54% done; ETC: 14:36 (0:02:24 remaining)
UDP Scan Timing: About 95.78% done; ETC: 14:39 (0:02:22 remaining)
UDP Scan Timing: About 96.03% done; ETC: 14:41 (0:02:20 remaining)
UDP Scan Timing: About 96.26% done; ETC: 14:43 (0:02:17 remaining)
UDP Scan Timing: About 96.49% done; ETC: 14:45 (0:02:13 remaining)
UDP Scan Timing: About 96.71% done; ETC: 14:48 (0:02:09 remaining)
UDP Scan Timing: About 96.93% done; ETC: 14:50 (0:02:04 remaining)
UDP Scan Timing: About 97.14% done; ETC: 14:52 (0:01:59 remaining)
UDP Scan Timing: About 97.34% done; ETC: 14:54 (0:01:54 remaining)
UDP Scan Timing: About 97.53% done; ETC: 14:56 (0:01:48 remaining)
UDP Scan Timing: About 97.72% done; ETC: 14:57 (0:01:43 remaining)
UDP Scan Timing: About 97.89% done; ETC: 14:59 (0:01:37 remaining)
UDP Scan Timing: About 98.06% done; ETC: 15:01 (0:01:31 remaining)
UDP Scan Timing: About 98.21% done; ETC: 15:02 (0:01:25 remaining)
UDP Scan Timing: About 98.36% done; ETC: 15:03 (0:01:20 remaining)
Stats: 1:21:05 elapsed; 251 hosts completed (4 up), 4 undergoing UDP Scan
UDP Scan Timing: About 98.69% done; ETC: 15:04 (0:01:04 remaining)
Completed UDP Scan at 15:04, 4919.98s elapsed (4000 total ports)
Initiating OS detection (try #1) against 4 hosts
Retrying OS detection (try #2) against 4 hosts
Nmap scan report for 10.0.0.1
Host is up (0.0026s latency).
Not shown: 997 closed ports
PORT     STATE         SERVICE
53/udp   open          domain
67/udp   open|filtered dhcps
1900/udp open|filtered upnp
MAC Address: 7C:A2:3E:49:AA:16 (Huawei Technologies)
Too many fingerprints match this host to give specific OS details
Network Distance: 1 hop

Nmap scan report for 10.0.0.2
Host is up (0.028s latency).
Not shown: 993 closed ports
PORT     STATE         SERVICE
67/udp   open|filtered dhcps
68/udp   open|filtered dhcpc
112/udp  open|filtered mcidas
1026/udp open|filtered win-rpc
1031/udp open|filtered iad2
1051/udp open|filtered optima-vnet
1900/udp open|filtered upnp
MAC Address: 50:39:55:EC:0E:6D (Cisco Spvtg)
Too many fingerprints match this host to give specific OS details
Network Distance: 1 hop

Nmap scan report for 10.0.0.5
Host is up (0.031s latency).
All 1000 scanned ports on 10.0.0.5 are closed (751) or open|filtered (249)
MAC Address: A0:CC:2B:8D:67:C6 (Murata Manufacturing)
Too many fingerprints match this host to give specific OS details
Network Distance: 1 hop

Nmap scan report for 10.0.0.232
Host is up (0.027s latency).
Not shown: 999 closed ports
PORT     STATE         SERVICE
5353/udp open|filtered zeroconf
MAC Address: B8:1D:AA:E5:F8:B0 (LG Electronics (Mobile Communications))
Too many fingerprints match this host to give specific OS details
Network Distance: 1 hop

Initiating UDP Scan at 15:04
Scanning 10.0.0.4 [1000 ports]
Completed UDP Scan at 15:04, 2.69s elapsed (1000 total ports)
Initiating OS detection (try #1) against 10.0.0.4
Retrying OS detection (try #2) against 10.0.0.4
WARNING: OS didn't match until try #2
Nmap scan report for 10.0.0.4
Host is up (0.000032s latency).
Not shown: 997 closed ports
PORT     STATE         SERVICE
68/udp   open|filtered dhcpc
631/udp  open|filtered ipp
5353/udp open|filtered zeroconf
Device type: remote management|phone|general purpose|webcam|storage-misc
Running: Avocent embedded, Google Android 2.X, Linux 2.6.X, AXIS embedded, ZyXEL embedded
OS CPE: cpe:/o:google:android:2.2 cpe:/o:linux:linux_kernel:2.6 cpe:/o:linux:linux_kernel:2.6.17 cpe:/h:axis:210a_network_camera cpe:/h:axis:211_network_camera cpe:/h:zyxel:nsa-210
Too many fingerprints match this host to give specific OS details
Network Distance: 0 hops

Read data files from: /usr/bin/../share/nmap
OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 256 IP addresses (5 hosts up) scanned in 4956.45 seconds
           Raw packets sent: 9736 (292.769KB) | Rcvd: 6841 (405.495KB)
```

## A5

_Este es un escaneo de tipo FIN con escaneo de sistema operativo activado:_

```bash
Starting Nmap 7.70 ( https://nmap.org ) at 2019-10-04 15:09 EDT
Initiating ARP Ping Scan at 15:09
Scanning 255 hosts [1 port/host]
Completed ARP Ping Scan at 15:09, 5.54s elapsed (255 total hosts)
Initiating Parallel DNS resolution of 255 hosts. at 15:09
Completed Parallel DNS resolution of 255 hosts. at 15:09, 13.00s elapsed
Nmap scan report for 10.0.0.0 [host down]
Nmap scan report for 10.0.0.3 [host down]
Nmap scan report for 10.0.0.6 [host down]
Nmap scan report for 10.0.0.7 [host down]
Nmap scan report for 10.0.0.8 [host down]
Nmap scan report for 10.0.0.9 [host down]
(...)#continue
Nmap scan report for 10.0.0.251 [host down]
Nmap scan report for 10.0.0.252 [host down]
Nmap scan report for 10.0.0.253 [host down]
Nmap scan report for 10.0.0.254 [host down]
Nmap scan report for 10.0.0.255 [host down]
Initiating Parallel DNS resolution of 1 host. at 15:09
Completed Parallel DNS resolution of 1 host. at 15:09, 0.04s elapsed
Initiating FIN Scan at 15:09
Scanning 5 hosts [1000 ports/host]
Increasing send delay for 10.0.0.2 from 0 to 5 due to 26 out of 85 dropped probes since last increase.
Increasing send delay for 10.0.0.207 from 0 to 5 due to 27 out of 89 dropped probes since last increase.
Increasing send delay for 10.0.0.207 from 5 to 10 due to max_successful_tryno increase to 4
FIN Scan Timing: About 15.74% done; ETC: 15:13 (0:02:46 remaining)
Increasing send delay for 10.0.0.232 from 0 to 5 due to 11 out of 35 dropped probes since last increase.
Increasing send delay for 10.0.0.232 from 5 to 10 due to max_successful_tryno increase to 4
Increasing send delay for 10.0.0.2 from 5 to 10 due to max_successful_tryno increase to 4
Increasing send delay for 10.0.0.2 from 10 to 20 due to 11 out of 29 dropped probes since last increase.
Increasing send delay for 10.0.0.5 from 0 to 5 due to max_successful_tryno increase to 4
Increasing send delay for 10.0.0.2 from 20 to 40 due to 11 out of 18 dropped probes since last increase.
FIN Scan Timing: About 31.77% done; ETC: 15:13 (0:02:11 remaining)
Increasing send delay for 10.0.0.5 from 5 to 10 due to 12 out of 38 dropped probes since last increase.
Increasing send delay for 10.0.0.232 from 10 to 20 due to 28 out of 91 dropped probes since last increase.
Increasing send delay for 10.0.0.2 from 40 to 80 due to 11 out of 19 dropped probes since last increase.
Increasing send delay for 10.0.0.2 from 80 to 160 due to max_successful_tryno increase to 5
Increasing send delay for 10.0.0.232 from 20 to 40 due to max_successful_tryno increase to 5
Increasing send delay for 10.0.0.232 from 40 to 80 due to max_successful_tryno increase to 6
Increasing send delay for 10.0.0.5 from 10 to 20 due to 11 out of 18 dropped probes since last increase.
Increasing send delay for 10.0.0.5 from 20 to 40 due to 11 out of 21 dropped probes since last increase.
Increasing send delay for 10.0.0.2 from 160 to 320 due to 11 out of 21 dropped probes since last increase.
Increasing send delay for 10.0.0.232 from 80 to 160 due to 11 out of 27 dropped probes since last increase.
Increasing send delay for 10.0.0.5 from 40 to 80 due to 11 out of 21 dropped probes since last increase.
Increasing send delay for 10.0.0.5 from 80 to 160 due to 11 out of 22 dropped probes since last increase.
Completed FIN Scan against 10.0.0.1 in 73.75s (4 hosts left)
Increasing send delay for 10.0.0.207 from 10 to 20 due to 11 out of 12 dropped probes since last increase.
Increasing send delay for 10.0.0.5 from 160 to 320 due to max_successful_tryno increase to 5
FIN Scan Timing: About 41.43% done; ETC: 15:14 (0:02:30 remaining)
FIN Scan Timing: About 44.88% done; ETC: 15:15 (0:02:47 remaining)
Increasing send delay for 10.0.0.207 from 20 to 40 due to 11 out of 11 dropped probes since last increase.
Increasing send delay for 10.0.0.207 from 40 to 80 due to 11 out of 11 dropped probes since last increase.
FIN Scan Timing: About 59.14% done; ETC: 15:16 (0:02:30 remaining)
FIN Scan Timing: About 66.19% done; ETC: 15:16 (0:02:06 remaining)
FIN Scan Timing: About 73.09% done; ETC: 15:16 (0:01:42 remaining)
Increasing send delay for 10.0.0.207 from 80 to 160 due to 11 out of 11 dropped probes since last increase.
FIN Scan Timing: About 79.92% done; ETC: 15:16 (0:01:17 remaining)
Completed FIN Scan against 10.0.0.5 in 309.16s (3 hosts left)
Completed FIN Scan against 10.0.0.232 in 318.99s (2 hosts left)
Increasing send delay for 10.0.0.207 from 160 to 320 due to 11 out of 11 dropped probes since last increase.
Completed FIN Scan against 10.0.0.2 in 355.19s (1 host left)
FIN Scan Timing: About 84.05% done; ETC: 15:17 (0:01:13 remaining)
Increasing send delay for 10.0.0.207 from 320 to 640 due to 11 out of 11 dropped probes since last increase.
FIN Scan Timing: About 84.43% done; ETC: 15:19 (0:01:25 remaining)
Increasing send delay for 10.0.0.207 from 640 to 1000 due to 11 out of 11 dropped probes since last increase.
FIN Scan Timing: About 84.72% done; ETC: 15:20 (0:01:39 remaining)
FIN Scan Timing: About 85.02% done; ETC: 15:22 (0:01:54 remaining)
FIN Scan Timing: About 85.37% done; ETC: 15:24 (0:02:10 remaining)
FIN Scan Timing: About 85.77% done; ETC: 15:27 (0:02:28 remaining)
FIN Scan Timing: About 86.22% done; ETC: 15:30 (0:02:46 remaining)
FIN Scan Timing: About 86.73% done; ETC: 15:33 (0:03:05 remaining)
FIN Scan Timing: About 87.29% done; ETC: 15:36 (0:03:23 remaining)
FIN Scan Timing: About 87.91% done; ETC: 15:40 (0:03:40 remaining)
FIN Scan Timing: About 88.64% done; ETC: 15:44 (0:03:54 remaining)
FIN Scan Timing: About 92.99% done; ETC: 15:46 (0:02:35 remaining)
FIN Scan Timing: About 95.91% done; ETC: 15:48 (0:01:34 remaining)
FIN Scan Timing: About 97.77% done; ETC: 15:49 (0:00:53 remaining)
Completed FIN Scan at 15:50, 2434.01s elapsed (5000 total ports)
Initiating OS detection (try #1) against 5 hosts
Retrying OS detection (try #2) against 5 hosts
Nmap scan report for 10.0.0.1
Host is up (0.0016s latency).
All 1000 scanned ports on 10.0.0.1 are open|filtered
MAC Address: 7C:A2:3E:49:AA:16 (Huawei Technologies)
Too many fingerprints match this host to give specific OS details
Network Distance: 1 hop

Nmap scan report for 10.0.0.2
Host is up (0.0091s latency).
All 1000 scanned ports on 10.0.0.2 are closed
MAC Address: 50:39:55:EC:0E:6D (Cisco Spvtg)
Too many fingerprints match this host to give specific OS details
Network Distance: 1 hop

Nmap scan report for 10.0.0.5
Host is up (0.31s latency).
All 1000 scanned ports on 10.0.0.5 are closed
MAC Address: A0:CC:2B:8D:67:C6 (Murata Manufacturing)
Too many fingerprints match this host to give specific OS details
Network Distance: 1 hop

Nmap scan report for 10.0.0.207
Host is up (0.91s latency).
All 1000 scanned ports on 10.0.0.207 are closed (670) or open|filtered (330)
MAC Address: B4:F6:1C:B8:E6:41 (Apple)
Too many fingerprints match this host to give specific OS details
Network Distance: 1 hop

Nmap scan report for 10.0.0.232
Host is up (0.34s latency).
Not shown: 999 closed ports
PORT     STATE         SERVICE
1556/tcp open|filtered veritas_pbx
MAC Address: B8:1D:AA:E5:F8:B0 (LG Electronics (Mobile Communications))
Too many fingerprints match this host to give specific OS details
Network Distance: 1 hop

Initiating FIN Scan at 15:50
Scanning E7440 (10.0.0.4) [1000 ports]
Completed FIN Scan at 15:50, 1.59s elapsed (1000 total ports)
Initiating OS detection (try #1) against E7440 (10.0.0.4)
Retrying OS detection (try #2) against E7440 (10.0.0.4)
WARNING: OS didn't match until try #2
Nmap scan report for E7440 (10.0.0.4)
Host is up (0.000026s latency).
All 1000 scanned ports on E7440 (10.0.0.4) are closed
Device type: remote management|phone|general purpose|webcam|storage-misc
Running: Avocent embedded, Google Android 2.X, Linux 2.6.X, AXIS embedded, ZyXEL embedded
OS CPE: cpe:/o:google:android:2.2 cpe:/o:linux:linux_kernel:2.6 cpe:/o:linux:linux_kernel:2.6.17 cpe:/h:axis:210a_network_camera cpe:/h:axis:211_network_camera cpe:/h:zyxel:nsa-210
Too many fingerprints match this host to give specific OS details
Network Distance: 0 hops

Read data files from: /usr/bin/../share/nmap
OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 256 IP addresses (6 hosts up) scanned in 2462.38 seconds
           Raw packets sent: 10222 (417.400KB) | Rcvd: 6808 (305.451KB)
```

## B1

_Este esta en un modo de 'tracear' la ruta a cada equipo que se logro escanear en la red_:

```bash
Starting Nmap 7.70 ( https://nmap.org ) at 2019-10-04 16:04 EDT
Initiating ARP Ping Scan at 16:04
Scanning 255 hosts [1 port/host]
Completed ARP Ping Scan at 16:04, 2.44s elapsed (255 total hosts)
Initiating Parallel DNS resolution of 255 hosts. at 16:04
Completed Parallel DNS resolution of 255 hosts. at 16:05, 13.00s elapsed
Nmap scan report for 10.0.0.0 [host down]
Nmap scan report for 10.0.0.3 [host down]
Nmap scan report for 10.0.0.6 [host down]
Nmap scan report for 10.0.0.7 [host down]
Nmap scan report for 10.0.0.8 [host down]
Nmap scan report for 10.0.0.9 [host down]
(...)#continue
Nmap scan report for 10.0.0.251 [host down]
Nmap scan report for 10.0.0.252 [host down]
Nmap scan report for 10.0.0.253 [host down]
Nmap scan report for 10.0.0.254 [host down]
Nmap scan report for 10.0.0.255 [host down]
Initiating Parallel DNS resolution of 1 host. at 16:05
Completed Parallel DNS resolution of 1 host. at 16:05, 13.00s elapsed
Initiating SYN Stealth Scan at 16:05
Scanning 4 hosts [1000 ports/host]
Discovered open port 80/tcp on 10.0.0.1
Discovered open port 53/tcp on 10.0.0.1
Discovered open port 8080/tcp on 10.0.0.2
Increasing send delay for 10.0.0.1 from 0 to 5 due to 11 out of 35 dropped probes since last increase.
Increasing send delay for 10.0.0.2 from 0 to 5 due to 13 out of 41 dropped probes since last increase.
Increasing send delay for 10.0.0.207 from 0 to 5 due to 13 out of 41 dropped probes since last increase.
Increasing send delay for 10.0.0.207 from 5 to 10 due to 11 out of 35 dropped probes since last increase.
Increasing send delay for 10.0.0.5 from 0 to 5 due to 50 out of 166 dropped probes since last increase.
Increasing send delay for 10.0.0.1 from 5 to 10 due to 11 out of 32 dropped probes since last increase.
Increasing send delay for 10.0.0.207 from 10 to 20 due to 11 out of 31 dropped probes since last increase.
Increasing send delay for 10.0.0.1 from 10 to 20 due to 11 out of 20 dropped probes since last increase.
Increasing send delay for 10.0.0.5 from 5 to 10 due to 11 out of 29 dropped probes since last increase.
Increasing send delay for 10.0.0.1 from 20 to 40 due to 11 out of 27 dropped probes since last increase.
Increasing send delay for 10.0.0.2 from 5 to 10 due to max_successful_tryno increase to 4
Increasing send delay for 10.0.0.207 from 20 to 40 due to 11 out of 24 dropped probes since last increase.
Increasing send delay for 10.0.0.5 from 10 to 20 due to 11 out of 23 dropped probes since last increase.
Increasing send delay for 10.0.0.5 from 20 to 40 due to 11 out of 20 dropped probes since last increase.
Increasing send delay for 10.0.0.5 from 40 to 80 due to max_successful_tryno increase to 4
Increasing send delay for 10.0.0.207 from 40 to 80 due to 11 out of 26 dropped probes since last increase.
Increasing send delay for 10.0.0.2 from 10 to 20 due to 11 out of 30 dropped probes since last increase.
Increasing send delay for 10.0.0.1 from 40 to 80 due to max_successful_tryno increase to 4
Increasing send delay for 10.0.0.2 from 20 to 40 due to max_successful_tryno increase to 5
Increasing send delay for 10.0.0.2 from 40 to 80 due to 11 out of 26 dropped probes since last increase.
Increasing send delay for 10.0.0.5 from 80 to 160 due to 11 out of 31 dropped probes since last increase.
Increasing send delay for 10.0.0.207 from 80 to 160 due to 11 out of 32 dropped probes since last increase.
Increasing send delay for 10.0.0.2 from 80 to 160 due to 13 out of 43 dropped probes since last increase.
Increasing send delay for 10.0.0.5 from 160 to 320 due to 13 out of 43 dropped probes since last increase.
SYN Stealth Scan Timing: About 25.56% done; ETC: 16:07 (0:01:30 remaining)
Increasing send delay for 10.0.0.1 from 80 to 160 due to 150 out of 499 dropped probes since last increase.
SYN Stealth Scan Timing: About 58.87% done; ETC: 16:08 (0:01:14 remaining)
SYN Stealth Scan Timing: About 72.53% done; ETC: 16:08 (0:00:52 remaining)
SYN Stealth Scan Timing: About 83.01% done; ETC: 16:08 (0:00:34 remaining)
Discovered open port 8086/tcp on 10.0.0.2
Completed SYN Stealth Scan against 10.0.0.1 in 184.30s (3 hosts left)
Discovered open port 62078/tcp on 10.0.0.207
Completed SYN Stealth Scan against 10.0.0.2 in 209.08s (2 hosts left)
Completed SYN Stealth Scan against 10.0.0.5 in 333.70s (1 host left)
Completed SYN Stealth Scan at 16:23, 1085.24s elapsed (4000 total ports)
Initiating OS detection (try #1) against 4 hosts
Retrying OS detection (try #2) against 3 hosts
Retrying OS detection (try #3) against 10.0.0.2
WARNING: OS didn't match until try #3
Nmap scan report for 10.0.0.1
Host is up (0.035s latency).
Not shown: 995 closed ports
PORT   STATE    SERVICE
21/tcp filtered ftp
22/tcp filtered ssh
23/tcp filtered telnet
53/tcp open     domain
80/tcp open     http
MAC Address: 7C:A2:3E:49:AA:16 (Huawei Technologies)
Device type: general purpose
Running: Linux 3.X
OS CPE: cpe:/o:linux:linux_kernel:3.5
OS details: Linux 3.5
Uptime guess: 5.162 days (since Sun Sep 29 12:31:10 2019)
Network Distance: 1 hop
TCP Sequence Prediction: Difficulty=263 (Good luck!)
IP ID Sequence Generation: All zeros

TRACEROUTE
HOP RTT      ADDRESS
1   35.28 ms 10.0.0.1

Nmap scan report for 10.0.0.2
Host is up (0.011s latency).
Not shown: 998 closed ports
PORT     STATE SERVICE
8080/tcp open  http-proxy
8086/tcp open  d-s-n
MAC Address: 50:39:55:EC:0E:6D (Cisco Spvtg)
Device type: media device
Running: Motorola embedded, Telekom embedded
OS CPE: cpe:/h:motorola:vip1232 cpe:/h:telekom:mr_303
OS details: Motorola VIP1232 digital set top box or Telekom Media Receiver MR 303
Network Distance: 1 hop
TCP Sequence Prediction: Difficulty=125 (Good luck!)
IP ID Sequence Generation: Incremental

TRACEROUTE
HOP RTT      ADDRESS
1   10.54 ms 10.0.0.2

Nmap scan report for 10.0.0.5
Host is up (0.053s latency).
All 1000 scanned ports on 10.0.0.5 are closed
MAC Address: A0:CC:2B:8D:67:C6 (Murata Manufacturing)
Too many fingerprints match this host to give specific OS details
Network Distance: 1 hop

TRACEROUTE
HOP RTT      ADDRESS
1   52.73 ms 10.0.0.5

Nmap scan report for 10.0.0.207
Host is up (0.56s latency).
Not shown: 943 closed ports, 56 filtered ports
PORT      STATE SERVICE
62078/tcp open  iphone-sync
MAC Address: B4:F6:1C:B8:E6:41 (Apple)
Device type: firewall
Running (JUST GUESSING): Fortinet embedded (87%)
OS CPE: cpe:/h:fortinet:fortigate_100d
Aggressive OS guesses: Fortinet FortiGate 100D firewall (87%)
No exact OS matches for host (test conditions non-ideal).
Network Distance: 1 hop

TRACEROUTE
HOP RTT       ADDRESS
1   556.29 ms 10.0.0.207

Initiating SYN Stealth Scan at 16:24
Scanning 10.0.0.4 [1000 ports]
Completed SYN Stealth Scan at 16:24, 1.59s elapsed (1000 total ports)
Initiating OS detection (try #1) against 10.0.0.4
Retrying OS detection (try #2) against 10.0.0.4
WARNING: OS didn't match until try #2
Nmap scan report for 10.0.0.4
Host is up (0.000029s latency).
All 1000 scanned ports on 10.0.0.4 are closed
Device type: remote management|phone|general purpose|webcam|storage-misc
Running: Avocent embedded, Google Android 2.X, Linux 2.6.X, AXIS embedded, ZyXEL embedded
OS CPE: cpe:/o:google:android:2.2 cpe:/o:linux:linux_kernel:2.6 cpe:/o:linux:linux_kernel:2.6.17 cpe:/h:axis:210a_network_camera cpe:/h:axis:211_network_camera cpe:/h:zyxel:nsa-210
Too many fingerprints match this host to give specific OS details
Network Distance: 0 hops

Read data files from: /usr/bin/../share/nmap
OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 256 IP addresses (5 hosts up) scanned in 1170.38 seconds
           Raw packets sent: 7334 (327.646KB) | Rcvd: 7744 (357.301KB)
```

## B2

_Este ultimo no escanea los puertos, solo detecta los host que se encuentran activos:_

```bash
Starting Nmap 7.70 ( https://nmap.org ) at 2019-10-04 16:24 EDT
Stats: 0:00:00 elapsed; 0 hosts completed (0 up), 255 undergoing ARP Ping Scan
ARP Ping Scan Timing: About 2.55% done; ETC: 16:24 (0:00:00 remaining)
Stats: 0:00:06 elapsed; 0 hosts completed (0 up), 255 undergoing ARP Ping Scan
Parallel DNS resolution of 255 hosts. Timing: About 0.00% done
Nmap scan report for 10.0.0.1
Host is up (0.017s latency).
MAC Address: 7C:A2:3E:49:AA:16 (Huawei Technologies)
Nmap scan report for 10.0.0.2
Host is up (0.028s latency).
MAC Address: 50:39:55:EC:0E:6D (Cisco Spvtg)
Nmap scan report for 10.0.0.5
Host is up (0.050s latency).
MAC Address: A0:CC:2B:8D:67:C6 (Murata Manufacturing)
Nmap scan report for 10.0.0.4
Host is up.
Nmap done: 256 IP addresses (4 hosts up) scanned in 28.14 seconds
```

# Parte C

