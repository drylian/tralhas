echo "iniciando instalador Versão Kinetic Kudu(22.10) , root necessario"
echo "Instalando repos iniciais e outros."
sudo apt apdate -y
sudo apt upgrade -y
echo "Instalando repo WineHQ"
sudo dpkg --add-architecture i386 
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/kinetic/winehq-kinetic.sources
echo "Atualizando Repo WineHQ"
sudo apt update
echo "Iniciando instalação do WineHQ Stable"
sudo apt install --install-recommends winehq-stable -y
echo "Instalação WineHQ completa"
echo "Instalando Qjoypad(controles xbox),libfuse2 e zenity(para rodar appimage)"
sudo apt install qjoypad -y
sudo apt install libfuse2 -y
sudo apt install zenity -y
echo "Iniciando instalação do Gnome-disk-utility(Montador de disco)"
sudo apt-get install gnome-disk-utility -y
echo "instalação completa , por enquanto"
