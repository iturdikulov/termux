#!/bin/sh

echo "Welcome to Termux automatic installer"

# Update & upgrade existing packages
pkg update
pkg upgrade -y

# Configure storage
termux-setup-storage

# Install packages
for each_pac in "wget" "net-tools" "mlocate"\
                "python3" "clang" "zip" \
                "unzip" "tree" "git" \
                "cmatrix" "htop" "neovim" \
                "golang" "nodejs" "python" \
                "npm" "ruby" \
                "ruby" "curl"; do
    pkg install $each_pac -y
done

# Install Python packages
for i in "ipython"; do
    pip3 install $i
done

# Instal npm packages
for i in "typescript" "ts-node"; do
    npm install $i
done

# Install Go packages
go install github.com/x-motemen/gore/cmd/gore@latest

# Install Rust toolchain with packages
pkg install tur-repo -y
pkg update
pkg install rustc-nightly
for i in "evcxr_repl"; do
   cargo install $i
done
