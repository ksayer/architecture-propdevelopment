#!/bin/bash
# Создание ролей (ClusterRole) для ролевого доступа в Kubernetes

# Роль для привилегированных пользователей: просмотр секретов
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: privileged-user
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["get", "list", "watch"]
EOF

# Роль для пользователей с правом только на просмотр ресурсов кластера
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: read-only-user
rules:
- apiGroups: [""]
  resources: ["pods", "services", "configmaps", "nodes", "namespaces"]
  verbs: ["get", "list", "watch"]
EOF

# Роль для пользователей, которые могут настраивать кластер (управлять ресурсами)
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: cluster-configurator
rules:
- apiGroups: ["", "apps", "extensions", "batch"]
  resources: ["deployments", "replicasets", "pods", "services", "configmaps"]
  verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
EOF

echo "ClusterRole 'privileged-user', 'read-only-user' и 'cluster-configurator' созданы."