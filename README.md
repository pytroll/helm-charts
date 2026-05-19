# Pytroll helm-charts

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:
```bash
helm repo add pytroll https://pytroll.github.io/helm-charts
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
pytroll` to see the charts.

## 🗂️ Available Charts

| **Chart** | **Description** | **Location** |
| --- | --- | --- |
| **segment-gatherer** | Collects, groups, and publishes satellite data segments using Pytroll’s ``pytroll-collectors`` framework. Supports pattern‑based file grouping, timeliness rules, and Posttroll publishing. | ``charts/segment-gatherer`` |
