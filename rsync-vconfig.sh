#!/bin/bash

rsync -zrtmP --include="***/" --include="*.ovpn" --exclude="*" root@206.119.82.149:/root/.ovpn/vconfig/ /mnt/d/Program/vpn/vconfig
