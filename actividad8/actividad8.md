# Kubernetes Local Environment Setup

## 1. Pasos para configurar un ambiente local de Kubernetes

### Requisitos previos:
- **Docker** instalado en la máquina local.
- **kubectl** instalado para interactuar con el clúster.
- **Minikube** o **Kind** (Kubernetes in Docker) para levantar un clúster local.

### Configuración utilizando Minikube:

1. **Instalar Minikube**:
   - Para instalar Minikube, sigue las instrucciones específicas para tu sistema operativo. Por ejemplo, en Linux:
     ```bash
     curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
     sudo install minikube-linux-amd64 /usr/local/bin/minikube
     ```

2. **Iniciar el clúster**:
   - Una vez instalado Minikube, puedes iniciar el clúster con el siguiente comando:
     ```bash
     minikube start
     ```

3. **Verificar el estado del clúster**:
   - Asegúrate de que todo esté funcionando correctamente:
     ```bash
     minikube status
     ```

4. **Interactuar con el clúster usando `kubectl`**:
   - `kubectl` te permite gestionar recursos dentro del clúster:
     ```bash
     kubectl get nodes
     ```

5. **Detener el clúster**:
   - Cuando termines, puedes detener el clúster:
     ```bash
     minikube stop
     ```

## 2. Configuración utilizando Kind (Kubernetes in Docker):

1. **Instalar Kind**:
   - Instala Kind utilizando Go o mediante un binario precompilado. Por ejemplo, en Linux:
     ```bash
     curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
     chmod +x ./kind
     sudo mv ./kind /usr/local/bin/kind
     ```

2. **Crear un clúster con Kind**:
   - Para crear un clúster de Kubernetes con Kind:
     ```bash
     kind create cluster
     ```

3. **Verificar los nodos**:
   - Usa `kubectl` para verificar los nodos del clúster:
     ```bash
     kubectl get nodes
     ```

4. **Eliminar el clúster**:
   - Cuando ya no necesites el clúster:
     ```bash
     kind delete cluster
     ```

## 3. ¿Cómo funcionan los nodos Masters y Workers en un ambiente local de Kubernetes?

En un ambiente de Kubernetes, ya sea local o en la nube, los nodos se dividen en dos tipos: **nodos maestros (Masters)** y **nodos trabajadores (Workers)**.

- **Nodos Masters**: Son responsables de gestionar el estado general del clúster. Ejecutan los componentes clave como:
  - **API Server**: Expone la API de Kubernetes y es el punto de entrada para todas las operaciones.
  - **Scheduler**: Se encarga de asignar las cargas de trabajo (pods) a los nodos Workers.
  - **Controller Manager**: Controla los diferentes controladores que aseguran el buen funcionamiento del clúster.
  - **etcd**: La base de datos que almacena todo el estado del clúster.

- **Nodos Workers**: Son los que ejecutan las cargas de trabajo (contenedores en pods). Cada nodo Worker tiene:
  - **Kubelet**: Un agente que asegura que los contenedores estén en ejecución en el nodo según lo indicado.
  - **Kube-proxy**: Administra la red para los servicios dentro del nodo.
  - **Container Runtime**: La herramienta que ejecuta los contenedores, como Docker o containerd.

En un ambiente local como **Minikube** o **Kind**, el clúster puede estar compuesto de un solo nodo que actúa como **master** y **worker** al mismo tiempo. Esto permite realizar pruebas y desarrollo en una máquina local sin necesidad de un clúster distribuido real.
