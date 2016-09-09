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

if [[ ! -d vars ]]; then
	mkdir vars
fi

cat > vars/settings.sh << _EOF_
BRANCH=$BNAME
GITNAME=$GNAME
PROJECTNAME=$PNAME
TEMPLATENAME=$TNAME
_EOF_