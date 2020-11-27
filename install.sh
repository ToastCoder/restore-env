#!/bin/sh
# Done by: Vigneshwar Ravichandar
# This is a script which automatically reinstalls all previously used apps when resetting for convenience.

# ---------------------------------------------------------------------------------------------------------


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
        bash sub-scripts/deb.sh
    elif [[ $osres -eq 2 ]]
    then
        install_rhel
    fi

elif [[ $res -eq "n" ]] || [[ $res -eq "N" ]]
then
    echo "Thank you..."
fi
