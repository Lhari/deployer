# Create the basic access level for the deployment script

# Determine Project
echo 'Which project will be deployed to this folder?'
read PNAME

echo 'Whats the git name of the project?'
read GNAME

# Determine Branch
echo "Please enter the branch you would like to deploy to this server"
read BNAME

# Determine Template
echo "Define the base template (for Magento)"
read TNAME

echo "Please enter the database name"
read DNAME

echo "Please enter the Database User"
read DUSER

echo "Please enter the Database password"
read DPASS



if [[ ! -d vars ]]; then
	mkdir vars
fi

cat > vars/settings.sh << _EOF_
BRANCH=$BNAME
GITNAME=$GNAME
PROJECTNAME=$PNAME
TEMPLATENAME=$TNAME
db_name=$DNAME
db_user=$DUSER
db_pass=$DPASS
_EOF_