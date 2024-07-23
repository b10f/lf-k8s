# ConfigMap

kubectl create configmap my-config \
        --from-literal=key1=value1 \
        --from-literal=key2=value2

kubectl get configmaps my-config -o yaml

kubectl create configmap permission-config \
        --from-file=<path/to/>permission-reset.properties

# Create ConfigMap from file
kubectl create configmap green-web-cm --from-file=03-index.html

# Secret
kubectl create secret generic my-password \
        --from-literal=password=mysqlpassword

kubectl get secret my-password
kubectl describe secret my-password

echo mysqlpassword | base64
echo "bXlzcWxwYXNzd29yZAo=" | base64 --decode

kubectl create -f 05-secret.yaml

# Create Secret from File
echo mysqlpassword | base64
echo -n 'bXlzcWxwYXNzd29yZAo=' > password.txt
kubectl create secret generic my-file-password \
        --from-file=password.txt

kubectl get secret my-file-password
kubectl describe secret my-file-password
