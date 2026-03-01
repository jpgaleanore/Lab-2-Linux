# 📘 Informe y Guía Resumida de Comandos Linux

**Laboratorios 2 y 3 -- Obtención de ayuda y Gestión de archivos**

------------------------------------------------------------------------

## 1. Introducción

Este documento resume los comandos utilizados en los laboratorios
enfocados en:

-   Obtención de ayuda en Linux.
-   Búsqueda de archivos.
-   Navegación por directorios.
-   Listado y manipulación de archivos.

El objetivo es servir como **guía rápida de referencia** para el uso de
la terminal Linux.

------------------------------------------------------------------------

# 🧭 LABORATORIO 2 -- Obtención de ayuda

## `date`

**Función:** Muestra la fecha y hora actual del sistema.

``` bash
date
```

**Ejemplo de ejecución:**
```
$ date
Sun Mar  1 15:35:28 -05 2026
```

✔ Útil para verificar hora del sistema.

------------------------------------------------------------------------

## `man`

**Función:** Abre el manual completo de un comando.

``` bash
man date
```

**Ejemplo de ejecución:**
```
$ man date
DATE(1)                   General Commands Manual                  DATE(1)

NAME
     date – display or set date and time

SYNOPSIS
     date [-jnRu] [-I[FMT]] [-r seconds | filename] [-v [+|-]val[y|m|w|d|H|M|S]]
          [[[[mm]dd]HH]MM[[cc]yy][.SS] | new_date] [+output_fmt]

DESCRIPTION
     When invoked without arguments, the date utility displays the current
     date and time.  Otherwise, depending on the options specified, date
     will set the date and time or print it in a user-defined way.
     
     (Presiona 'q' para salir del manual)
```

Permite: - Leer documentación oficial. - Buscar dentro del manual
(`/texto`). - Salir con `q`.

### Opciones importantes

-   `man -k palabra` → Busca comandos relacionados.
-   `man -f comando` → Muestra secciones disponibles.

**Ejemplo de `man -k`:**
```
$ man -k password
EVP_PBE_CipherInit(3ssl) - Password based encryption routines
OSSL_CRMF_pbm_new(3ssl) - functions for producing Password-Based MAC
passwd(1) - modify a user's password
passwd(5) - format of the password file
```

------------------------------------------------------------------------

## `apropos`

**Función:** Busca comandos por palabra clave.

``` bash
apropos password
```

**Ejemplo de ejecución:**
```
$ apropos password
passwd(1)    - modify a user's password
passwd(5)    - format of the password file
getpass(3)   - get a password
```

🔎 Similar a `man -k`.

------------------------------------------------------------------------

## `whatis`

**Función:** Muestra una descripción corta del comando.

``` bash
whatis passwd
```

**Ejemplo de ejecución:**
```
$ whatis passwd
passwd(1)                - modify a user's password
passwd(5), master.passwd(5) - format of the password file
openssl-passwd(1ssl)     - compute password hashes
```

------------------------------------------------------------------------

## `info`

**Función:** Documentación más detallada y tipo tutorial.

``` bash
info date
```

**Ejemplo de ejecución:**
```
$ info date
File: coreutils.info,  Node: date invocation

21.1 'date': Print or set system date and time
===============================================

Synopses:

     date [OPTION]... [+FORMAT]
     date [-u|--utc|--universal] [MMDDhhm
```

Comandos útiles:
- `h` → ayuda
- `l` → volver
- `q` → salir

------------------------------------------------------------------------

## `--help`

**Función:** Ayuda rápida directamente desde el comando.

``` bash
date --help
```

**Ejemplo de ejecución:**
```
$ date --help
Usage: date [OPTION]... [+FORMAT]
  or:  date [-u|--utc|--universal] [MMDDhhm[[CC]YY][.ss]]
Display the current time in the given FORMAT, or set the system date.

Mandatory arguments to long options are mandatory for short options too.
  -d, --date=STRING         display time described by STRING
  -f, --file=DATEFILE       like --date; once for each line of DATEFILE
  -I[FMT], --iso-8601[=FMT] output date/time in ISO 8601 format
  -r, --reference=FILE      display last modification time of FILE
  -R, --rfc-email           output date and time in RFC 5322 format
  -s, --set=STRING          set time described by STRING
  -u, --utc, --universal    print or set Coordinated Universal Time
      --help                display this help and exit
      --version             output version information and exit
```

✅ Ideal para recordar opciones rápidamente.

------------------------------------------------------------------------

## `/usr/share/doc`

Directorio con documentación avanzada.

``` bash
ls /usr/share/doc
```

**Ejemplo de ejecución:**
```
$ ls /usr/share/doc
bash/
coreutils/
grep/
man-db/
python3/
sudo/
tar/
vim/
```

📝 **Nota:** En macOS este directorio puede no existir o estar vacío. Es más común en distribuciones Linux como Ubuntu, Debian, Fedora, etc.

------------------------------------------------------------------------

# 🔎 Búsqueda de Archivos

## `locate`

Busca archivos usando una base de datos.

``` bash
locate crontab
```

