#!/bin/bash

echo "Iniciando comandos start execute isso em root"

systemctl enable --now panel.service
systemctl enable --now redis-server

echo "terminado"
