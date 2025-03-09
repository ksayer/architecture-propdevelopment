#!/bin/bash
# privileged-user
kubectl config set-credentials alice --client-certificate=alice.crt --client-key=alice.key

# read-only-user
kubectl config set-credentials bob --client-certificate=bob.crt --client-key=bob.key

# cluster-configurator
kubectl config set-credentials charlie --client-certificate=charlie.crt --client-key=charlie.key

echo "Пользователи alice, bob и charlie добавлены в kubeconfig."