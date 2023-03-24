#!/bin/bash

createClient() {
        USERNAME="vconfig-$1"
        echo "${USERNAME}"
        #bash -c 'docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it registry.gitlab.com/ix.ai/openvpn easyrsa build-client-full ${USERNAME} nopass'

        OVPN_DATA="ovpn-data-beta1"

        set timeout 10
        expect_sh=$(expect -c "
        spawn bash /root/.ovpn/openvpn-install.sh
        expect \"Option:\"
        send \"1\r\"
        expect \"Name:\"
        send \"${USERNAME}\r\"
        expect \"*Configuration available in:*\"
        send \"exit \r\"
        ")<b

        echo "$expect_sh"

        echo "Generated success! | ${USERNAME}"

}


for var in "$@"
do
    createClient ${var}
        sleep 1
done