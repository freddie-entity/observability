helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install prometheus prometheus-community/kube-prometheus-stack --create-namespace=true --namespace monitoring --values values.yaml
kubectl port-forward service/prometheus-operated 9090:9090 --namespace monitoring