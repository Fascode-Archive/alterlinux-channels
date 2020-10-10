## Alter Linux Unofficial channels
ハヤオがカスタマイズした非公式のAlterLinuxチャンネルです。  
AlterLinuxの`channels`にこのリポジトリをクローンすると非公式のチャンネルを使用可能になります。  

## 使い方

```bash
mkdir alterlinux-channels
git clone https://github.com/Hayao0819/alterlinux-channels.git  ./alterlinux-channels
cd ./alterlinux-channels
sudo ./start-build.sh -o '-b' <channel_name>
```