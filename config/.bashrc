# Colours for Prompts
cyan=$(tput setaf 051)
purple=$(tput setaf 005)
green=$(tput setaf 71)
yellow=$(tupt setaf 228)
white=$(tput setaf 15)
bold=$(tput bold)
reset=$(tput sgr0) #reset

# Custom Prompt
PS1="\[${bold}\]\n"
PS1+="\[${purple}\]\u" #username
PS1+="\[${white}\]@"   #username
PS1+="\[${green}\]\h " #hostname
PS1+="\[${white}\]in "
PS1+="\[${yellow}\]\W" #base directory
PS1+="\n"              #new line
PS1+="\[$(white)\]-> \[$(reset)\]"
export PS1
