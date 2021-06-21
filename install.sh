#!/bin/sh

# Done by: Vigneshwar Ravichandar

# RESTORE ENVIRONMENT SCRIPT
# This is a script which automatically reinstalls all previously used apps when resetting for convenience.

# ---------------------------------------------------------------------------------------------------------


# MAIN FUNCTION
echo "----------------------------------SYSTEM RESTORE SCRIPT----------------------------------"

echo -n "Press Y to proceed... To abort Press N: "
read res

if [[ $res -eq 'y' ]] || [[ $res -eq 'Y' ]]
then
    echo -n "Press 1 for Debian based linux and Press 2 for Red Hat based linux: "
    read osres
    if [[ $osres -eq 1 ]]
    then
        bash deb.sh
    elif [[ $osres -eq 2 ]]
    then
        bash rhel.sh
    fi

elif [[ $res -eq "n" ]] || [[ $res -eq "N" ]]
then
    echo "Exiting the script."
fi
