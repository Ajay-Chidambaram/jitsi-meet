#!/bin/sh

apt -y install binutils
ar x jitsi-meet-web_1.0.1-1_all.deb
unzstd control.tar.zst
unzstd data.tar.zst
xz control.tar
xz data.tar
rm jitsi-meet-web_1.0.1-1_all.deb
ar cr jitsi-meet-web_1.0.1-1_all.deb debian-binary control.tar.xz data.tar.xz
printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d