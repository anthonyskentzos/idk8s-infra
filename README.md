https://github.com/devopsjourney1/argo-examples
https://github.com/kostis-codefresh/many-appsets-demo/tree/main

# Start Minikube
open -a Docker
minikube start
minikube dashboard

## Accessing local images
minikube start --driver=docker
minikube -p minikube docker-env
eval $(minikube -p minikube docker-env)

# Install Argo
brew install argocd
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl port-forward svc/argocd-server -n argocd 8080:443
argocd admin initial-password -n argocd

## Install App-of-Apps
argocd login localhost:8080
- kubectl apply -f root-argocd-app.yml

# Minikube Ingress
minikube addons enable ingress
kubectl apply -f apps/ingress/ingress.yaml
Update `/etc/hosts` -> `127.0.0.1 k8s-app.local`
sudo minikube tunnel