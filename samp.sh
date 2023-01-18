#!/bin/bash
bold=$(echo -en "\e[1m")
nc=$(echo -en "\e[0m")
lightblue=$(echo -en "\e[94m")
lightgreen=$(echo -en "\e[92m")

echo "${nc}"
    if [[ -f "./samp03svr" ]]; then
        echo "${bold}${lightgreen}==> O Samp Linux foi detectado, O Sistema de donwload não será necessario. <=="
        echo "${bold}${lightgreen}==> Setando permissões padrões. <=="
        chmod 777 samp03svr
        echo "${bold}${lightgreen}==> Iniciando Servidor. <=="
        ./samp03svr
        echo "${bold}${lightgreen}==> Servidor Iniciado. <=="
    else
        echo "${bold}${lightgreen}==> O Samp Linux Não Detectado, O Sistema de donwload será iniciado. <=="
        curl -L -o ./ "https://github.com/drylian/tralhas/releases/latest/download/samp03svr)"
        echo "${bold}${lightgreen}==> Download Terminado, iniciando configurações padrões. <=="
        echo "${bold}${lightgreen}==> Setando permissões padrões. <=="
        chmod 777 samp03svr
        echo "${bold}${lightgreen}==> Iniciando Servidor. <=="
        ./samp03svr
        echo "${bold}${lightgreen}==> Servidor Iniciado. <=="
    echo "
fi
