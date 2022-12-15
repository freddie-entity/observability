helm repo add grafana https://grafana.github.io/helm-charts
helm install loki grafana/loki-stack --create-namespace=true -n logging --set fluent-bit.enabled=true,promtail.enabled=false
helm upgrade --values values.yaml loki grafana/loki
helm install grafana grafana/grafana -n logging
k get secret --namespace logging grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
k port-forward svc/grafana -n logging 3000:80