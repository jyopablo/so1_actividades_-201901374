# Servicio de Saludo con Fecha Actual

Este proyecto configura un servicio `systemd` en Linux que ejecuta un script de shell. El script imprime un saludo junto con la fecha y hora actual de forma infinita, con una pausa de un segundo entre cada impresión.

## 1. Script de Shell

El script de shell `saludo.sh` es el núcleo de este servicio. A continuación, se muestra el contenido del script:

```bash
#!/bin/bash
while true
do
    echo "Hola, la fecha y hora actual es: $(date)"
    sleep 1
done
```

Este script hace lo siguiente:

* while true: Inicia un bucle infinito.
* echo "Hola, la fecha y hora actual es: $(date)": Imprime un saludo seguido de la fecha y hora actuales.
* sleep 1: Pausa la ejecución durante un segundo antes de repetir el bucle.

Guardar el script
1. Crea el script en `//usr/local/bin/`:
```
sudo nano /usr/local/bin/saludo.sh
```
2. Copia el contenido dle script anteior y pegalo en el archivo
3. Haz que el script sea ejecutable:
```
sudo chmod +x /usr/local/bin/saludo.sh
```

## 2. Unidad de Servicio `systemd`
El servicio se gestiona a través de systemd. Aquí está el contenido del archivo de unidad del servicio:

```
[Unit]
Description=Servicio que imprime un saludo y la fecha actual infinitamente

[Service]
ExecStart=/usr/local/bin/saludo.sh
Restart=always

[Install]
WantedBy=multi-user.target\
```

Crear el archivo de unidad:
1. Crea el archivo de unidad en `/etc/systemd/system/`:
  ```
  sudo nano /etc/systemd/system/saludo.service
  ```
2. Copia y pega el contenido del archivo de unidad mostrado arriba

## 3. Habilitar e iniciar el servicio
Para que el servicio se inicie automáticamente con el sistema:

1. Habilitar el servicio:
    ```
    sudo systemctl enable saludo.service
    ```
2. Iniciar el servicio inmediatamente:
    ```
    sudo systemctl enable saludo.service
    ```
## 4. Verificar el Estado del Servicio y Revisar los Logs
### Verificar el estado del servicio:
para ver si el servico esta conrriendo corretamente
```
sudo systemctl status saludo.service
```
### Revisar los logs del servicio:
Para ver los mensajes que imprime el script, utiliza:
```
sudo journalctl -u saludo.service
```
Con esto, podrás verificar la salida del script en tiempo real y asegurarte de que el servicio está funcionando como se espera.

## 5. Deshabilitar o Detener el servicio
Detener o seshabilitar el servicio:
* Para deter el servicio
    ```
    sudo systemctl stop saludo.service
    ```
* Para deshabilitar el servicio
    ```
    sudo systemctl disable saludo.service
    ```