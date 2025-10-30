# rip terry davis

if [ "$EUID" -ne 0 ]; then
  echo "You must run this script as root."
  exit 1
fi

# var
OS_RELEASE="/etc/os-release"

# main
echo "Welcome to the Luva Experience setup wizard!"
echo "If you run this script by accident, you can press CTRL+C to cancel it. You have 15 seconds."
sleep 15
echo "Configuring etc/os-release..."
sed -i 's|^NAME=.*|NAME="Luva Linux 1.0 based on Experience"|' "$OS_RELEASE"
sed -i 's|^PRETTY_NAME=.*|PRETTY_NAME="Luva"|' "$OS_RELEASE"
echo "Updating/Upgrading APT..."
sudo apt update
sudo apt upgrade
echo "Switching to xfce4 UI..."
sudo apt install xfce4 xfce4-goodies -y
echo "Installation finished. Rebooting your device under 30 seconds."
sudo reboot