**Ejemplo de ejecución:**
```
$ locate crontab
/usr/bin/crontab
/usr/share/man/man1/crontab.1.gz
/usr/share/man/man5/crontab.5.gz
/var/spool/cron/crontabs
/etc/crontab
```

Buscar coincidencia exacta:

``` bash
locate -b "\crontab"
```

**Ejemplo de ejecución con -b:**
```
$ locate -b "\crontab"
/usr/bin/crontab
/etc/crontab
```

⚠ Puede no encontrar archivos recientes (la base de datos se actualiza periódicamente con `updatedb`).

------------------------------------------------------------------------

## `whereis`

Localiza:
- Ejecutables
- Código fuente
- Páginas man

``` bash
whereis passwd
```

**Ejemplo de ejecución:**
```
$ whereis passwd
passwd: /usr/bin/passwd /etc/passwd /usr/share/man/man1/passwd.1.gz /usr/share/man/man5/passwd.5.gz
```

------------------------------------------------------------------------

# 📁 LABORATORIO 3 -- Archivos y Directorios

## `pwd`

Muestra el directorio actual.

``` bash
pwd
```

**Ejemplo de ejecución:**
```
$ pwd
/home/usuario/Documentos
```

------------------------------------------------------------------------

## `echo $HOME`

Muestra el directorio personal del usuario.

``` bash
echo $HOME
```

**Ejemplo de ejecución:**
```
$ echo $HOME
/home/usuario
```

También puede usarse con `~`:
```
$ echo ~
/home/usuario
```

------------------------------------------------------------------------

## `cd`

Cambia de directorio.

``` bash
cd /
cd
cd ~
cd ..
cd /usr/bin
```

**Ejemplos de ejecución:**
```
$ pwd
/home/usuario

$ cd /
$ pwd
/

$ cd
$ pwd
/home/usuario

$ cd ~
$ pwd
/home/usuario

$ cd ..
$ pwd
/home

$ cd /usr/bin
$ pwd
/usr/bin
```

Conceptos:
- Ruta absoluta → inicia con `/`
- Ruta relativa → depende del directorio actual

------------------------------------------------------------------------

# 📂 Listado de Archivos

## `ls`

Lista archivos.

``` bash
ls
```

**Ejemplo de ejecución:**
```
$ ls
Descargas  Documentos  Escritorio  Imágenes  Música  Público  Vídeos
```

### Opciones importantes

-   `ls -a` → incluye archivos ocultos.
-   `ls -l` → información detallada.
-   `ls -R` → listado recursivo.
-   `ls -d` → evita mostrar contenido interno.

**Ejemplo de `ls -a` (archivos ocultos):**
```
$ ls -a
.  ..  .bashrc  .profile  .config  Descargas  Documentos  Escritorio
```

**Ejemplo de `ls -l` (formato largo):**
```
$ ls -l
total 32
drwxr-xr-x   2 usuario usuario 4096 Mar  1 10:00 Descargas
drwxr-xr-x   5 usuario usuario 4096 Mar  1 09:30 Documentos
drwxr-xr-x   2 usuario usuario 4096 Feb 28 15:20 Escritorio
drwxr-xr-x   3 usuario usuario 4096 Feb 27 12:00 Imágenes
```

**Ejemplo de `ls -la` (combinación):**
```
$ ls -la ~
total 48
drwxr-xr-x  14 usuario usuario  4096 Mar  1 15:21 .
drwxr-xr-x   3 root    root     4096 Sep 23 21:18 ..
-rw-------   1 usuario usuario  1024 Mar  1 14:00 .bash_history
-rw-r--r--   1 usuario usuario   220 Sep 23 21:18 .bash_logout
-rw-r--r--   1 usuario usuario  3771 Sep 23 21:18 .bashrc
drwxr-xr-x   4 usuario usuario  4096 Feb 23 21:04 .config
drwxr-xr-x   2 usuario usuario  4096 Mar  1 10:00 Descargas
drwxr-xr-x   5 usuario usuario  4096 Mar  1 09:30 Documentos
```

------------------------------------------------------------------------

## Globbing (comodines)

### `*`

Coincide con varios caracteres:

``` bash
ls -d /etc/s*
```

**Ejemplo de ejecución:**
```
$ ls -d /etc/s*
/etc/ssh
/etc/ssl
/etc/sudo_lecture
/etc/sudoers
/etc/sudoers.d
/etc/syslog.conf
```

### `?`

Coincide con un carácter:

``` bash
ls -d /etc/????
```

**Ejemplo de ejecución:**
```
$ ls -d /etc/????
/etc/motd
/etc/mtab
/etc/init
/etc/cups
```

### `[abcd]`

Coincide con un conjunto:

``` bash
ls -d /etc/[abcd]*
```

**Ejemplo de ejecución:**
```
$ ls -d /etc/[abcd]*
/etc/asl
/etc/asl.conf
/etc/auto_home
/etc/auto_master
/etc/autofs.conf
/etc/bashrc
/etc/crontab
/etc/cups
/etc/default
```

------------------------------------------------------------------------

# 📦 Copiar, Mover y Eliminar

