#!/bin/bash
echo "開始下載docker影像"
sudo docker pull hwdsl2/ipsec-vpn-server
echo "結束下載docker影像"

echo "開始啟動 ipsec-vpn"
sudo docker run \
    --name ipsec-vpn-server \
    --env-file ./vpn.env \
    -v ikev2-vpn-data:/etc/ipsec.d \
    -v /lib/modules:/lib/modules:ro \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -d --rm --privileged \
    hwdsl2/ipsec-vpn-server
echo "結束啟動 ipsec-vpn"