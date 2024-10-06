## Juan Pablo Gonzalez Leal 
## 201901374
## Actvidad 7

# Completely Fair Scheduler (CFS) de Linux

El Completely Fair Scheduler (CFS) es el planificador de tareas que utiliza Linux desde la versión 2.6.23. Su objetivo principal es distribuir el tiempo de CPU de manera justa entre todos los procesos. Aquí te explico sus características y cómo funciona de manera sencilla.

## Características Principales

1. **Equidad**: CFS asegura que todos los procesos tengan una parte justa del tiempo de CPU, sin importar su prioridad.

2. **Modelo de Tiempo Virtual**: Cada proceso recibe una cantidad de tiempo de CPU proporcional a su peso, lo que significa que los procesos más cortos obtienen más tiempo en comparación con los más largos.

3. **Balanza de Carga**: Distribuye las tareas de manera equitativa entre varios núcleos de CPU para mejorar el rendimiento general del sistema.

4. **Uso de Árbol Rojo-Negro**: Utiliza una estructura de datos llamada árbol rojo-negro para gestionar eficientemente la lista de procesos en ejecución.

5. **Granularidad de Tiempo**: Permite ajustar el tiempo mínimo que un proceso puede ejecutar antes de ser interrumpido.

6. **Soporte para Grupos de Control (cgroups)**: CFS puede limitar la cantidad de CPU que un grupo de procesos puede usar, lo que ayuda a gestionar los recursos en sistemas con múltiples usuarios.

## Funcionamiento

1. **Asignación de Tiempo**: CFS asigna tiempo de CPU a los procesos según el tiempo que han estado ejecutándose. Cada proceso tiene un "tiempo virtual" que se actualiza cada vez que se ejecuta.

2. **Selección del Proceso a Ejecutar**: CFS elige el proceso con el menor tiempo virtual, asegurando que los que han estado inactivos tengan más oportunidades de ejecutarse.

3. **Cambio de Contexto**: Cuando se cambia de un proceso a otro, CFS ajusta el tiempo virtual del proceso que se detiene y del que se va a ejecutar, asegurando una distribución justa del tiempo de CPU.

4. **Prevención de Inversión de Prioridades**: CFS evita problemas donde los procesos de baja prioridad bloquean a los de alta prioridad, permitiendo que todos los procesos se ejecuten de manera eficiente.

5. **Interactividad**: Está diseñado para ser muy interactivo, manejando rápidamente las tareas que necesitan respuesta inmediata, como las interacciones del usuario.

## Conclusión

El Completely Fair Scheduler (CFS) es una forma moderna y justa de gestionar el tiempo de CPU en Linux, usando estructuras eficientes y algoritmos que aseguran que todos los procesos tengan una oportunidad justa de ejecutarse.
