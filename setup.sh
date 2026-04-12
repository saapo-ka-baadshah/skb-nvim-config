#!/usr/bin/env bash
NVIM_CONFIG_DIR="$HOME/.config/nvim"

echo "--------------------------------------------------"
echo "Base (AVIM) Installation"
echo "--------------------------------------------------"

######################################### Base setup
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

echo "--------------------------------------------------"
echo "AI Installation"
echo "--------------------------------------------------"

######################################### AI Usage
#--------------------- 
#	Description:
#		We use SST's OpenCode as the main agent within the AVIM config.
#-------------------- 
# Function for installation of AI Client
InstallAIClient(){
	# ==================== Early check if already installed ====================
	if command -v opencode &> /dev/null; then
		echo "✅ OpenCode is already installed!"
		opencode --version
		return 0
	fi

	echo "🔍 Detecting operating system..."

	if [[ "$OSTYPE" == "darwin"* ]]; then
		# ==================== macOS ====================
		echo "🍎 Detected macOS"

		if ! command -v brew &> /dev/null; then
			echo "❌ Homebrew is not installed. Please install it first:"
			echo "   /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
			return 1
		fi

		echo "📦 Installing opencode via Homebrew..."
		brew install sst/opencode/opencode

	elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
		# ==================== Linux ====================
		echo "🐧 Detected Linux"

		if command -v apt-get &> /dev/null; then
			# Debian/Ubuntu-based
			echo "📦 Installing opencode with standard online installer provided by SST..."
			curl -fsSL https://opencode.ai/install | bash
		else
			# Fallback: use Cargo (works on any Linux with Rust)
			echo "📦 apt not found. Falling back to Cargo install..."
			if ! command -v cargo &> /dev/null; then
			    echo "❌ Rust/Cargo is not installed. Please install Rust first:"
			    echo "   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
			    return 1
			fi
			echo "Installing opencode via Cargo..."
			cargo install opencode
		fi

	else
		echo "❌ Unsupported OS: $OSTYPE"
		echo "   Supported: macOS (darwin) and Linux (linux-gnu)"
		return 1
	fi

	# Final verification
	if command -v opencode &> /dev/null; then
		echo "✅ Success! OpenCode installed:"
		opencode --version
	else
		echo "⚠️  Installation completed, but 'opencode' command not found in PATH."
		echo "		Try restarting your terminal or running: source ~/.bashrc (or ~/.zshrc)"
		echo "		If you want to stay in the same instance, then run: 'exec \$SHELL'"
		return 1
	fi
}

echo "Installing the AI Client (OpenCode)..."
echo "OpenCode is a fast, open-source AI coding agent that runs locally in your terminal and works seamlessly inside NeoVim."
read -p "Continue? [Y]es / [N]o : " choice

# Handle the input (case-insensitive)
case "$choice" in 
  [yY][eE][sS]|[yY])
    InstallAIClient
    ;;
  [nN][oO]|[nN])
    NoConfirm
    ;;
  *)
    echo "Invalid input. Please enter Y or N."
    exit 1
    ;;
esac

