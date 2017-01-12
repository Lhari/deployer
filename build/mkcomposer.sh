. vars/settings.sh

# Old Extensions, removed for various reasons

cat > composer.json <<- _EOF_
{
    "name": "Klean/CI Deployer",
    "description": "first iteration of CI deployer files",
    "authors": [
        {"name": "Kasper Hansen", "email": "Kasper@klean.dk"}
    ],
    "repositories": {
        "installer-magento-core": {
            "type": "git",
            "url": "https://github.com/AydinHassan/magento-core-composer-installer"
        },
        "magento": {
            "type": "git",
            "url": "https://github.com/firegento/magento"
        },
        "firegento": {
            "type": "composer",
            "url": "http://packages.firegento.com"
        },
        "template": {
                "name": "$PROJECTNAME",
                "type": "vcs",
                "url": "git@github.com:klean/$GITNAME.git"
        },

_EOF_

if [[ $ISWP = true ]]; then
cat << EOT >> composer.json
        "wordpress": {
            "type": "composer",
            "url": "http://wpackagist.org"
        },
EOT
fi

cat << EOT >> composer.json
        "block": {
            "name": "blocks",
            "type": "vcs",
            "url": "git@github.com:klean/blocks.git"
        }
    },
    "require": {
        "magento-hackathon/magento-composer-installer": "~1.0",
        "aydin-hassan/magento-core-composer-installer": "2.1.3",
        "magento/magento": "1.9.3.0",
        "$PROJECTNAME": "dev-$BRANCH",
        "connect20/chapagain_googletagmanager": "0.1.0",
        "connect20/yireo_checkouttester": "*",
EOT

. vars/serverExtensions.sh

if [[ $ISWP = true ]]; then
cat << EOT >> composer.json
        "php": ">=5.4",
        "johnpbloch/wordpress": "4.*",
        "wpackagist-plugin/user-role-editor": "*",
        "wpackagist-plugin/login-redirect-url": "*",
        "wpackagist-plugin/simple-seo-pack": "*",
EOT
fi

cat << EOT >> composer.json
        "blocks": "dev-master"
    },
    "extra": {
EOT

if [[ $ISWP = true ]]; then
cat << EOT >> composer.json
        "wordpress-install-dir": "public_html__new/wp/",
EOT
fi

cat << EOT >> composer.json
        "magento-deploystrategy": "copy",
        "magento-root-dir": "public_html__new",
        "auto-append-gitignore": true,
        "magento-force": true
    }
}
EOT
