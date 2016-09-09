#!/usr/bin/env bash

. vars/settings.sh
cp -a vendor/DecoGroupTpl/Deploy/Template/* public_html
vendorPath="vendor/$PROJECTNAME"


# Targets for Vendor

tpltar='app/design/frontend/' 
fronttar='skin/frontend/'
mediatar='media/'

# Vendor extra move array

vendor=(
	"$vendorPath/Deploy/Template/*"
	"$vendorPath/Deploy/Frontend/*"
	"$vendorPath/Assets/media/*"
	"$vendorPath/Extensions/*"
	"$vendorPath/Public/*"
)

for element in ${vendor[@]}
do
	if [[ $element == *'Template'* ]]; then
	 	echo $element
	  cp -a $element 'public_html__new/'$tpltar
	elif [[ $element == *'Frontend'* ]]; then
		cp -a $element 'public_html__new/'$fronttar
	elif [[ $element == *'media'* ]]; then
		cp -a $element 'public_html__new/'$mediatar
	else
		cp -a $element 'public_html__new/'
	fi
done


# Custom copies

cp public_html/.htaccess public_html__new/
cp -a public_html/media/* public_html__new/media/
cp -a public_html/blocks/uploads/* public_html__new/blocks/uploads/
cp -a public_html/sales/* public_html__new/sales/
cp -a public_html/app/etc/local.xml public_html__new/app/etc

cp public_html/gardinbus/libraries/connect.class.php public_html__new/gardinbus/libraries/
cp public_html/blocks/libraries/connect.class.php public_html__new/blocks/libraries/