sudo apt-get install libpam-dev libkeyutils-dev glib-networking
sudo apt-get install autoconf intltool libglib2.0-dev libsystemd-journal-dev libjson-glib-dev libpolkit-agent-1-dev libkrb5-dev libssh-dev

wget https://github.com/cockpit-project/cockpit/archive/0.99.zip && unzip 0.99.zip
mkdir build
cd build
../autogen.sh --disable-pcp --disable-doc

make
sudo make install
sudo cp ../src/bridge/cockpit.pam.insecure /etc/pam.d/cockpit
sudo sh -c "cat ../src/bridge/sshd-reauthorize.pam >> /etc/pam.d/sshd"

sudo systemctl start cockpit.socket 
sudo systemctl enable cockpit.socket

echo "Installation de cockpit terminée. Accessible sur http://<adresse du serveur>:9090
sudo reboot
