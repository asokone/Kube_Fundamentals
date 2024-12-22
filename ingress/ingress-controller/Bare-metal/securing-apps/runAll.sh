if [ ! -f ca.key ] || [ ! -f ca.crt ]
then
	echo "

The file ca.key or ca.crt is missing in this current directory.
Please follow the steps on the file kubeadm01-tls_implementation.txt
to generate a TLS Certifcates before running this script.

"
	ls -al kubeadm01-tls_implementation.txt
echo
echo
	exit 1
fi
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
echo "=========== Deploy a deployment (nginx or httpd) "
sleep 5
echo "--- Apply main-nginx-deployment-01.yaml"
kubectl apply -f main-nginx-deployment-01.yaml
echo
echo

echo "=========== Expose the deployment as a service"
sleep 5
echo "--- Apply kubectl expose deploy main-deployment-01-nginx --port 80  -n ingress-nginx"
kubectl expose deploy main-deployment-01-nginx --port 80  -n ingress-nginx
echo
echo
echo
echo

echo "=========== Set up a resource host based routing rules"
echo sleep 60
sleep 60
echo "--- Apply ingress-nginx-controller-resource-rules-01.yaml"
kubectl apply -f ingress-nginx-controller-resource-rules-01.yaml
echo  
echo
echo
echo
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo
echo "=========== Make sure everything is fine"
echo ------ kubectl get svc -n ingress-nginx
kubectl get svc -n ingress-nginx
echo ------ kubectl get all -n ingress-nginx
kubectl get all -n ingress-nginx
echo ------ kubectl get all -n metallb-system
kubectl get all -n metallb-system
echo ------ kubectl get secret -n ingress-nginx
kubectl get secret -n ingress-nginx

echo
echo
echo "=========== Update our DNS or our / etc/hosts"
sleep 5
echo "---  cp /etc/hosts /etc/hosts.orig.$$"
sudo cp /etc/hosts /etc/hosts.orig.$$
EXTERNALIP="`kubectl get service -n ingress-nginx | grep -i loadbalancer | awk '{print $4}'`"
echo "--- $EXTERNALIP   nginx.example.com >> /etc/hosts"
sudo chmod 777 /etc/hosts
echo "$EXTERNALIP   nginx.example.com" >> /etc/hosts
sudo chmod 644 /etc/hosts
echo
echo
echo "=========== List our ingress ingress-nginx-resource-01 in namespace ingress-nginx"
echo
echo "--- kubectl get ingress -n ingress-nginx"
kubectl get ingress -n ingress-nginx
echo "--- kubectl describe ingress ingress-nginx-resource-01 -n ingress-nginx"
kubectl describe ingress ingress-nginx-resource-01 -n ingress-nginx
echo
echo
echo
echo "=========== Access our exposed service of type CLUSTER-IP via the host based routing rules. "
sleep 5
echo "--- curl nginx.example.com:80/nginx without https"
echo ------------------------------------------------------
curl nginx.example.com:80/
echo
echo "--- curl nginx.example.com:80/nginx with https"
echo ------------------------------------------------------
curl https://nginx.example.com:80/
echo
echo "--- curl -k nginx.example.com:80/nginx with https"
echo ------------------------------------------------------
curl -k https://nginx.example.com:80/
echo
echo
echo ------------------------------------------------------

