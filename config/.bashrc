# Some Special Characters
# \u: username
# \s: name of the shell
# \h: hostname upto the first .
# \w: current working directory
# \W: Basename of the current working directory
# \t: current time in 24-h format
# \n: new line

# Adding Custom Prompt
# username@hostname (Base directory) ->
PS1="\u@\h (\W) -> "
export PS1

# $() --> Results of command inside bracket
