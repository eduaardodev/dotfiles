# Dotfiles

Configuração automatizada de ambiente de desenvolvimento para sistemas Linux (Debian/Ubuntu, Fedora e Arch-based).

## Descrição

Este projeto fornece um conjunto de scripts para configurar rapidamente um ambiente de desenvolvimento completo em sistemas Debian/Ubuntu, Fedora e distros baseadas em Arch. Ele automatiza a instalação de ferramentas essenciais, configura shells modernos (Zsh ou Fish), instala Docker ou Podman conforme a distribuição, e aplica configurações personalizadas para Git, SSH e ZRAM.

## Recursos

- **Container Runtime**: Instalação automática do Docker ou Podman, conforme a distro
- **Shells Modernos**: 
  - Zsh com Oh My Zsh e Powerlevel10k
  - Fish com Fisher e Tide theme
- **Ferramentas de Desenvolvimento**:
  - Git com configurações pré-definidas
  - Node.js (LTS)
  - Build essentials e bibliotecas SSL
  - Curl e outras ferramentas úteis
- **Gerenciamento de Pacotes**: Flatpak e Flathub
- **Configuração SSH**: Scripts para setup de SSH
- **Fontes Personalizadas**: Instalação automática de fontes TTF
- **ZRAM**: Configuração automática de swap comprimido

## Instalação

### Instalação Rápida

```bash
git clone https://github.com/eduaardodev/dotfiles.git
cd dotfiles
chmod +x setup.sh
./setup.sh
```

### O que acontece durante a instalação?

1. **Detecção de Sistema**: O script detecta automaticamente seu sistema operacional
2. **Instalação por Distro**: Executa o instalador correto para Debian/Ubuntu, Fedora ou Arch
3. **Container Runtime**: Configura Docker ou Podman e adiciona seu usuário ao grupo necessário
4. **Instalação de Dependências**: Instala Git, Node.js, build tools, OpenJDK e outras ferramentas essenciais
5. **Instalação de Aplicativos**: Baixa apps de uso diário via pacote nativo ou Flatpak
6. **Configuração de Fontes**: Instala fontes personalizadas do diretório `assets/fonts/ttf`
7. **Configuração Git**: Define nome de usuário, email e preferências globais
8. **Configuração SSH**: Executa scripts de configuração SSH
9. **Seleção de Shell**: Permite escolher entre Zsh, Fish ou manter o shell atual

### Opções de Shell

Durante a instalação, você poderá escolher um dos seguintes shells:

#### 1. Zsh + Powerlevel10k
- Shell robusto e amplamente usado
- Oh My Zsh para gerenciamento de plugins
- Tema Powerlevel10k para interface visual

#### 2. Fish + Tide
- Shell moderno com autosugestões nativas
- Configuração mais simples
- Sintaxe mais amigável
- Fisher para gerenciamento de plugins
- Tema Tide

#### 3. Nenhum
- Mantém o shell atual
- Nenhuma modificação é feita

## Estrutura do Projeto

```
dotfiles/
├── setup.sh              # Script principal de instalação
├── assets/
│   ├── install.sh        # Instalação de fontes
│   └── fonts/            # Fontes personalizadas (TTF)
├── configs/
│   ├── git.sh           # Configurações do Git
│   ├── ssh.sh           # Configurações do SSH
│   ├── zsh.sh           # Setup do Zsh
│   └── fish.sh          # Setup do Fish
└── installers/
  ├── arch/
  │   ├── base.sh      # Instalação de pacotes base no Arch
  │   └── docker.sh    # Instalação do Docker no Arch
  ├── debian/
  │   ├── base.sh      # Instalação de pacotes base no Debian/Ubuntu
  │   └── docker.sh    # Instalação do Docker no Debian/Ubuntu
  └── fedora/
    ├── base.sh      # Instalação de pacotes base no Fedora
    └── podman.sh    # Instalação do Podman no Fedora
```

##  Uso

### Executar o Setup Completo

```bash
./setup.sh
```

### Executar Scripts Individuais

Se você deseja executar apenas partes específicas da configuração:

```bash
# Instalar apenas o Docker
./installers/debian/docker.sh

# Instalar apenas o Docker no Arch
./installers/arch/docker.sh

# Configurar apenas o Git
./configs/git.sh

# Configurar apenas o Zsh
./configs/zsh.sh

# Configurar apenas o Fish
./configs/fish.sh

# Instalar apenas as fontes
./assets/install.sh
```

## Pós-Instalação

Após a instalação, é **importante** realizar logout e login novamente para que:
- O grupo Docker seja aplicado corretamente ao seu usuário
- O novo shell padrão seja ativado (se você escolheu Zsh ou Fish)

```bash
# Faça logout e login novamente, ou reinicie a sessão
exit
```

## Personalização

### Modificar Configurações do Git

Edite o arquivo `configs/git.sh` para alterar:
- Nome de usuário
- Email
- Editor padrão
- Outras preferências do Git

### Adicionar Suas Próprias Fontes

Coloque arquivos `.ttf` no diretório `assets/fonts/ttf/` antes de executar o script.

### Adicionar Mais Pacotes

Edite o instalador da sua distro em `installers/debian/base.sh`, `installers/fedora/base.sh` ou `installers/arch/base.sh` para incluir pacotes adicionais na instalação.

## Solução de Problemas

### Erro de permissão ao executar Docker

Se você receber erros de permissão ao tentar usar o Docker:
```bash
# Verifique se você está no grupo docker
groups

# Se não estiver, adicione-se manualmente
sudo usermod -aG docker $USER

# Faça logout e login novamente
```

### Shell não mudou após instalação

Certifique-se de ter feito logout e login novamente após a instalação.

### Docker não inicia no Arch

Verifique se o serviço foi habilitado corretamente:
```bash
sudo systemctl enable --now docker
sudo systemctl status docker
```

### Fontes não aparecem

Execute manualmente o cache de fontes:
```bash
fc-cache -fv
```

## Notas

- Este projeto está configurado para o usuário `cassimirodev` por padrão. **Antes de usar, edite `configs/git.sh`** para ajustar seu nome de usuário e email do Git.
- O suporte para Arch Linux agora está implementado com instaladores próprios em `installers/arch/`.
- Alguns pacotes requerem confirmação durante a instalação.

## Licença

This project is licensed under the terms specified in the [LICENSE](LICENSE) file.

## Créditos

- [Oh My Zsh](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [Fish Shell](https://fishshell.com/)
- [Fisher](https://github.com/jorgebucaran/fisher)
- [Tide](https://github.com/IlanCosman/tide)

---

Desenvolvido por [eduaardodev](https://github.com/eduaardodev)
