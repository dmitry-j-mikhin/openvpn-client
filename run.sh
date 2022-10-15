set -ex

docker network create -d macvlan \
  --subnet=192.168.68.0/22 \
  --gateway=192.168.68.1 \
  -o parent=enx00e04c680054 vpn_net

docker run -it --cap-add=NET_ADMIN --device /dev/net/tun --name vpn \
  --net=vpn_net \
  -v `realpath .`:/cfg \
  dmikhin/openvpn --config /cfg/wallarm-msk.ovpn
