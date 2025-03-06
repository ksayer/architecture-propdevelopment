#!/bin/bash
# Создание привязок (ClusterRoleBinding) для назначения ролей пользователям

# Привязка для привилегированных пользователей (alice)
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: privileged-user-binding
subjects:
- kind: User
  name: alice
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: privileged-user
  apiGroup: rbac.authorization.k8s.io
EOF

# Привязка для пользователей с правом только на просмотр (bob)
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: read-only-user-binding
subjects:
- kind: User
  name: bob
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: read-only-user
  apiGroup: rbac.authorization.k8s.io
EOF

# Привязка для пользователей, которые могут настраивать кластер (charlie)
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: cluster-configurator-binding
subjects:
- kind: User
  name: charlie
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: cluster-configurator
  apiGroup: rbac.authorization.k8s.io
EOF

echo "ClusterRoleBinding для пользователей alice, bob и charlie созданы."
