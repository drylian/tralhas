#!/bin/bash
    if [[ -f "./samp03svr" ]]; then
        echo "==> O Samp Linux foi detectado, O Sistema de donwload não será necessario. <=="
        echo "==> Setando permissões padrões. <=="
        chmod 777 samp03svr
        echo "==> Iniciando Servidor. <=="
        ./samp03svr
        echo "==> Servidor Iniciado. <=="
    else
        echo "==> O Samp Linux Não Detectado, O Sistema de donwload será iniciado. <=="
        curl -L -o ./ "https://github.com/drylian/tralhas/releases/latest/download/samp03svr"
        echo "==> Download Terminado, iniciando configurações padrões. <=="
        echo "==> Setando permissões padrões. <=="
        chmod 777 samp03svr
        echo "==> Iniciando Servidor. <=="
        ./samp03svr
        echo "==> Servidor Iniciado. <=="
fi
echo "Completado"
