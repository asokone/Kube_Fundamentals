for file in deployment-03-mongodb.yaml deployment-03-mongodb-secrets.yaml deployment-service-03-mongodb.yaml deployment-03-mongodb-configMap.yaml deployment-03-mongoexpress.yaml
do
echo ======= kubectl apply -f $file
kubectl apply -f $file
echo
sleep 10
done

