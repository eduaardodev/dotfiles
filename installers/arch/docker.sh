#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

log() { echo -e "${GREEN}[DOCKER]${NC} $1"; }

log "Removendo versões antigas ou conflitantes..."
sudo pacman -Rns --noconfirm docker docker-compose podman podman-compose podman-docker containerd runc 2>/dev/null

log "Atualizando repositórios e instalando Docker..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm --needed docker docker-compose

log "Habilitando e iniciando o serviço Docker..."
sudo systemctl enable --now docker

log "Adicionando o usuário '$USER' ao grupo docker..."
sudo usermod -aG docker "$USER"

log "Instalação concluída!"
echo -e "${GREEN}[IMPORTANTE]${NC} Você precisa fazer LOGOFF e LOGIN novamente para o grupo 'docker' funcionar."