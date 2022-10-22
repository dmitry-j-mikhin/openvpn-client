set -ex

docker build --tag dmikhin/openvpn .
#docker build --pull --no-cache --tag dmikhin/openvpn .
#docker push dmikhin/openvpn