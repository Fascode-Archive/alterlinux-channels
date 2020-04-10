## Alter Linux Unofficial channels
ハヤオがカスタマイズした非公式のAlterLinuxチャンネルです。  
AlterLinuxの`channels`にこのリポジトリをクローンすると非公式のチャンネルを使用可能になります。  

## 使い方

```bash
git clone https://github.com/FascodeNet/alterlinux.git ./alterlinux/
git clone https://github.com/Hayao0819/alterlinux-channels.git ./alterlinux/channels/unofficial
mv ./alterlinux/channels/unofficial/*.add ./alterlinux/channels/
rm -r ./alterlinux/channels/unofficial
sudo ./alterlinux/build.sh -b <channel name>
```