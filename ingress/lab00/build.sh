wget https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
wget https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl apply -f namespace.yaml
kubectl apply metallb.yaml
kubectl apply -f metallb.yaml
kubectl get all -n metal
git clone https://github.com/nginxinc/kubernetes-ingress/
cd kubernetes-ingress/deployments
git checkout v1.7.2
kubectl create -f common/ns-and-sa.yaml
kubectl create -f rbac/rbac.yaml
kubectl create -f common/default-server-secret.yaml
kubectl create -f common/nginx-config.yaml
kubectl create -f common/vs-definition.yaml --validate=false
kubectl create -f common/vsr-definition.yaml --validate=false
kubectl create -f common/ts-definition.yaml --validate=false
kubectl create -f common/gc-definition.yaml --validate=false
kubectl create -f common/global-configuration.yaml --validate=false
kubectl create -f deployment/nginx-ingress.yaml
kubectl get deployment -o wide -n nginx-ingress
kubectl scale --replicas=3 deployment/nginx-ingress -n nginx-ingress
kubectl get pods -o wide -n nginx-ingress
kubectl create -f service/loadbalancer.yaml
kubectl get svc -n nginx-ingress
kubectl create -f nginx-deploy.yaml -n default
kubectl expose deploy/nginx-deploy --port 80 -n default
kubectl get svc -n default
kubectl create -f ingress-nginx-deploy.yaml
kubectl describe ing ingress-nginx-deploy
cd -
echo "Open a web browser a test if our application is reachable from outside the cluster: http://nginx.example.com:80/"
