set -ex

docker network rm vpn_net

docker network create -d macvlan \
  --subnet=192.168.68.0/22 \
  --gateway=192.168.68.1 \
  -o parent=enx00e04c680054 -o macvlan_mode=bridge vpn_net

docker run -it --rm --cap-add=NET_ADMIN --device /dev/net/tun --name vpn \
  --net=vpn_net \
  -v `realpath .`:/cfg \
  dmikhin/openvpn --config /cfg/wallarm-msk.ovpn

#NAT
#iptables -t nat -A POSTROUTING -j MASQUERADE

#AnyIP
#ip -4 route add local 192.168.70.0/23 dev eth0

exit 1

#routing to container
sudo ip link add mac0 link enx00e04c680054 type macvlan mode bridge
#sudo ip addr add 192.168.68.3/32 dev mac0
sudo ip addr add 192.168.68.58/32 dev mac0
sudo ip link set mac0 up
sudo ip route add 192.168.70.0/23 dev mac0
sudo ip route add 192.168.68.2/32 dev mac0