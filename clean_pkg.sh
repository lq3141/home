rm -f update_home
rm -f modules/installit
rm -f README.md

if [ -d .git ]; then
    rm -rf .git
    rm -rf .gitignore
    rm -rf .gitmodules
fi

find -name ".git*" | xargs rm -rf

