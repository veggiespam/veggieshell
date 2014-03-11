#
# Change MAC address.  Someone needs to implment for other OSen.
#

if [ $VEGGIE_ARCH != osx ]; then
    return
fi

# http://osxdaily.com/2008/01/17/how-to-spoof-your-mac-address-in-mac-os-x/
# http://superuser.com/questions/218340/how-to-generate-a-valid-random-mac-address-with-bash-shell

# set the path to "airport" -- this might vary
airport_cmd=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport


# fun site: http://hwaddress.com/
prefix="D4:BE:D9"
prefix="D4:BE:A9"

suffix=`hexdump -n3 -e'/1 ":%02X"' /dev/random`
new_addr="$prefix$suffix"

echo Will try to change to this: $new_addr
echo Old Address:
ifconfig en1 | grep ether

echo Your current network is:
$airport_cmd -I | grep " SSID:"

echo Shutting down wi-fi:
$airport_cmd -z

echo Setting new MAC to $new_addr -- you must type root password
sudo ifconfig en1 ether $new_addr

echo Done setting, running a verification check:
ifconfig en1 | grep ether

echo Done, now try associating to your new network.

# vim: sts=4:ts=4:sw=4:et
