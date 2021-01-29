# FUNCTION TO UNINSTALL UNWANTED SOFTWARES (DEBIAN)
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

    echo "Checking if Geary is already installed..."
    if which geary >/dev/null;
    then
        echo "Geary is installed..."
        echo "Removing geary..."
        sudo apt remove geary
    else
        echo "Geary is not installed..."
        echo "Skipping to next application..."
    fi

}

# FUNCTION TO DOWNLOAD AND INSTALL GOOGLE CHROME (DEBIAN)
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

# FUNCTION TO INSTALL AND CONFIGURE GIT (DEBIAN)
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

# FUNCTION TO INSTALL VSCODE (DEBIAN)
vscode_deb()
{
    echo "Checking if Visual Studio Code is already installed..."
    if which code >/dev/null;
    then
        echo "Visual Studio Code is already installed."
        echo "Skipping Visual Studio Code installation..."
    else
        echo "Installing Visual Studio Code..."
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        sudo apt-get install apt-transport-https
        sudo apt-get update
        sudo apt-get install code
        echo "Successfully installed Visual Studio Code"
    fi
}

# FUNCTION TO INSTALL ANACONDA
conda_deb()
{
    echo "Checking if Anaconda is already installed..."
    if which conda >/dev/null;
    then
        echo "Anaconda is already installed."
        echo "Skipping Anaconda installation..."
    else
        echo "Installing Pre-requisites for anaconda..."
        apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
        echo "Downloading and installing anaconda..."
        mkdir temp
        cd temp
        version=$(wget https://repo.anaconda.com/archive/ -q -O- |\
        grep 'Anaconda3'|\
        sed -n 's|.*>Anaconda3-\([0-9]\{4\}\.[0-9]\{2\}\)-.*|\1|p' |\
        uniq |\
        sort -r |\
        head -1)
        wget "https://repo.anaconda.com/archive/Anaconda3-$version-Linux-x86_64.sh"
        cd ..
        conda init
        conda activate base
        conda config --set auto_activate_base False
        conda deactivate base
        echo "Successfully installed and configured Anaconda."
    fi
}

# FUNCTION TO INSTALL JDK
jdk_deb()
{
    echo "Checking if JDK is already installed...."
    if which javac >/dev/null;
    then
        echo "JDK is already installed."
        echo "Skipping JDK installation..."
    else
        echo "Installing JDK..."
        sudo apt install default-jdk
        echo "Sucessfully installed JDK"
    fi
}

# FUNCTION TO INSTALL JRE
jre_deb()
{
    echo "Checking if JRE is already installed..."
    if which java >/dev/null;
    then
        echo "JRE is already installed."
        echo "Skipping JRE installation..."
    else
        echo "Installing JRE..."
        sudo apt install default-jre
        echo "Successfully installed JRE"
    fi
}

# FUNCTION TO INSTALL NODE.JS
node_deb()
{
    echo "Checking if Node.js and npm are already installed"
    if which node >/dev/null;
    then
        if which npm >/dev/null;
        then
            echo "npm and Node.js are already installed."
            echo "Skipping their installation..."
        else
            echo "Installing npm..."
            sudo apt install npm
            echo "Successfully installed npm."
        fi
    fi
}

# MAIN FUNCTION
echo "Checking for System Updates..."
sudo apt update
sudo apt upgrade -y
echo "Removing softwares which is not used before resetting..."
remove_deb
chrome_deb
git_deb
conda_deb
jdk_deb
jre_deb
node_deb
