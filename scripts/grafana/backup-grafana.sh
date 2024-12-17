kubectl cp monitoring/$(kubectl get pods -n monitoring | grep grafana | awk '{print $1}'):/var/lib/grafana/grafana.db ./grafana.db
