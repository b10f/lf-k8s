kubectl config view
kubectl create namespace lfs158

mkdir rbac
cd rbac/

sudo useradd -s /bin/bash bob
sudo passwd bob

# Create a private key for the new user bob with the openssl tool
openssl genrsa -out bob.key 2048

# Create a certificate signing request for bob with the same openssl tool
openssl req -new -key bob.key \
        -out bob.csr -subj "/CN=bob/O=learner"

# View the certificate, encode it in base64
cat bob.csr | base64 | tr -d '\n','%'

# Extract the approved certificate from the certificate signing request, decode it with base64 and save it as a certificate file
kubectl get csr bob-csr \
        -o jsonpath='{.status.certificate}' | \
        base64 -d > bob.crt

# view the certificate in the newly created certificate file
cat bob.crt

# Configure the kubectl client's configuration manifest with user bob's credentials by assigning his key and certificate
kubectl config set-credentials bob \
        --client-certificate=bob.crt --client-key=bob.key

# Create a new context entry in the kubectl client's configuration manifest for user bob, associated with the lfs158 namespace
kubectl config set-context bob-context \
        --cluster=minikube --namespace=lfs158 --user=bob

kubectl config view

kubectl -n lfs158 create deployment nginx --image=nginx:alpine
kubectl --context=bob-context get pods

kubectl create -f role.yaml
kubectl -n lfs158 get roles

kubectl create -f rolebinding.yaml
kubectl -n lfs158 get rolebindings

kubectl --context=bob-context get pods