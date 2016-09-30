Basic Magento / Wordpress deployer, through composer, with pre-added modules, database and code backup, magerun installer.

Usage: requires SSH access to server

Log on server, do git clone https://github.com/Lhari/deploer
cp deployer/deploy.sh .
. deploy.sh

Fill in info as requested, this will build a folder called vars that stores all your deployment values
After first deploy, simply log on, and run . deploy.sh
