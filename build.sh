set -ex

docker build --pull --no-cache --tag dmikhin/openvpn .
docker push dmikhin/openvpn