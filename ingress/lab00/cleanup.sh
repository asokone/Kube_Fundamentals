kubectl delete -f ingress-nginx-deploy.yaml
kubectl delete -f nginx-deploy.yaml -n default
kubectl delete -f service/loadbalancer.yaml
kubectl delete -f deployment/nginx-ingress.yaml
kubectl delete -f common/global-configuration.yaml 
kubectl delete -f common/gc-definition.yaml 
kubectl delete -f common/ts-definition.yaml 
kubectl delete -f common/vsr-definition.yaml 
kubectl delete -f common/vs-definition.yaml 
kubectl delete -f common/nginx-config.yaml
kubectl delete -f common/default-server-secret.yaml
kubectl delete -f rbac/rbac.yaml
kubectl delete -f common/ns-and-sa.yaml
kubectl get all -n metal
kubectl delete -f metallb.yaml
kubectl delete metallb.yaml
kubectl delete -f namespace.yaml
kubectl delete service/nginx-deploy

