# Annotations
kubectl annotate pod mypod key1=value1 key2=value2

kubectl run saved --image=nginx:alpine --save-config=true
kubectl get pod saved -o yaml

# Logs
kubectl logs pod-name
kubectl logs pod-name container-name
kubectl logs pod-name container-name -p

kubectl exec pod-name -- ls -la /
kubectl exec pod-name -c container-name -- env
kubectl exec pod-name -c container-name -it -- /bin/sh

kubectl get events
kubectl events
kubectl describe pod pod-name
