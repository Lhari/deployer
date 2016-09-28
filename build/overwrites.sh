. vars/settings.sh
cp -a vendor/DecoGroupTpl/Deploy/Template/* public_html

# Vendor handles

vendorPath="vendor/$PROJECTNAME"

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
	"vendor/blocks/*"
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
	elif [[ $element == *'blocks'* ]]; then
		cp -a $element 'public_html__new/blocks/'
	else
		cp -a $element 'public_html__new/'
	fi
done

. vars/overwrites.sh