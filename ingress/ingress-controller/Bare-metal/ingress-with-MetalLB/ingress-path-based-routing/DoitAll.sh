echo ================ kubectl get no
kubectl get no
sleep 10
echo ================ kubectl version
sleep 10
kubectl version
sleep 10
echo ================ docker --version
docker --version

sleep 10
echo ================ git clone -b main  https://github.com/asokone/Kube_Fundamentals.git
git clone -b main  https://github.com/asokone/Kube_Fundamentals.git

echo ================ cd Kube_Fundamentals/ingress/ingress-controller/Bare-metal/ingress-with-MetalLB/ingress-path-based-routing/
cd Kube_Fundamentals/ingress/ingress-controller/Bare-metal/ingress-with-MetalLB/ingress-path-based-routing/

export PS1="\[\e]0;\h: \w\a\]\h:\W$ "

sleep 10
echo ================ grep namespace: metallb-native-killercoda.yaml
grep namespace: metallb-native-killercoda.yaml

sleep 10
echo ================ "kubectl apply -f metallb-native-killercoda.yaml ;  echo; echo ----- ; sleep 10;  kubectl get pods -n metallb-system"
kubectl apply -f metallb-native-killercoda.yaml ;  echo; echo ----- ; sleep 10;  kubectl get pods -n metallb-system

sleep 10
sleep 10
echo ================ kubectl get pods -n metallb-system
kubectl get pods -n metallb-system

sleep 10
echo ================ kubectl get svc -n metallb-system
kubectl get svc -n metallb-system

sleep 10
echo ================ kubectl get node -o wide
kubectl get node -o wide

sleep 10
echo ================ kubectl apply -f configmap-killercoda.yaml
kubectl apply -f configmap-killercoda.yaml

sleep 10
echo ================ kubectl get ipaddresspool -n metallb-system
kubectl get ipaddresspool -n metallb-system

sleep 10
echo ================ kubectl get L2Advertisement -n metallb-system
kubectl get L2Advertisement -n metallb-system


sleep 10
echo ================ kubectl get ns
kubectl get ns

sleep 10
echo ================ kubectl create namespace ingress-nginx
kubectl create namespace ingress-nginx


sleep 10
echo ================ kubectl apply -f ingress-nginx-controller-service-killercoda.yaml
kubectl apply -f ingress-nginx-controller-service-killercoda.yaml

echo ================ kubectl get svc -n ingress-nginx
sleep 10
kubectl get svc -n ingress-nginx

echo ================ grep namespace: deploy-ingress-nginx-controller-killercoda.yaml
grep namespace: deploy-ingress-nginx-controller-killercoda.yaml

sleep 10
echo ================ kubectl apply -f deploy-ingress-nginx-controller-killercoda.yaml 
kubectl apply -f deploy-ingress-nginx-controller-killercoda.yaml 

sleep 10
echo ================ kubectl get all -n ingress-nginx 
kubectl get all -n ingress-nginx 

sleep 10
echo ================ kubectl get pods -o wide -n ingress-nginx 
kubectl get pods -o wide -n ingress-nginx 

sleep 10
echo ================ kubectl apply -f main-nginx-deployment-01-killercoda.yaml
kubectl apply -f main-nginx-deployment-01-killercoda.yaml

sleep 10
echo ================ kubectl get deployment -n ingress-nginx 
kubectl get deployment -n ingress-nginx 

sleep 10
echo ================ kubectl get svc -n ingress-nginx 
kubectl get svc -n ingress-nginx 

sleep 10
echo ================ kubectl apply -f ingress-nginx-controller-resource-rules-01-NGINX-deploy-killercoda.yaml
kubectl apply -f ingress-nginx-controller-resource-rules-01-NGINX-deploy-killercoda.yaml

sleep 10
echo ================ "sleep 60; kubectl get ingress -n ingress-nginx"
sleep 60; kubectl get ingress -n ingress-nginx

sleep 10
echo ================ kubectl describe ingress ingress-nginx-resource-01 -n ingress-nginx
kubectl describe ingress ingress-nginx-resource-01 -n ingress-nginx

sleep 10
echo ================ kubectl get svc -n ingress-nginx
kubectl get svc -n ingress-nginx

sleep 10
echo ================ kubectl apply -f apache-httpd-deployment-killercoda.yaml
kubectl apply -f apache-httpd-deployment-killercoda.yaml

sleep 10
echo ================ kubectl apply -f apache-httpd-service-killercoda.yaml
kubectl apply -f apache-httpd-service-killercoda.yaml

sleep 10
echo ================ kubectl apply -f ingress-nginx-controller-resource-rules-01-HTTPD-deploy-killercoda.yaml
kubectl apply -f ingress-nginx-controller-resource-rules-01-HTTPD-deploy-killercoda.yaml

sleep 10
echo ================ kubectl get ingress -n ingress-nginx
kubectl get ingress -n ingress-nginx

sleep 10
echo ================ kubectl get svc -n ingress-nginx
kubectl get svc -n ingress-nginx



sleep 10
echo "172.30.2.101 main.example.com" | sudo tee -a /etc/hosts


echo =================== NOW DO THE REST ========================
echo
echo curl -v http://main.example.com:80/nginx/    
echo
echo curl -v http://main.example.com:80/httpd/    
