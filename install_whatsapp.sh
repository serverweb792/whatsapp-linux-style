#!/bin/bash

# WhatsApp Linux Installer (Windows-style)
# Creates a standalone Electron app with tray support and auto-start

APP_NAME="WhatsApp"
INSTALL_DIR="$HOME/Applications/WhatsApp-linux"
ICON_URL="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/1024px-WhatsApp.svg.png"
ICON_PATH="$INSTALL_DIR/whatsapp_icon.png"
CSS_FILE="$(pwd)/whatsapp-style.css"

echo "--- Iniciando instalação do WhatsApp (estilo Windows) ---"

# 1. Check dependencies
if ! command -v node &> /dev/null; then
    echo "Erro: Node.js não encontrado. Por favor, instale o Node.js."
    exit 1
fi

if ! command -v nativefier &> /dev/null; then
    echo "Instalando Nativefier globalmente..."
    sudo npm install -g nativefier
fi

# 2. Create Build Directory
mkdir -p "$INSTALL_DIR"

# 3. Download Icon
echo "Baixando ícone do WhatsApp..."
curl -sL "$ICON_URL" -o "$ICON_PATH"

# 4. Build Application
echo "Criando aplicativo Electron (isso pode demorar um pouco)..."
nativefier "https://web.whatsapp.com/" \
    --name "$APP_NAME" \
    --icon "$ICON_PATH" \
    --inject "$CSS_FILE" \
    --tray \
    --single-instance \
    --internal-urls ".*" \
    "$INSTALL_DIR"

# Find the executable (Nativefier creates a folder with the os/arch name)
EXE_PATH=$(find "$INSTALL_DIR" -name "WhatsApp" -type f -executable | head -n 1)

if [ -z "$EXE_PATH" ]; then
    echo "Erro ao localizar o executável do WhatsApp criado."
    exit 1
fi

# 5. Create .desktop file for menu integration
echo "Criando entrada no menu de aplicativos..."
mkdir -p "$HOME/.local/share/applications"
cat > "$HOME/.local/share/applications/whatsapp-native.desktop" <<EOF
[Desktop Entry]
Name=WhatsApp
Exec="$EXE_PATH" --no-sandbox --disable-gpu
Terminal=false
Type=Application
Icon=$ICON_PATH
StartupWMClass=whatsapp-nativefier-d40211
Categories=Network;InstantMessaging;
Comment=WhatsApp Desktop Client
EOF

# 6. Setup Auto-start
echo "Configurando inicialização automática..."
mkdir -p "$HOME/.config/autostart"
cp "$HOME/.local/share/applications/whatsapp-native.desktop" "$HOME/.config/autostart/"

echo "--- Instalação Concluída! ---"
echo "Você pode encontrar o WhatsApp no seu menu de aplicativos."
echo "Executável localizado em: $EXE_PATH"
