## Madeleine OS Channel
AlterLinuxの`channels`にこのリポジトリをクローンすると`madeleine`チャンネルを使用できるようになります。  

## 使い方

```bash
git clone https://github.com/FascodeNet/alterlinux.git alterlinux/
cd alterlinux/channels/
git clone https://github.com/Hayao0819/madeleine.add.git madeleine.add/
cd ../
sudo ./build.sh -b madeleine
```