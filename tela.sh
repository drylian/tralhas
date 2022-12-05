echo "Executar comando como Root caso de erro"

echo "Olá bem-vindo ao sistema de telas , teste."

echo "Executando apt install"

sudo apt install -y xorg gdm3 gnome-backgrounds gnome-session adwaita-icon-theme-full gnome-themes-standard gnome-control-center gnome-tweaks software-properties-gtk network-manager pulseaudio gnome-terminal nautilus --no-install-recommends

echo "Comandos de tela instalados com sucesso."

echo "Reiniciando sistema para abrir tela"

sudo reboot
