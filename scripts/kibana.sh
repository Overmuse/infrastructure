KIBANA_POD=$(kubectl get pods -l k8s-app=kibana-logging -n kube-system -o jsonpath='{.items[0].metadata.name}')
kubectl port-forward $KIBANA_POD -n kube-system 5601:5601
