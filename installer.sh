#!/bin/sh
# QuranKareem Auto-Updater
# Signature: MNASR

TMP_DIR="/tmp/quran_update"
# Replace these URLs with the direct links to your compiled releases
IPK_URL="https://github.com/YOUR_GITHUB_USER/QuranKareem/releases/download/v1.1.0/enigma2-plugin-extensions-qurankareem_1.1.0_all.ipk"
DEB_URL="https://github.com/YOUR_GITHUB_USER/QuranKareem/releases/download/v1.1.0/enigma2-plugin-extensions-qurankareem_1.1.0_all.deb"

mkdir -p $TMP_DIR
echo "Downloading latest version..."

if command -v opkg > /dev/null; then
    wget -qO $TMP_DIR/update.ipk $IPK_URL
    echo "Installing IPK via opkg..."
    opkg install --force-reinstall $TMP_DIR/update.ipk
elif command -v dpkg > /dev/null; then
    wget -qO $TMP_DIR/update.deb $DEB_URL
    echo "Installing DEB via dpkg..."
    dpkg -i $TMP_DIR/update.deb
    apt-get install -f -y
fi

rm -rf $TMP_DIR
echo "Update complete! Please restart Enigma2."
exit 0
