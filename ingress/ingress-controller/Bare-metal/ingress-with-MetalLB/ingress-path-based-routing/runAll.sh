echo "Wait .... 60 seconds"
sleep 60
echo
echo
echo "=========== Put in place a LoadBalancer "
sleep 5
echo "--- Apply metallb.v0.7.3.yaml "
kubectl apply -f  metallb.v0.7.3.yaml 
sleep 5
echo "--- Apply configmap.yaml"
kubectl apply -f configmap.yaml
sleep 5
echo
echo
echo "=========== Install an Ingress Controller "
echo "--- Apply deploy_nginx_ingress_controller_namespace_ingress-nginx.yaml"
kubectl apply -f deploy_nginx_ingress_controller_namespace_ingress-nginx.yaml --validate=false
sleep 15
echo
echo
echo "=========== Deploy a deployment (httpd or nginx) "
sleep 5
echo "--- Apply main-nginx-deployment-01.yaml"
kubectl apply -f main-nginx-deployment-01.yaml
sleep 5
echo "--- Apply main-httpd-deployment-01.yaml"
kubectl apply -f main-httpd-deployment-01.yaml
sleep 5
echo
echo
echo "=========== Expose the deployment as a service"
sleep 5
echo "--- Apply kubectl expose deploy main-deployment-01-nginx --port 80  -n ingress-nginx"
kubectl expose deploy main-deployment-01-nginx --port 80  -n ingress-nginx
sleep 5
echo "--- Apply kubectl expose deploy main-deployment-01-httpd --port 80 -n ingress-nginx"
kubectl expose deploy main-deployment-01-httpd --port 80 -n ingress-nginx
echo
echo
echo "=========== Set up a resource host based routing rules"
sleep 5
echo "--- Apply ingress-nginx_and_http-path-based-routing-controller-resource-rules-01.yaml"
kubectl apply -f ingress-nginx_and_http-path-based-routing-controller-resource-rules-01.yaml
echo  
echo
echo
echo
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo
echo "=========== Mske sure everything is fine"
echo ------ kubectl get svc -n ingress-nginx
kubectl get svc -n ingress-nginx
echo ------ kubectl get all -n ingress-nginx
kubectl get all -n ingress-nginx
echo ------ kubectl get all -n metallb-system
kubectl get all -n metallb-system
echo

echo
echo
echo "=========== Update our DNS or our / etc/hosts"
sleep 5
EXTERNALIP="`kubectl get service -n ingress-nginx | grep -i loadbalancer | awk '{print $4}'`"
echo "--- $EXTERNALIP   main.example.com >> /etc/hosts"
sudo chmod 777 /etc/hosts
echo "$EXTERNALIP   main.example.com" >> /etc/hosts
sudo chmod 644 /etc/hosts
echo
echo
echo "=========== List our ingress ingress-nginx-httpd-resource-01 in namespace ingress-nginx"
echo
echo "--- kubectl get ingress -n ingress-nginx"
kubectl get ingress -n ingress-nginx
echo "--- kubectl describe ingress ingress-nginx-httpd-resource-01 -n ingress-nginx"
kubectl describe ingress ingress-nginx-httpd-resource-01 -n ingress-nginx
echo
echo
echo
echo "=========== Access our exposed service of type CLUSTER-IP via the host based routing rules. "
sleep 5
echo "--- curl main.example.com:80/nginx"
echo ------------------------------------------------------
curl main.example.com:80/nginx
echo
echo
echo ------------------------------------------------------
echo
echo "--- curl main.example.com:80/httpd"
curl main.example.com:80/httpd
echo ------------------------------------------------------

