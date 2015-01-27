#
# Change MAC address.  Someone needs to implment for other OSen.
#

if [ $VEGGIE_ARCH != osx ]; then
    return
fi

eth_interface=en0

# Ideas came from:
# http://osxdaily.com/2008/01/17/how-to-spoof-your-mac-address-in-mac-os-x/
# http://superuser.com/questions/218340/how-to-generate-a-valid-random-mac-address-with-bash-shell

# set the path to "airport" -- this might vary
airport_cmd=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport


# fun site: http://hwaddress.com/
prefix="D4:BE:D9"
prefix="D4:BE:A9"

suffix=`hexdump -n3 -e'/1 ":%02X"' /dev/random`
new_addr="$prefix$suffix"

echo    Will try to change to this: $new_addr
echo -n Here is your current MAC  :
ifconfig $eth_interface | grep ether

echo -n Your current network is   :
$airport_cmd -I | grep " SSID:"

echo Shutting down wi-fi...
$airport_cmd -z

echo Setting new MAC to $new_addr -- you must type root password
sudo ifconfig $eth_interface ether $new_addr

echo    New MAC set, running a current MAC
echo -n verification check        :
ifconfig $eth_interface | grep ether

echo Done, make sure your new address matches and re-connect to wifi.

# vim: sts=4:ts=4:sw=4:et