## `cp`

Copia archivos.

``` bash
cp /etc/hosts hosts
```

**Ejemplo de ejecución:**
```
$ cp /etc/hosts hosts
$ ls -l hosts
-rw-r--r-- 1 usuario usuario 234 Mar  1 15:40 hosts
```

Modo detallado:

``` bash
cp -v /etc/hosts hosts
```

**Ejemplo de ejecución con -v:**
```
$ cp -v /etc/hosts hosts
'/etc/hosts' -> 'hosts'
```

**Copiar directorio completo con -r:**
```
$ cp -rv /etc/ssh ./ssh_backup
'/etc/ssh' -> './ssh_backup'
'/etc/ssh/sshd_config' -> './ssh_backup/sshd_config'
'/etc/ssh/ssh_config' -> './ssh_backup/ssh_config'
```

------------------------------------------------------------------------

## `mv`

Mueve o renombra archivos.

``` bash
mv archivo_origen archivo_destino
```

**Ejemplo de ejecución (renombrar):**
```
$ mv hosts hosts_backup
$ ls hosts_backup
hosts_backup
```

**Ejemplo de ejecución (mover):**
```
$ mv hosts_backup /tmp/
$ ls /tmp/hosts_backup
/tmp/hosts_backup
```

------------------------------------------------------------------------

## `rm`

Elimina archivos.

``` bash
rm hosts
```

**Ejemplo de ejecución:**
```
$ ls hosts
hosts
$ rm hosts
$ ls hosts
ls: cannot access 'hosts': No such file or directory
```

**Con confirmación (-i):**
```
$ rm -i archivo.txt
rm: remove regular file 'archivo.txt'? y
```

**Eliminar directorio (-r):**
```
$ rm -r directorio/
```

⚠ Eliminación permanente. Usar con precaución.

------------------------------------------------------------------------

## `mkdir`

Crea directorios.

``` bash
mkdir nuevo_directorio
```

**Ejemplo de ejecución:**
```
$ mkdir proyectos
$ ls -d proyectos
proyectos/
```

**Crear directorios anidados con -p:**
```
$ mkdir -p proyectos/java/src
$ ls -R proyectos
proyectos:
java

proyectos/java:
src

proyectos/java/src:
```

------------------------------------------------------------------------

## `touch`

Crea archivos vacíos o actualiza la fecha de modificación.

``` bash
touch archivo.txt
```

**Ejemplo de ejecución:**
```
$ touch nuevo_archivo.txt
$ ls -l nuevo_archivo.txt
-rw-r--r-- 1 usuario usuario 0 Mar  1 15:45 nuevo_archivo.txt
```

------------------------------------------------------------------------

## `cat`

Muestra el contenido de archivos.

``` bash
cat /etc/hosts
```

**Ejemplo de ejecución:**
```
$ cat /etc/hosts
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1       localhost
255.255.255.255 broadcasthost
::1             localhost
```

------------------------------------------------------------------------

# ✅ Conclusiones

-   Linux ofrece múltiples sistemas de ayuda (`man`, `info`, `--help`).
-   Navegar correctamente por directorios es esencial para administrar
    el sistema.
-   Los comandos `ls`, `cd`, `cp` y `rm` son fundamentales.
-   El uso de comodines permite búsquedas rápidas y eficientes.

------------------------------------------------------------------------

# 🧠 Guía Rápida (Resumen)

| Comando    | Uso principal               | Ejemplo básico           |
|------------|------------------------------|--------------------------|
| `date`     | Mostrar fecha                | `date`                   |
| `man`      | Manual completo              | `man ls`                 |
| `apropos`  | Buscar comandos              | `apropos password`       |
| `whatis`   | Descripción corta            | `whatis passwd`          |
| `info`     | Documentación avanzada       | `info date`              |
| `locate`   | Buscar archivos              | `locate crontab`         |
| `whereis`  | Ubicar comandos              | `whereis passwd`         |
| `pwd`      | Directorio actual            | `pwd`                    |
| `cd`       | Cambiar directorio           | `cd /home`               |
| `ls`       | Listar archivos              | `ls -la`                 |
| `cp`       | Copiar                       | `cp origen destino`      |
| `mv`       | Mover/Renombrar              | `mv viejo nuevo`         |
| `rm`       | Eliminar                     | `rm archivo.txt`         |
| `mkdir`    | Crear directorio             | `mkdir carpeta`          |
| `touch`    | Crear archivo vacío          | `touch archivo.txt`      |
| `cat`      | Ver contenido de archivo     | `cat /etc/hosts`         |

------------------------------------------------------------------------

# 📎 Combinaciones Útiles

**Listar archivos ordenados por fecha de modificación:**
```
$ ls -lt
```

**Ver los primeros 10 archivos modificados recientemente:**
```
$ ls -lt | head -10
```

**Buscar archivos por nombre:**
```
$ find /home -name "*.txt"
```

**Ver espacio en disco:**
```
$ df -h
```

**Ver uso de memoria:**
```
$ free -h
```

------------------------------------------------------------------------

**Documento generado como resumen académico de los Laboratorios Linux.**
