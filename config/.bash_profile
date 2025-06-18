#Calling Bashrc from Profile to get same customization everywhere
# Now after this we can make customization in one file only
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
