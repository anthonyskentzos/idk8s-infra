https://github.com/devopsjourney1/argo-examples
https://github.com/kostis-codefresh/many-appsets-demo/tree/main

# Requirements
## Minikube
    
    https://minikube.sigs.k8s.io/docs/start/?arch=%2Fmacos%2Farm64%2Fstable%2Fbinary+download
    ```
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-arm64
    
    sudo install minikube-darwin-arm64 /usr/local/bin/minikube

    minikube start

    minikube addons enable ingress
    ```
## Helm
```
brew install helm
```
## ArgoCD
```
brew install argocd
```

# Getting Started
## Start Minikube
```
open -a Docker

minikube start
```

# Install Argo
## Unattended Install
```
kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl port-forward svc/argocd-server -n argocd 8080:443

argocd admin initial-password -n argocd
```
## Custom Install with Ingress via Helm
```
kubectl create namespace argocd

helm repo add argo https://argoproj.github.io/argo-helm

helm repo update

helm show values argo/argo-cd > values.yaml

# TODO: Change values here

helm install argocd argo/argo-cd --version 7.5.0 --namespace argocd --values values.yaml
```

# Install ArgoCD App-of-Apps
```
kubectl apply -f root-argocd-app.yml
```

# Minikube Ingress
```
Update `/etc/hosts`
    -> `127.0.0.1 idk8s.example`
    -> `127.0.0.1 argocd.idk8s.example`
    -> `127.0.0.1 doom.idk8s.example`

kubectl apply -f apps/ingress/ingress.yaml

sudo minikube tunnel
```