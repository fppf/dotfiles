#!/bin/bash

USERNAME=""
PASSWORD=""

nmcli connection delete eduroam
nmcli connection add type wifi con-name eduroam \
  connection.permissions "${USER}" \
  802-11-wireless.ssid eduroam \
  802-11-wireless-security.key-mgmt wpa-eap \
  802-11-wireless-security.group ccmp,tkip \
  802-11-wireless-security.pairwise ccmp \
  802-11-wireless-security.proto rsn \
  802-1x.altsubject-matches DNS:wireless.northeastern.edu \
  802-1x.anonymous-identity anonymous@northeastern.edu \
  802-1x.eap peap \
  802-1x.identity "${USERNAME}" \
  802-1x.password "${PASSWORD}" \
  802-1x.phase2-auth mschapv2 \
  ipv4.method auto \
  ipv6.addr-gen-mode eui64 \
  ipv6.method auto
