#!

# Fix relative paths
scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
cd $scriptDir

source ./config.sh

# *************** Target Location **************

if [ ! $# == 1 ]
then
    announce "Incorrect arguments specified!"
    announce "Please provide target directory."
    echo $#
    exit 1
fi

if [ ! -d $1 ]
then
    announce "Did not provide a valid directory!"
    exit 2
fi

date_string=$(date +'%Y-%m-%d')
destination=$1/$date_string

if [ ! -e $destination ]
then
    mkdir "$1/$date_string"
fi

# *************** Files **************

announce "***************** Files ****************"

for file in "${file_list[@]}"
do
    if [ ! -e $file ]
    then
        announce "${file} not found, skipping."
    elif [ ! -f $file ]
    then
        announce "${file} is not a file, skipping."
    else
            announce "Backing up ${file}"
            sudo cp $file $destination/
        fi
done


# *************** Directories **************

announce "************** Directories *************"

for directory in "${directory_list[@]}"
do
    if [ ! -e $directory ]
    then
        announce "${directory} not found, skipping."
    elif [ ! -d $directory ]
    then
        announce "${directory} is not a directory, skipping."
    else
            announce "Backing up ${directory}"
            sudo cp -r $directory $destination/
        fi
done

# *************** pacman List **************
sudo pacman -Qq > $destination/aur_list.txt
