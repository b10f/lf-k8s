kubectl get deployments
kubectl get replicasets
kubectl get pods
kubectl get deploy,rs,po

kubectl describe pod web-dash-74d8bd488f-dwbzz

# List the Pods, along with their attached Labels
kubectl get pods -L k8s-app,label2

# Select the Pods with a given Label
kubectl get pods -l k8s-app=web-dash
kubectl get pods -l k8s-app=webserver

kubectl delete deployments web-dash
kubectl get replicasets
kubectl get pods

kubectl create deployment webserver \
        --image=nginx:alpine --replicas=3 --port=80 \
        --dry-run=client -o yaml > webserver.yaml

kubectl apply -f webserver.yaml
kubectl get replicasets
kubectl get pods
kubectl create deployment webserver --image=nginx:alpine --replicas=3 --port=80

kubectl apply -f webserver-svc.yaml
kubectl expose deployment webserver --name=web-service --type=NodePort

kubectl get services
kubectl describe service web-service

kubectl get po -l app=nginx -o wide
kubectl get ep web-service
kubectl get po,ep -l app=nginx -o wide

kubectl port-forward svc/web-service 8080:80
