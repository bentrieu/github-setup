# github-setup
<br>
remember to: <br>

sudo apt install git<br>
git clone https://github.com/bentrieu/github-setup<br>
cd ./github-setup<br>
chmod +x ./setup-git.sh<br>
./setup-git.sh<br>

To SSH:<br>
Change network in VMs, port forward host 3022 guess 22<br>
Also port forward 3001 for guest and 3000 for 0.0.0.0 host <br>
Install openssh:<br>
sudo apt install openssh-server<br>
sudo systemctl enable ssh --now<br>
sudo systemctl status ssh<br>

To ssh to VM:<br>
ssh -p 3022 <your-username>@127.0.0.1<br>

Lastly, pray

