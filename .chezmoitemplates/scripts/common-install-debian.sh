echo "Common install for Debian"

# -- Install tools

sudo add-apt-repository -y ppa:jdxcode/mise
sudo apt update -y
sudo apt install -y git zsh mise
curl -fsSL https://get.jetify.com/devbox | bash
{{- if .isPersonal }}
sudo add-apt-repository ppa:phoerious/keepassxc
sudo apt update -y
sudo apt install -y keepassxc
{{- end }}

# snacks.nvim (image) - PDF preview
sudo apt install -y ghostscript
# snacks.nvim (image) - Image preview
sudo apt install -y imagemagick
# lua
# cannot be installed with mise without building from source
sudo apt install -y lua5.1 luarocks
