## 1. Bourne Shell en Unix

### Introducción a Bourne Shell
Bourne Shell (sh) es uno de los lenguajes de scripting más antiguos y utilizados en sistemas Unix. Se utiliza para automatizar tareas repetitivas y administrar sistemas. Este shell proporciona una interfaz de línea de comandos donde puedes ejecutar comandos del sistema, escribir scripts y crear programas simples. Con Bourne Shell, puedes gestionar archivos, procesos y permisos, además de realizar cálculos sencillos y manipulación de texto.

#### Variables en Bourne Shell
Las variables en Bourne Shell se declaran sin necesidad de ningún símbolo especial. Para asignar un valor a una variable, basta con escribir el nombre de la variable seguido del signo igual y el valor. Por ejemplo:
```sh
mi_variable="Hola Mundo"
```
Para acceder al valor de una variable, utilizas el símbolo `$` seguido del nombre de la variable:
```sh
echo $mi_variable
```

#### Bucles en Bourne Shell
Bourne Shell permite el uso de bucles `while` y `for`, lo cual facilita la ejecución de tareas repetitivas.

- **Bucle `while`:** El bucle `while` se ejecuta mientras una condición sea verdadera.
  ```sh
  contador=1
  while [ $contador -le 5 ]
  do
    echo "Número $contador"
    contador=$((contador + 1))
  done
  ```

- **Bucle `for`:** Este bucle se usa para iterar sobre una lista de elementos.
  ```sh
  for archivo in *.txt
  do
    echo "Procesando $archivo"
  done
  ```

### Ejecución de Scripts en Bourne Shell
Para ejecutar un script de Bourne Shell, utiliza el comando `sh` seguido del nombre del archivo. Por ejemplo:
```sh
sh mi_script.sh
```
Si el script acepta parámetros, puedes pasarlos después del nombre del archivo:
```sh
sh mi_script.sh parametro1 parametro2
```

### Permisos y Ejecución Permanente en Unix
En sistemas Unix, los archivos de shell pueden requerir permisos de ejecución. Para asignar estos permisos, utiliza el comando `chmod +x`:
```sh
chmod +x mi_script.sh
```
Para aplicar permisos de ejecución a todos los scripts en un directorio, como `windows/`:
```sh
chmod +x windows/*.sh
```
Si deseas que estos permisos persistan, mueve los scripts a una ubicación que esté en el `PATH` del usuario, como `/usr/local/bin`, y asegúrate de que tengan permisos de ejecución.

---

## 2. PowerShell en Windows

### Introducción a PowerShell
PowerShell es un lenguaje de scripting desarrollado por Microsoft que permite automatizar tareas y administrar sistemas de manera eficiente en plataformas Windows, macOS y Linux. PowerShell es ampliamente utilizado para la administración de sistemas, la manipulación de archivos y la automatización de procesos. Sus scripts se guardan en archivos `.ps1`.

#### Variables en PowerShell
Las variables en PowerShell comienzan con el símbolo `$`, seguido por el nombre de la variable. No es necesario declarar el tipo de datos de la variable. Por ejemplo:
```powershell
$miVariable = "Hola Mundo"
```
Para acceder al valor de la variable, simplemente usa el nombre de la variable:
```powershell
Write-Output $miVariable
```

#### Bucles en PowerShell
Al igual que Bourne Shell, PowerShell admite bucles `while` y `for` para ejecutar tareas repetitivas.

- **Bucle `while`:** Se ejecuta mientras una condición sea verdadera.
  ```powershell
  $contador = 1
  while ($contador -le 5) {
      Write-Output "Número $contador"
      $contador++
  }
  ```

- **Bucle `for`:** Se utiliza para iterar un número de veces definido.
  ```powershell
  for ($i = 1; $i -le 5; $i++) {
      Write-Output "Iteración $i"
  }
  ```

### Ejecución de Scripts en PowerShell
Para ejecutar un script PowerShell, abre una consola de PowerShell, navega hasta el directorio del script y usa el siguiente comando:
```powershell
.\mi_script.ps1
```
Si el script acepta parámetros, añádelos después del nombre del archivo:
```powershell
.\mi_script.ps1 parametro1 parametro2
```

### Permisos de Ejecución en PowerShell
Para ejecutar scripts en PowerShell, es posible que debas modificar la política de ejecución de scripts. Por defecto, PowerShell tiene restricciones para la ejecución de scripts. Puedes habilitar la ejecución de scripts usando:
```powershell
Set-ExecutionPolicy RemoteSigned
```
Esto permitirá ejecutar scripts creados localmente o firmados por un editor de confianza. 

Para evitar restricciones de ejecución en el futuro, puedes mover los scripts a una ubicación de confianza o ajustar la política de ejecución de PowerShell para que permita la ejecución de scripts en cualquier momento.

