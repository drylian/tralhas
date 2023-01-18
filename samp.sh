#!/bin/bash
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
