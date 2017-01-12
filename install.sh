echo "------------------------------------"
echo "Welcome to our Deployment script!"
echo "------------------------------------"
echo
if [ -f vars/settings.sh ]; then
	echo "Variable file found, proceeding"
else
	echo "You seem to be missing the variable folder, deploy can not be fulfilled."
	echo "Please follow the upcoming guide and set up your variables, after that, deploy will work."

	. build/mkvar.sh
fi
echo "------------------------------------"
echo

START=$(date +%s)
echo "Starting Timer for deploy"
echo "------------------------------------"
echo

echo "Backing up Database"
echo "------------------------------------"
echo
. mysql.sh

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Backing up took: $DIFF seconds"



echo "Cleaning up the previous install folders"
echo "------------------------------------"
echo
. build/clean.sh

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Cleaning took: $DIFF seconds"

echo "Downloading Magento and other modules through composer"
echo "------------------------------------"
echo
mkdir public_html__new
. build/mkcomposer.sh
php composer.phar install
rm composer.json

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Composer took: $DIFF seconds"
echo

echo "Installing zipped modules"
echo "------------------------------------"
echo

. build/packages.sh

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Packages took: $DIFF seconds"
echo

if [ -f vars/overwrites.sh ]; then
	echo "Running Overwrites"
	echo "------------------------------------"
	echo

	. build/overwrites.sh

	END=$(date +%s)
	DIFF=$(( $END - $START ))
	echo "Overwrites took: $DIFF seconds"
	echo
fi

if [ -f vars/removes.sh ]; then
	echo "Running Removes"
	echo "------------------------------------"
	echo
	
	. build/removes.sh

	END=$(date +%s)
	DIFF=$(( $END - $START ))
	echo "Removes took: $DIFF seconds"
	echo
fi


echo "Activating Deploy"
echo "------------------------------------"
echo

if [ -d public_html__oldest ]; then
	rm -rf public_html__oldest
fi

if [ -d public_html__old ]; then
	mv public_html__old public_html__oldest
fi

mv public_html public_html__old
mv public_html__new public_html

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Packages took: $DIFF seconds"
echo


echo "Running Maintenance"
echo "------------------------------------"
echo

. maintenance/chmod.sh
. maintenance/currentStores.sh
. maintenance/sitemap.sh

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Packages took: $DIFF seconds"
echo
echo
echo
echo "------------------------------------"
echo "Application ready!"
echo "------------------------------------"
echo
FINAL=$(date +%s)
DIFF=$(( $FINAL - $START ))
echo "Completed in: $DIFF seconds"
