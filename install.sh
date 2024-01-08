#!/bin/bash
# Check if Go is installed, if not, install it.
sudo apt update
apt install unzip
if ! command -v go &> /dev/null; then
    echo "Go is not installed. Installing..."
    sudo snap install go --classic
    go version 
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
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    sudo mv ~/go/bin/subfinder /usr/bin
fi

# Install httpx
if ! check_installed "httpx"; then
    echo "Installing httpx..."
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    sudo mv ~/go/bin/httpx /usr/bin
fi

# Install nuclei
if ! check_installed "nuclei"; then
    echo "Installing nuclei..."
    go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
    sudo mv  ~/go/bin/nuclei /usr/bin
fi

# Install aquatone
if ! check_installed "aquatone"; then
    echo "Installing aquatone..."
    wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
    unzip aquatone_linux_amd64_1.7.0.zip 
    rm -r  LICENSE.txt  README.md  aquatone_linux_amd64_1.7.0.zip 
    sudo mv aquatone /usr/bin

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
# Install notify
if ! check_installed "notify"; then
    echo "Installing notify..."
    go install -v github.com/projectdiscovery/notify/cmd/notify@latest
    sudo mv ~/go/bin/notify /usr/bin
fi
# Install mapcider
if ! check_installed "mapcidr"; then
    echo "Installing mapcidr..."
    go install -v github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest
    sudo mv ~/go/bin/mapcidr /usr/bin
fi
# Install assetfinder
if ! check_installed "assetfinder"; then
    echo "Installing assetfinder..."
    go install -v github.com/tomnomnom/assetfinder@latest
    sudo mv ~/go/bin/assetfinder /usr/bin
fi
# Install httprobe
if ! check_installed "httprobe"; then
    echo "Installing httprobe..."
    go install -v github.com/tomnomnom/httprobe@latest
    sudo mv ~/go/bin/httprobe /usr/bin
fi
# Install waybackurls
if ! check_installed "waybackurls"; then
    echo "Installing waybackurls..."
    go install -v github.com/tomnomnom/waybackurls@latest
    
    sudo mv ~/go/bin/waybackurls /usr/bin
fi
# Install anew
if ! check_installed "anew"; then
    echo "Installing anew..."
    go install -v github.com/tomnomnom/anew@latest
    sudo mv ~/go/bin/anew /usr/bin
fi
# Install ffuf
if ! check_installed "ffuf"; then
    echo "Installing ffuf..."
    go install -v github.com/ffuf/ffuf@latest
    sudo mv ~/go/bin/ffuf /usr/bin
fi
# Install gau
if ! check_installed "gau"; then
    echo "Installing gau..."
    go install -v github.com/lc/gau/v2/cmd/gau@latest
    sudo mv ~/go/bin/gau /usr/bin
fi
if  ! check_installed "subfinder" && ! check_installed "httpx" && ! check_installed "nuclei" && ! check_installed "aquatone" && ! check_installed "subzy" && ! check_installed "katana" && ! check_installed "cors" && ! check_installed "gau"  && ! check_installed "ffuf"  && ! check_installed "anew"  && ! check_installed "waybackurls"  && ! check_installed "httprobe"  && ! check_installed "assetfinder"  && ! check_installed "mapcidr" && ! check_installed "notify" && ! check_installed "naabu"; then
    echo "Some tools may not have been installed. Please check the installation manually."
else 
    echo "All tools have been successfully installed"
fi