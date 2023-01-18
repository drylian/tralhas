#!/bin/bash
 
server_start() {
screen /home/sampsvr/startgtaserver.sh & # put in full path and name of startup script
} 
 
server_stop() {
killall startgtaserver.sh # your startup script name
killall samp03svr # need to put in path to killall if its not in $PATH
} 
 
server_restart() {
server_stop
sleep 1
server_start
}
case "$1" in
'stop')
server_stop
;;
echo "usage $0 start|stop|restart"
esac

bold=$(echo -en "\e[1m")
lightgreen=$(echo -en "\e[92m")
if [[ -f "./samp03svr" ]]; then
   echo "${bold}${lightgreen}==> O Samp Linux foi detectado, O Sistema de download não será necessario. <=="
   echo "${bold}${lightgreen}==> Setando permissões padrões. <=="
   chmod 777 samp03svr
   echo "${bold}${lightgreen}==> Iniciando Servidor. <=="
   ./samp03svr
    echo "${bold}${lightgreen}==> Servidor Iniciado. <=="
else
    echo "${bold}${lightgreen}==> O Samp Linux Não Detectado, O Sistema de download será iniciado. <=="
    curl -L -o /home/container/samp03svr "https://github.com/drylian/tralhas/releases/latest/download/samp03svr"
    echo "${bold}${lightgreen}==> Download Terminado, iniciando configurações padrões. <=="
    echo "${bold}${lightgreen}==> Setando permissões padrões. <=="
    chmod 777 samp03svr
    echo "${bold}${lightgreen}==> Iniciando Servidor. <=="
    ./samp03svr
    echo "${bold}${lightgreen}==> Servidor Iniciado. <=="
fi
echo "${bold}${lightgreen}==>Terminado.<=="
