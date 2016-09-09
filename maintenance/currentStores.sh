PATH=public_html

for i in $PATH/app/design/frontend/*; do
	echo "$i" >> $PATH/currentstoreviews.txt
done
