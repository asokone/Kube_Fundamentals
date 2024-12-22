for line in "`cat list_of_american_presidents.txt`"
do
#	echo "$line"
#	for name in  $line
#	do
#		echo "Name: $name"
#	done
	
	i=0
	echo "{"
	for name in  $line
	do
echo "i=$i"
		if [ $i -eq 0 ]
		then
			echo "\"Firstname\": \"$name\","
			i=$(($i+1))
		if [ $i -eq 1 ]
		then
			echo "\"Lastname\": \"$name\""
			i=0
		fi	
	done
	echo "},"
done

