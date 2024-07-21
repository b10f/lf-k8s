kubectl create -f frontend-svc.yaml

kubectl expose deploy frontend --name=frontend-svc \
        --port=80 --target-port=5000

kubectl create service clusterip frontend \
        --tcp=80:5000 --dry-run=client -o yaml \
        | sed 's/name: frontend/name: frontend-svc/g' \
        | kubectl apply -f -

kubectl get service,endpoints frontend-svc
kubectl get svc,ep frontend-svc

kubectl exec client-app-pod-name -c client-container-name -- /bin/sh -c curl -s frontend-svc:80

kubectl expose deploy frontend --name=frontend-svc \
        --port=80 --target-port=5000 --type=NodePort

kubectl create service nodeport frontend-svc \
        --tcp=80:5000 --node-port=32233

# Port Forwarding
kubectl port-forward deploy/frontend 8080:5000

kubectl port-forward frontend-77cbdf6f79-qsdts 8080:5000

kubectl port-forward svc/frontend-svc 8080:80
