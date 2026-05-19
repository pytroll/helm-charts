
# Deployment

# FCI example
```
helm --kubeconfig  ~/.kube/kkp-ope-testdns-francesco-murdaca.kubeconfig upgrade fci \
  ./segment-gatherer/ \
  --namespace pytrollweek \
  --set-file configMap.data.sg=./segment-gatherer/examples/fci-config.yaml
```

# Development

## Check if templates are well formed (dry run)
```
helm template ./segment-gatherer/ --debug --set-file configMap.data.sg=./segment-gatherer/examples/fci-config.yaml
```