netctl stop wired

sleep 2
netctl start wired

sleep 10
systemctl restart mullvad-daemon
