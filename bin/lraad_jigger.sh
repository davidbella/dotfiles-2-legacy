netctl stop lraad

sleep 2
netctl start lraad

sleep 10
systemctl restart mullvad-daemon
