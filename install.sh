#!/bin/sh
# Done by: Vigneshwar Ravichandar
# This is a script which automatically reinstalls all previously used apps when resetting for convenience.

# ---------------------------------------------------------------------------------------------------------

# SUB FUNCTION TO UNINSTALL UNWANTED SOFTWARES (DEBIAN)
remove_deb()
{
    echo "Checking if Firefox is already installed..."
    if which firefox >/dev/null;
    then
        echo "Firefox is installed..."
        echo "Removing Firefox..."
        sudo apt remove firefox
    else
        echo "Firefox is not installed."
        echo "Skipping to next application..."
    fi

    echo "Checking if Thunderbird is already installed..."
    if which thunderbird >/dev/null;
    then
        echo "Thunderbird is installed..."
        echo "Removing thunderbird..."
        sudo apt remove thunderbird
    else
        echo "Thunderbird is not installed..."
        echo "Skipping to next application..."
    fi
}

# SUB FUNCTION TO DOWNLOAD AND INSTALL GOOGLE CHROME (DEBIAN)
chrome_deb()
{
    echo "Checking if Google Chrome is already installed..."
    if which google-chrome >/dev/null;
    then
        echo "Chrome is already installed..."
        echo "Skipping reinstallation of Google Chrome..."
    else
        echo "Installing Google Chrome..."
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo dpkg -i google-chrome-stable_current_amd64.deb
        echo "Sucessfully installed Google Chrome."
    fi
}

# SUB FUNCTION TO INSTALL AND CONFIGURE GIT (DEBIAN)
git_deb()
{
    echo "Checking if Git is already installed..."
    if which git >/dev/null;
    then
        echo "Git is already installed..."
        echo "Skipping reinstallation of Git..."
    else
        echo "Installing Git..."
        sudo apt install git
        echo "Sucessfully installed Git."
    
    echo "Configuring Git..."
    git config --global user.name "ToastCoder"
    git config --global user.email "vicky.pcbasic@gmail.com"
    echo "Successfully configured git."
    fi
}

# FUNCTION TO INSTALL APPS ON DEBIAN BASED DISTROS
install_deb()
{
    echo "Checking for System Updates..."
    sudo apt update
    sudo apt upgrade -y
    echo "Removing softwares which is not used before resetting..."
    remove_deb
    chrome_deb
    git_deb
}

# MAIN FUNCTION
echo "_____________________________________________________________________________________________________"
echo "|                                                                                                   |"
echo "|                                     SYSTEM RESTORE SCRIPT                                         |"
echo "|___________________________________________________________________________________________________|"
echo
echo "Press Y to proceed... To abort Press N"
read res
if [[ $res -eq 'y' ]] || [[ $res -eq 'Y' ]]
then

    echo "Press 1 for Debian based linux"
    echo "Press 2 for Red Hat based linux"
    read osres
    if [[ $osres -eq 1 ]]
    then
        install_deb
    elif [[ $osres -eq 2 ]]
    then
        install_rhel
    fi

elif [[ $res -eq "n" ]] || [[ $res -eq "N" ]]
then
    echo "Thank you..."
fi


