# 📘 trollflow2
The trollflow2 chart deploys the Pytroll Trollflow2 processing service, which orchestrates end‑to‑end satellite data processing chains. It is designed to run configurable workflows that transform incoming satellite data into higher‑level products.

The service:

- Listens for incoming Posttroll messages announcing new satellite data
- Triggers processing workflows based on flexible, rule‑driven configuration
- Runs Satpy‑based product generation pipelines (composites, resampling, enhancements, etc.)
- Publishes output products via Posttroll or writes them to storage
- Coordinates multiple processing steps using a lightweight, event‑driven engine

This chart enables deploying Trollflow2 as a scalable, cloud‑native component that integrates with other Pytroll services deployed in similar way in the same namespace.

# Deployment

1. Clone the repository
```bash
git clone https://github.com/pytroll/helm-charts.git
```

2. Move to the helm-charts folder
```bash
cd helm-charts
```

3. Deploy trollflow2 with specific configuration
```bash
helm --kubeconfig  <PATH-TO-KUBECONFIG> install <PREFIX-NAME> \
  ./charts/trollflow2/ \
  --namespace <NAMESPACE> \
  --set-file configMap.data.tf2=<PATH-TO-SEGMENT-GATHERER-CONFIG>
```

# Examples

## FCI European Area with limited segments

### create
```bash
helm --kubeconfig  ~/.kube/kkp-ope-testdns-francesco-murdaca.kubeconfig install fci \
  ./charts/trollflow2/ \
  --namespace pytrollweek \
  --set-file configMap.data.tf2=./charts/trollflow2/examples/fci.yaml
```
### update
```bash
helm --kubeconfig  ~/.kube/kkp-ope-testdns-francesco-murdaca.kubeconfig upgrade fci \
  ./charts/trollflow2/ \
  --namespace pytrollweek \
  --set-file configMap.data.tf2=./charts/trollflow2/examples/fci.yaml
```

### delete
```bash
helm --kubeconfig  ~/.kube/kkp-ope-testdns-francesco-murdaca.kubeconfig delete fci \
  --namespace pytrollweek
```

## More configuration examples

Other examples are available under `examples/` folder.

# Development

## Check if templates are well formed (dry run)
```bash
helm template ./trollflow2/ --debug --set-file configMap.data.tf2=./trollflow2/examples/fci-config.yaml
```

# Release

See main README of the repository.
