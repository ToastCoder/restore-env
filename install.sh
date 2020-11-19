#!/bin/sh
# Done by: Vigneshwar Ravichandar
# This is a script which automatically reinstalls all previously used apps when resetting for convenience.

# ---------------------------------------------------------------------------------------------------------

# SUB FUNCTION TO DOWNLOAD AND INSTALL GOOGLE CHROME
chrome_deb()
{
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
}

# FUNCTION TO INSTALL APPS ON DEBIAN BASED DISTROS
install_deb()
{
    echo "Checking for System Updates..."
    sudo apt update
    sudo apt upgrade -y
    echo "Installing Google Chrome..."
    chrome_deb
    echo "Sucessfully installed Google Chrome..."
}

# MAIN FUNCTION
echo "_____________________________________________________________________________________________________"
echo "|                                                                                                   |"
echo "|                                     SYSTEM RESTORE SCRIPT                                         |"
echo "|___________________________________________________________________________________________________|"
echo
echo "Press Y to proceed... To abort Press N"
read res

# AWAITING USER RESPONSE
if [[$res == y || $res == Y]]
then
    echo "Press 1 for Debian based linux"
    echo "Press 2 for Red Hat based linux"
    read osres
    if [[$osres == 1]]
    then
        install_deb
    else
        install_rhel
    fi
fi


