#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
sed -i 's/#\(ja_JP\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /bin/bash root
cp -aT /etc/skel/ /root/
LC_ALL=C xdg-user-dirs-update
chmod 700 /root
LANG=C xdg-user-dirs-update

<< disabled
groupadd arch
useradd -m -g arch -s /bin/bash arch
groupadd sudo
usermod -G sudo arch
sed -i 's/^#\s*\(%sudo\s\+ALL=(ALL)\s\+ALL\)/\1/' /etc/sudoers
cp -aT /etc/skel/ /home/arch/
disabled

rm /usr/share/backgrounds/xfce/xfce-stripes.png
ln -s /usr/share/backgrounds/archlinux.jpg /usr/share/backgrounds/xfce/xfce-stripes.png
chmod 644 /usr/share/backgrounds/archlinux.jpg
if [[ -d /usr/share/calamares/branding/manjaro ]]; then
    rm -rf /usr/share/calamares/branding/manjaro
fi

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

systemctl enable pacman-init.service choose-mirror.service
systemctl enable NetworkManager
