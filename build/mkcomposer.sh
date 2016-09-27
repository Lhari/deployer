. vars/settings.sh

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
        "block": {
            "name": "blocks",
            "type": "vcs",
            "url": "git@github.com:klean/blocks.git"
        },
        "wordpress": {
            "type": "composer",
            "url": "http://wpackagist.org"
        }
    },
    "require": {
        "magento-hackathon/magento-composer-installer": "*",
        "aydin-hassan/magento-core-composer-installer": "*",
        "firegento/magento": "1.9.2.*",
        "connect20/cadence_fbpixel": "*",
        "connect20/chapagain_googletagmanager": "0.1.0",
        "connect20/aromicon_google_universal_analytics": "*",
        "aoepeople/aoe_scheduler": "1.*",
        "$PROJECTNAME": "dev-$BRANCH",
        "blocks": "dev-master",
        "php": ">=5.4",
        "johnpbloch/wordpress": "4.*",
        "wpackagist-plugin/user-role-editor": "*",
        "wpackagist-plugin/login-redirect-url": "*",
        "wpackagist-plugin/simple-seo-pack": "*",
        "wpackagist-plugin/akismet": "*"
    },
    "extra": {
        "wordpress-install-dir": "public_html__new/wp/",
        "magento-deploystrategy": "copy",
        "magento-root-dir": "public_html__new",
        "auto-append-gitignore": true,
        "magento-force": true
    }
}

_EOF_

# Old Extensions, removed for various reasons
# "connect20/chapagain_googletagmanager": "0.1.0",