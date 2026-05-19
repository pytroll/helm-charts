# 📘 segment-gatherer
The segment-gatherer chart deploys the Pytroll Segment Gatherer service, which:

- Watches incoming satellite data files
- Groups them based on configurable filename patterns
- Applies timeliness rules
- Publishes completed segments via Posttroll

# Deployment

1. Clone the repository
```bash
git clone https://github.com/pytroll/helm-charts.git
```

2. Move to the helm-charts folder
```bash
cd helm-charts
```

3. Deploy segment-gatherer with specific configuration
```bash
helm --kubeconfig  <PATH-TO-KUBECONFIG> install <PREFIX-NAME> \
  ./charts/segment-gatherer/ \
  --namespace <NAMESPACE> \
  --set-file configMap.data.sg=<PATH-TO-SEGMENT-GATHERER-CONFIG>
```

# Examples

## FCI European Area with limited segments

### create
```bash
helm --kubeconfig  ~/.kube/kkp-ope-testdns-francesco-murdaca.kubeconfig install fci-eu \
  ./charts/segment-gatherer/ \
  --namespace pytrollweek \
  --set-file configMap.data.sg=./charts/segment-gatherer/examples/fci-european-area-limited-segment.yaml
```
### update
```bash
helm --kubeconfig  ~/.kube/kkp-ope-testdns-francesco-murdaca.kubeconfig upgrade fci-eu \
  ./charts/segment-gatherer/ \
  --namespace pytrollweek \
  --set-file configMap.data.sg=./charts/segment-gatherer/examples/fci-european-area-limited-segment.yaml
```

### delete
```bash
helm --kubeconfig  ~/.kube/kkp-ope-testdns-francesco-murdaca.kubeconfig delete fci-eu \
  --namespace pytrollweek
```

##

Other examples are available under `examples/` folder.

# Development

## Check if templates are well formed (dry run)
```bash
helm template ./segment-gatherer/ --debug --set-file configMap.data.sg=./segment-gatherer/examples/fci-config.yaml
```

# Release

TBD