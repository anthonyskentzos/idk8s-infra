https://github.com/devopsjourney1/argo-examples

[x] Minikube
    [] Doesn't work behind WARP
[] ArgoCD
    [] How to do auth to a private repo?
[x] Install Helm Chart
[] Use custom images
[] App of apps

# Minikube
open -a Docker
minikube start
minikube dashboard

## Local images
minikube start --driver=docker
minikube -p minikube docker-env
eval $(minikube -p minikube docker-env)

# Install Argo
brew install argocd
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl port-forward svc/argocd-server -n argocd 8080:443
argocd admin initial-password -n argocd

# App
kubectl port-forward service/myhelmapp 8888:80 -n helm-webapp-dev