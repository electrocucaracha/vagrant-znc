#!/bin/bash

apt-get update -y
apt-get install -y znc
mkdir -p /home/vagrant/.znc/configs/
cat << EOF > /home/vagrant/.znc/configs/znc.conf
Version = 1.2
<Listener l>
        Port = 7000
        IPv4 = true
        IPv6 = false
        SSL = false
</Listener>
LoadModule = partyline
LoadModule = webadmin

<User root>
        Pass       = sha256#58cac1ffb4f9824a0e6a2191da6285b13120a6902a7dc7cf61d9b31635dd134a#uoS9xq(wewq+z7bk02/U#
        Admin      = true
        Nick       = root
        AltNick    = root_
        Ident      = root
        RealName   = Victor Morales
        Buffer     = 50
        AutoClearChanBuffer = true
        ChanModes  = +stn

        LoadModule = chansaver
        LoadModule = controlpanel
        LoadModule = perform
        LoadModule = webadmin
</User>
EOF

chown vagrant:vagrant /home/vagrant/.znc/configs/znc.conf
su vagrant -c "/usr/bin/znc"
