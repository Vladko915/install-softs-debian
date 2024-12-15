//pre-install

nano /etc/apt/sources.list
apt-get update && apt-get upgrade  


//else
sudo powertop --auto-tune
sudo powertop

//remove ibus and reboot
sudo apt remove --purge ibus
sudo apt autoremove
sudo apt autoclean
sudo reboot
