# create temp files for vim
mkdir ~/.tmp

# make npm non sudo-able 
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo "export PATH=~/.npm-global/bin:$PATH" >> ~/.profile
