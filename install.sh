#!/bin/bash

# Check if Go is installed, if not, install it.
if ! command -v go &> /dev/null; then
    echo "Go is not installed. Installing..."
    wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
    tar -xvf go1.21.1.linux-amd64.tar.gz
    sudo mv go /usr/local
    if [ -z "$GOPATH" ]; then
    echo "Setting GOPATH..."
    #echo 'export GOPATH="$HOME/go"' >> ~/.bashrc
    #echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.bashrc
    echo  'export PATH="$PATH:/usr/local/go/bin"' >> ~/.bashrc
    source ~/.bashrc
    fi


fi
check_installed() {
    local tool_name=$1
    if command -v $tool_name &> /dev/null; then
        echo "$tool_name is already installed."
        return 0
    else
        return 1
    fi
}
# Install subfinder
if ! check_installed "subfinder"; then
    echo "Installing subfinder..."
    wget https://github.com/projectdiscovery/subfinder/releases/download/v2.6.3/subfinder_2.6.3_linux_amd64.zip
    unzip subfinder_2.6.3_linux_amd64.zip
    rm subfinder_2.6.3_linux_amd64.zip
    sudo mv ~/go/bin/subfinder /usr/bin
fi

# Install httpx
if ! check_installed "httpx"; then
    echo "Installing httpx..."
    wget https://github.com/projectdiscovery/httpx/releases/download/v1.3.5/httpx_1.3.5_linux_amd64.zip
    unzip httpx_1.3.5_linux_amd64.zip
    rm httpx_1.3.5_linux_amd64.zip
    sudo mv ~/go/bin/httpx /usr/bin
fi

# Install nuclei
if ! check_installed "nuclei"; then
    echo "Installing nuclei..."
    wget https://github.com/projectdiscovery/nuclei/releases/download/v2.9.14/nuclei_2.9.14_linux_amd64.zip
    unzip nuclei_2.9.14_linux_amd64.zip
    rm nuclei_2.9.14_linux_amd64.zip
    sudo mv  ~/go/bin/nuclei /usr/bin
fi

# Install aquatone
if ! check_installed "aquatone"; then
    echo "Installing aquatone..."
    wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
    unzip aquatone_linux_amd64_1.7.0.zip 
    rm aquatone_linux_amd64_1.7.0.zip 
    sudo mv ~/go/bin/aquatone /usr/bin

fi

# Install subzy
if ! check_installed "subzy"; then
    echo "Installing subzy..."
    go install -v github.com/LukaSikic/subzy@latest
    sudo mv ~/go/bin/subzy /usr/bin
fi

# Install katana
if ! check_installed "katana"; then
    echo "Installing katana..."
    go install github.com/projectdiscovery/katana/cmd/katana@latest
    sudo mv ~/go/bin/katana /usr/bin
fi

# Install CorsMe
if ! check_installed "cors"; then
    echo "Installing CorsMe..."
    go install -v github.com/shivangx01b/CorsMe@latest
    sudo mv ~/go/bin/CorsMe ~/go/bin/cors
    sudo mv ~/go/bin/cors /usr/bin
fi

if  ! check_installed "subfinder" && ! check_installed "httpx" && ! check_installed "nuclei" && ! check_installed "aquatone" && ! check_installed "subzy" && ! check_installed "katana" && ! check_installed "cors"; then
    echo "Some tools may not have been installed. Please check the installation manually."
else 
    echo "All tools have been successfully installed"
fi