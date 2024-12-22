echo "Wait .... 10 seconds"
sleep 10
echo
echo
echo "=========== Update our DNS or our / etc/hosts"
sleep 5
EXTERNALIP="`kubectl get service -n ingress-nginx | grep -i loadbalancer | awk '{print $4}'`"
echo "--- sed -e 's/$EXTERNALIP   main.example.com//g' >> /etc/hosts"
sudo sed -e "s/$EXTERNALIP   main.example.com//g" -i /etc/hosts
sleep 5


echo
echo ++++++++++++++++++++++++++ BEFORE CLEANING ++++++++++++++++++++++++++++++++
echo
echo --- kubectl get svc -n ingress-nginx
kubectl get svc -n ingress-nginx
echo --- kubectl get all -n ingress-nginx
kubectl get all -n ingress-nginx
echo --- kubectl get all -n metallb-system
kubectl get all -n metallb-system
echo
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo
echo  

echo "=========== Set up a resource host based routing rules"
echo "--- Delete ingress-nginx-controller-resource-rules-01.yaml"
sleep 5
kubectl delete -f ingress-nginx-controller-resource-rules-01.yaml
echo
echo

echo "=========== Set the TLS Secret Keys"
sleep 5
echo
echo

echo "=========== Delete the exposed the deployments as services"
sleep 5
echo "--- Delete K8s exposed  main-deployment-01-httpd on port 80 in ingress-nginx namespace"
kubectl delete service main-deployment-01-httpd -n ingress-nginx

echo "--- Delete K8s exposed  in-deployment-01-nginx on port 80 in ingress-nginx namespace"
sleep 5
kubectl delete service main-deployment-01-nginx -n ingress-nginx
sleep 5
echo
echo

echo "=========== Delete the deployments (httpd or nginx) "
sleep 5
echo "--- Delete main-nginx-deployment-01.yaml"
sleep 5
kubectl delete -f main-nginx-deployment-01.yaml
echo
echo

echo "=========== Delete the Ingress Controller "
sleep 5
echo "--- Delete the deploy_nginx_ingress_controller_namespace_ingress-nginx.yaml"
kubectl delete -f deploy_nginx_ingress_controller_namespace_ingress-nginx.yaml
echo
echo

echo "=========== Delete the MetalLB LoadBalancer "
sleep 5
echo "--- Delete configmap.yaml"
kubectl delete -f configmap.yaml
sleep 5
echo "--- Delete metallb.v0.7.3.yaml "
kubectl delete -f  metallb.v0.7.3.yaml 
sleep 5
echo
echo +++++++++++++++++++++++++++++++ AFTER CLEANING UP +++++++++++++++++++++++++++++
echo
echo

echo "=========== Make sure we have clean up everything"
echo "------ kubectl get svc -n ingress-nginx"
kubectl get svc -n ingress-nginx
echo "------ kubectl get all -n ingress-nginx"
kubectl get all -n ingress-nginx
echo "------ kubectl get all -n metallb-system"
kubectl get all -n metallb-system
echo "------ kubectl get ingress -n ingress-nginx"
kubectl get ingress -n ingress-nginx
echo "------ kubectl get secret -n ingress-nginx"
kubectl get secret -n ingress-nginx
echo "------ kubectl describe ingress ingress-nginx-resource-01  -n ingress-nginx"
kubectl describe ingress ingress-nginx-resource-01 -n ingress-nginx
echo
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo
