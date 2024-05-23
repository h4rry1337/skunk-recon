#!/usr/bin/env bash
cd ~/skunk-recon
go install -v github.com/projectdiscovery/pdtm/cmd/pdtm@latest
pdtm -install-all
go install github.com/c3l3si4n/godeclutter@HEAD
wget https://gist.githubusercontent.com/six2dez/ffc2b14d283e8f8eff6ac83e20a3c4b4/raw -O wordlist.txt
curl https://raw.githubusercontent.com/trickest/resolvers/main/resolvers.txt -O
wget https://github.com/tomnomnom/assetfinder/releases/download/v0.1.1/assetfinder-linux-amd64-0.1.1.tgz
tar -xzf assetfinder-linux-amd64-0.1.1.tgz
sudo mv assetfinder /usr/bin/
rm assetfinder-linux-amd64-0.1.1.tgz
wget https://github.com/Findomain/Findomain/releases/download/9.0.0/findomain-linux.zip
unzip findomain-linux.zip
sudo mv findomain /usr/bin/
rm findomain-linux.zip
wget https://github.com/trickest/mksub/releases/download/v1.1.1/mksub-1.1.1-linux-amd64.zip
unzip mksub-1.1.1-linux-amd64.zip
sudo mv mksub-1.1.1-linux-amd64 /usr/bin/
rm mksub-1.1.1-linux-amd64.zip
wget https://github.com/Josue87/gotator/archive/refs/tags/v1.1.zip
unzip v1.1.zip
cd gotator-1.1; go build
cd ..
sudo mv gotator /usr/bin/
rm v1.1.zip
rm -rf gotator-1.1
wget https://github.com/d3mondev/puredns/releases/download/v2.1.1/puredns-Linux-amd64.tgz
tar -xvzf puredns-Linux-amd64.tgz
mv puredns /usr/bin/
rm puredns-Linux-amd64.tgz
wget https://github.com/blechschmidt/massdns/archive/refs/tags/v1.0.0.zip
unzip v1.0.0.zip
mv massdns-1.0.0 /usr/bin/
rm v1.0.0.zip
