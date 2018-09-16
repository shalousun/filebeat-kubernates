#!/bin/bash
# this script is used to create filebeat ssl.

cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Secret
metadata:
  name: filebeatssl
  namespace: kube-system
type: Opaque
data:
  cacert: $(cat cacert.crt | base64 | tr -d '\n')
  cert: $(cat client.crt | base64 | tr -d '\n')
  key: $(cat client.key | base64 | tr -d '\n')
EOF