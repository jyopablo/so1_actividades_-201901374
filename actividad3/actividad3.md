## Actividad 3

## Gestion de Usuarios

### Creacion de Usuario
```
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# sudo useradd usuario1
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# sudo useradd usuario2
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# sudo useradd usuario3
```
### Asignacion de Contrasenas
```
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# sudo passwd usuario1
Nueva contraseña: 
Vuelva a escribir la nueva contraseña: 
passwd: contraseña actualizada correctamente
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# sudo passwd usuario2
Nueva contraseña: 
Vuelva a escribir la nueva contraseña: 
passwd: contraseña actualizada correctamente
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# sudo passwd usuario3
Nueva contraseña: 
Vuelva a escribir la nueva contraseña: 
passwd: contraseña actualizada correctamente
```
### informacion de Usuarios
```
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# id usuario1
uid=1001(usuario1) gid=1001(usuario1) grupos=1001(usuario1)
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# id usuario2
uid=1002(usuario2) gid=1002(usuario2) grupos=1002(usuario2)
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# id usuario3
uid=1003(usuario3) gid=1003(usuario3) grupos=1003(usuario3)
```
### ELiminacion de Usuarios
```
oot@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# sudo userdel usuario2
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# id usuario 2
id: «usuario»: no existe ese usuario
uid=2(bin) gid=2(bin) grupos=2(bin)
```
## Gestion sde Grupos

### Creacion de Grupos
```
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# sudo groupadd grupo1
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# sudo groupadd grupo2
```

### Agregar Usuarios a Grupos
```
sudo usermod -aG grupo1 usuario1

```

### Verificar Membresia
```
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# groups usuario1
usuario1 : usuario1 grupo1
```
### Eliminar Grupo

```
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# sudo groupdel grupo2
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# groups usuario3
usuario3 : usuario3
```

## Gestion de Permisos

### Creacion de Archivos y DIrectorios
```
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# echo "Contenido de archivo1" > /home/usuario1/archivo1.txt
```

### Verificar Permisos
```
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# ls -l /home/usuario1/archivo1.txt
-rw-r--r-- 1 root root 22 ago  4 21:34 /home/usuario1/archivo1.txt
```

### Modificar Permisos usando chmod con Modo Numerico
```
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# chmod 640 /home/usuario1/archivo1.txt
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# ls -l /home/usuario1/archivo1.txt
-rw-r----- 1 root root 22 ago  4 21:34 /home/usuario1/archivo1.txt
```

### MOdificar Permisos usando chmod con Modo Simbolico
```
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# chmod u+x /home/usuario1/archivo1.txt
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# ls -l /home/usuario1/archivo1.txt
-rwxr----- 1 root root 22 ago  4 21:34 /home/usuario1/archivo1.txt
```

### Cambiar el Grupo Propietario
```
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# sudo chgrp grupo1 /home/usuario1/directorio1/archivo2.txt
```

### Configurar Permisos de Directorio
```
root@juandebian:/home/juan/Documentos/so1_actividades_201901374/actividad3# chmod 740 /home/usuario1/directorio1
```

### Comprobacion de Acceso
```
$ ls -l ~/archivo1.txt
ls: no se puede acceder a '/home/usuario3/archivo1.txt':
```

### Verificacion Final
```
ls -l /home/usuario1/archivo1.txt
-rwxr----- 1 root root 22 ago  4 21:34 /home/usuario1/archivo1.txt
```
