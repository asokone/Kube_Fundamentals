for file in deployment-service-03-mongodb.yaml deployment-03-mongodb-secrets.yaml deployment-03-mongoexpress.yaml deployment-03-mongodb-configMap.yaml
do
echo ======= kubectl delete -f $file
kubectl delete -f $file
echo
sleep 10
done

