if [ $# == 0 ]
then
	echo "

-----------------------------------------------
Usage: ./$0 <namespace>
To retart all pod in the namespace
-----------------------------------------------

"
	exit 1
fi
namespace=$1
deploys=`kubectl -n $namespace get deployments | tail -n +2 | cut -d ' ' -f 1`

echo == $deploys

for deploy in $deploys; do
  echo kubectl -n $namespace rollout restart deployments/$deploy
done

