cd deployer/
. get.sh

cd ..

rm -rf maintenance/
rm -rf build/
rm -rf get.sh
rm -rf install.sh

cp -a deployer/* .

. install.sh
