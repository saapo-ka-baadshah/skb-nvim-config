#!/usr/bin/env bash
NVIM_CONFIG_DIR="$HOME/.config/nvim"


# Function for Yes
YesConfirm() {
    echo "Proceeding with NeoVim installation..."

    # Check if the directory already exists
    # 	If Yes, then move the directory to a backup directory
    if [ -d "$NVIM_CONFIG_DIR" ]; then
	    echo "Directory already exists!"
	    echo "Backing up the current configuration..."
	    mv "$NVIM_CONFIG_DIR" "$NVIM_CONFIG_DIR.bak"
	    echo "Back up finished.	($NVIM_CONFIG_DIR.bak)"
    fi

    echo "Creating config directory for NeoVim..."
    mkdir -p $NVIM_CONFIG_DIR
    echo "NeoVim config directory:	$NVIM_CONFIG_DIR"

    echo "Cloning the NeoVim configuration from SKB Repo..."
    git clone https://github.com/saapo-ka-baadshah/skb-nvim-config.git -b main $NVIM_CONFIG_DIR
    echo "Cloning finished!"

    echo "NeoVim configured successfully!"
}

# Function for No
NoConfirm() {
    echo "Installation cancelled by user."
    exit 0
end
}

echo "Installing the NeoVim config for SKB!"
read -p "Continue? [Y]es / [N]o : " choice

# Handle the input (case-insensitive)
case "$choice" in 
  [yY][eE][sS]|[yY])
    YesConfirm
    ;;
  [nN][oO]|[nN])
    NoConfirm
    ;;
  *)
    echo "Invalid input. Please enter Y or N."
    exit 1
    ;;
esac
