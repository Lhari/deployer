if [[ ! -d n98-magerun ]]; then

	git clone https://github.com/netz98/n98-magerun
	cd n98-magerun
	curl -s https://getcomposer.org/installer | php
	php -f ./composer -- install
	cd .. 
	cat << EOT >> .bashrc
	alias magerun="php -f ~/n98-magerun/bin/n98-magerun"
	EOT

	echo "Magerun installed"
	echo "Please make sure your references for database is 127.0.0.1 instead of localhost"

	cd public_html
	magerun db:info

	echo "Please make sure your references for database is 127.0.0.1 instead of localhost"

	cd ..
fi

