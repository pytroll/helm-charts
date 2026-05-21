# Pytroll helm-charts

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:
```bash
helm repo add pytroll https://pytroll.github.io/pytroll-charts
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
pytroll` to see the charts.

## 🗂️ Available Charts

| **Chart** | **Description** | **Location** |
| --- | --- | --- |
| **segment-gatherer** | Collects, groups, and publishes satellite data segments using Pytroll’s ``pytroll-collectors`` framework. Supports pattern‑based file grouping, timeliness rules, and Posttroll publishing. | ``charts/segment-gatherer`` |
| **trollflow2** | Orchestrates end‑to‑end satellite data processing workflows using Pytroll’s `trollflow2` engine. Listens for Posttroll messages, triggers Satpy‑based product generation, and publishes processed outputs. | `charts/trollflow2` |


## Release Process

### Trigger workflow for creating the Git tag for the component

This workflow prepares the release by creating a Git tag based on the version defined in the chart’s Chart.yaml of the specific component.

1. Update the chart version in:
`charts/<chart-name>/Chart.yaml`
2. Go to Actions → `Create Chart Release Tag`
3. Click Run workflow
4. Enter the chart folder name (e.g. segment-gatherer)
5. Run the workflow

The workflow will:
- Read the version from Chart.yaml
- Create a tag in the format: <chart-name>-<version> . Example: segment-gatherer-0.3.1
- Push the tag to the repository.


### Trigger workflow for publishing the chart
This workflow publishes the chart of the specific component by manually triggering the second workflow with the specific Git tag required.

1. Go to Actions → Build & Publish Single Helm Chart
2. Click Run workflow
3. Enter the tag. For example: segment-gatherer-0.3.1
4. Run the workflow

This workflow will:
- Package the chart into a .tgz
- Download the existing index.yaml from GitHub Pages
- Merge the new chart version into the repository index
- Regenerate index.yaml
- Generate a landing page from the repository README.md
- Publish everything to GitHub Pages

Now you are ready to announce!
