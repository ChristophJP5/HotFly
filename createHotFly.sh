#!bin/bash
PASS=$1
ADDRESS=$2
if [ ${#ADDRESS} -lt 1 ]
then
    ADDRESS=00:1e:ad:74:ee:7f
fi
echo $PASS | sudo -S whoami 1>/dev/null
sudo ifconfig wlan0 down
sudo iwconfig wlan0 mode monitor
sudo ifconfig wlan0 up
#sudo wireshark -i wlan0 -f "wlan.fc.type_subtype==0x04 and wlan.addr==$ADDRESS" -c100 -k
sudo ifconfig wlan0 down
sudo iwconfig wlan0 mode managed
sudo ifconfig wlan0 up

