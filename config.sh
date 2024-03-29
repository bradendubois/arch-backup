#!

# ************ File / Directory Lists ***********

# Files to back up
file_list=(
    ~/.bashrc
    ~/.bash_profile
)

# Directories to back up
directory_list=(
    ~/.dotfiles
    ~/Music
    ~/Documents
)

# *****************  Nice Colors ****************

# A nice shade of blue for formatting text
default='\033[1;34m'

# Disable any coloring
no_color='\033[0m'

# ***************** Functions ****************

# A helper function to print a string with colored text and a newline char
announce() {

    if [ $# == 2 ]
    then
        color=$2
    else
        color=$default
    fi

    printf "${default}${1}${default}\n"
}
