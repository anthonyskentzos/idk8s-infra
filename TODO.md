https://github.com/devopsjourney1/argo-examples

[x] Minikube
    [] Doesn't work behind WARP
[] ArgoCD
    [] How to do auth to a private repo?
[] Install Helm Chart
[] Use custom images

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
argocd admin initial-password -n argocd: `OBPmRxYq68HoDGjz`
