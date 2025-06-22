#!/bin/zsh

# Define paths
GOINFRE_DIR="$HOME/goinfre"
DOTNET_DIR="$GOINFRE_DIR/dotnet"
DOTNET_TOOLS_DIR="$GOINFRE_DIR/dotnet-tools"
SDK_VERSION="8.0.411"
EF_VERSION="8.0.11"
SDK_URL="https://builds.dotnet.microsoft.com/dotnet/Sdk/$SDK_VERSION/dotnet-sdk-$SDK_VERSION-linux-x64.tar.gz"

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to append to .zshrc only if not already present
append_to_zshrc() {
    local line="$1"
    if ! grep -Fx "$line" "$HOME/.zshrc" >/dev/null; then
        echo "$line" >> "$HOME/.zshrc"
    fi
}

# Check if .NET is installed
if command_exists dotnet; then
    echo ".NET SDK is already installed."
else
    echo "Installing .NET SDK $SDK_VERSION to $DOTNET_DIR..."

    # Download and extract SDK
    mkdir -p "$GOINFRE_DIR"
    wget -q "$SDK_URL" -O "$GOINFRE_DIR/dotnet-sdk.tar.gz"
    mkdir -p "$DOTNET_DIR"
    tar -zxf "$GOINFRE_DIR/dotnet-sdk.tar.gz" -C "$DOTNET_DIR"
    rm -f "$GOINFRE_DIR/dotnet-sdk.tar.gz"

    # Set environment variables and alias
    append_to_zshrc "export DOTNET_ROOT=$DOTNET_DIR"
    append_to_zshrc "export PATH=\$DOTNET_ROOT:\$PATH"
    append_to_zshrc "alias dotnet=\"\$DOTNET_ROOT/dotnet\""

    # Apply changes
    source "$HOME/.zshrc"

    if command_exists dotnet; then
        echo ".NET SDK $SDK_VERSION installed successfully."
    else
        echo "Failed to install .NET SDK."
        exit 1
    fi
fi

# Prompt for EF installation
echo -n "Do you want to install Entity Framework Core (dotnet-ef) version $EF_VERSION? (y/n): "
read answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "Installing dotnet-ef $EF_VERSION to $DOTNET_TOOLS_DIR..."

    # Set up dotnet tools directory
    mkdir -p "$DOTNET_TOOLS_DIR"
    append_to_zshrc "export DOTNET_CLI_HOME=$GOINFRE_DIR"
    append_to_zshrc "export DOTNET_TOOLS_PATH=$DOTNET_TOOLS_DIR"
    append_to_zshrc "export PATH=\$DOTNET_TOOLS_PATH:\$PATH"
    append_to_zshrc "alias dotnet-ef=\"\$DOTNET_TOOLS_PATH/dotnet-ef\""

    # Install dotnet-ef
    export DOTNET_CLI_HOME="$GOINFRE_DIR"
    export DOTNET_TOOLS_PATH="$DOTNET_TOOLS_DIR"
    export PATH="$DOTNET_TOOLS_PATH:$PATH"
    dotnet tool install --tool-path "$DOTNET_TOOLS_DIR" dotnet-ef --version "$EF_VERSION"

    # Apply changes
    source "$HOME/.zshrc"

    if command_exists dotnet-ef; then
        echo "Entity Framework Core (dotnet-ef) $EF_VERSION installed successfully."
    else
        echo "Failed to install dotnet-ef."
        exit 1
    fi
else
    echo "Skipping dotnet-ef installation."
fi

echo "Setup complete!"