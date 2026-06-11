#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[SETUP]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[ATENÇÃO]${NC} $1"
}

log "Iniciando setup. Atualizando lista de pacotes e sistema..."
sudo pacman -Syu --noconfirm

log "Instalando Git, Curl, Flatpak e ferramentas de build..."
sudo pacman -S --noconfirm --needed git curl flatpak base-devel openssl

log "Adicionando repositório Flathub..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

log "Instalando Node.js e npm..."
sudo pacman -S --noconfirm --needed nodejs npm

log "Instalando OpenJDK 17..."
sudo pacman -S --noconfirm --needed jdk17-openjdk

log "Instalando aplicações de usuário via Flatpak (Isso vai demorar)..."

APPS=(
    "com.spotify.Client"
    "com.discordapp.Discord"
    "com.getpostman.Postman"
    "com.jetbrains.IntelliJ-IDEA-Ultimate"
    "com.jetbrains.DataGrip"
    "io.dbeaver.DBeaverCommunity"
    "com.visualstudio.code"
)

for app in "${APPS[@]}"; do
    log "Instalando $app..."
    sudo flatpak install flathub "$app" -y
done

log "Realizando limpeza de pacotes desnecessários..."
orphans=$(pacman -Qtdq 2>/dev/null)
if [ -n "$orphans" ]; then
    sudo pacman -Rns --noconfirm $orphans
fi
sudo pacman -Sc --noconfirm

log "Setup concluído com sucesso."
warn "Recomendado reiniciar a sessão para que as variáveis de ambiente sejam carregadas corretamente."