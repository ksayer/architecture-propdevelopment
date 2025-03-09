kubectl run front-end-app --image=nginx --labels role=front-end --expose --port 80
kubectl run back-end-api-app --image=nginx --labels role=back-end-api --expose --port 80
kubectl run admin-front-end-app --image=nginx --labels role=admin-front-end --expose --port 80
kubectl run admin-back-end-api-app --image=nginx --labels role=admin-back-end-api --expose --port 80

kubectl apply -f non-admin-api-allow.yaml

# check policies
# frontend > backend
kubectl exec -it front-end-app -- sh -c "apt-get update && apt-get install -y curl && curl http://back-end-api-app"

# admin-front > admin-backend
kubectl exec -it admin-front-end-app -- sh -c "apt-get update && apt-get install -y curl && curl http://admin-back-end-api-app"

# frontend > admin-backend
kubectl exec -it front-end-app -- sh -c "apt-get update && apt-get install -y curl && curl --connect-timeout 5 http://admin-back-end-api-app"
