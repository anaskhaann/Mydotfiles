# Colours for Prompts
cyan=$(tput setaf 051)
red=$(tput setaf 196)
purple=$(tput setaf 005)
green=$(tput setaf 71)
yellow=$(tput setaf 228)
orange=$(tput setaf 208)
white=$(tput setaf 15)
bold=$(tput bold)
reset=$(tput sgr0) #reset

# Git Branch Function
parse_git_branch() {
    # Check if we are inside a Git repository
    # If not, 'return' immediately and print nothing.
    git rev-parse --is-inside-work-tree &>/dev/null || return

    # Get the current branch name
    # --abbrev-ref HEAD: shows the branch name (e.g., master, main, develop)
    local branch_name=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    # Check if a branch name was successfully retrieved and not "HEAD" (for detached HEAD)
    if [[ -n "$branch_name" && "$branch_name" != "HEAD" ]]; then
        echo " (${branch_name})" # Print the branch name in parentheses
    fi
}

# Dynamic color for root vs user
# if [ "$UID" -eq 0 ]; then
#     user_color=${red} # red for root
# else
#     user_color=${purple} # default user color
# fi

# Custom Prompt
PS1="\[${bold}\]\n"
PS1+="\[${purple}\]\u" #username
PS1+="\[${white}\]@"
PS1+="\[${green}\]\h " #hostname
PS1+="\[${white}\]in "
PS1+="\[${yellow}\]\W"                  #base directory
PS1+="\[${orange}\]$(parse_git_branch)" #git Branch
PS1+="\n"                               #new line
PS1+="\[${white}\]-> \[${reset}\]"

export PS1

# Aliases

alias ..="cd .."
alias proj="cd D:\Projects"
alias gcm="git commit -m"
alias cls="clear"
