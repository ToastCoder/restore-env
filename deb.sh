# FUNCTION TO UNINSTALL UNWANTED SOFTWARES (DEBIAN)
remove_deb()
{
    declare -a rem=("Firefox" "Thunderbird" "Geary")      
    for i in "${rem[@]}"
    do
        echo "Checking if $i is already installed..."
        if which "${i,,}" >/dev/null;
        then
            echo "$i is installed."
            echo "Removing $i...."
            sudo apt remove ${i,,} -y
        else
            echo "$i is not installed."
            echo "Skipping to the next application..."
        fi
    done
}

# FUNCTION TO INSTALL PACKAGES FROM APT PACKAGE MANAGER
install_apt()
{
    declare -a ins=("Git" "Discord" "Telegram-Desktop" "Node" "OBS" "Npm" "Microsoft-Edge-Dev" "Protonvpn")
    for i in "${ins[@]}"
    do
        echo "Checking if $i is already installed..."
        if which "${i,,}" >/dev/null;
        then
            echo "$i is installed."
            echo "Skipping installation of $i..."
        else
            echo "Installing $i..."
            sudo apt install "${i,,}" -y
            echo "Successfully installed $i"

}

# FUNCTION TO DOWNLOAD AND INSTALL SPOTIFY (DEBIAN)
spotify_deb()
{
    echo "Checking if Spotify is already installed..."
    if which spotify >/dev/null;
    then
        echo "Spotify is already installed."
        echo "Skipping installation of Spotify..."
    else
        echo "Installing Spotify..."
        curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
        echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
        sudo apt-get update && sudo apt-get install spotify-client
        echo "Successfully installed Spotify."
}

# FUNCTION TO DOWNLOAD AND INSTALL STEAM (DEBIAN)
steam_deb()
{
    echo "Checking if Steam is already installed..."
    if which steam >/dev/null;
    then
        echo "Steam is already installed..."
        echo "Skipping reinstallation of Steam.."
    else
        echo "Installing Steam..."
        wget https://cdn.akamai.steamstatic.com/client/installer/steam.deb
        sudo dpkg -i steam.deb
        sudo rm steam.deb
        echo "Sucessfully installed Steam."
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
        sudo rm google-chrome-stable-current_amd64.deb
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
    git config advice.addIgnoredFile false
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

# FUNCTION TO INSTALL AND CONFIGURE VIM
vim_setup()
{
	echo "Checking if Vim is already installed..."
	if which vim >/dev/null;
	then
        echo "Vim is already installed."
        echo "Skipping Vim installation..."
    else
        echo "Installing Vim..."
        sudo apt install vim
        echo "Successfully installed Vim"
    fi
    mkdir .vim
    touch .vimrc
    mkdir .vim/colors
    echo "call plug#begin(expand('~/.vim/plugged'))
Plug 'arcticicestudio/nord-vim'
Plug 'kyoto-shift/film-noir'
Plug 'vimsence/vimsence'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'HenryNewcomer/vim-theme-papaya'
call plug#end()

let g:film_noir_color='blue'

if (has("termguicolors"))
  set termguicolors
endif

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }
set noshowmode
set laststatus=2
colorscheme papaya_original
set autoindent
set smartindent
set mouse=a
set tabstop=4
set shiftwidth=4
set number
set expandtab" >> .vimrc
}
	
# MAIN FUNCTION
echo "Checking for System Updates..."
sudo apt update
sudo apt upgrade -y
echo "Removing softwares which is not used before resetting..."
remove_deb
echo "Installing Required Softwares..."
install_apt
chrome_deb
git_deb
conda_deb
jdk_deb
jre_deb
vim_setup


