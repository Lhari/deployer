. vars/settings.sh

for i in vendor/$PROJECTNAME/Deploy/Packages/*.tar*; do
	echo Unpacking: $i
	tar -xf $i -C public_html__new
done