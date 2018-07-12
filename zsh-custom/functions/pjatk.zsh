function pjatk-vpn-connect {
/usr/bin/env osascript <<-EOF
tell application "System Events"
        tell current location of network preferences
                set VPN to service "PJATK VPN"
                if exists VPN then connect VPN
        end tell
end tell
EOF
sudo route add -net 10.0.0.0/8 -interface ppp0
sudo route add -net 172.16.0.0/12 -interface ppp0
}

function pjatk-vpn-disconnect {
/usr/bin/env osascript <<-EOF
tell application "System Events"
        tell current location of network preferences
                set VPN to service "PJATK VPN"
                if exists VPN then disconnect VPN
        end tell
end tell
return
EOF
}
