# JD Stone's Helm Charts Repo

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/jdstone)](https://artifacthub.io/packages/search?repo=jdstone)
[![Lint and Test Charts](https://github.com/jdstone/helm-charts/actions/workflows/lint-test.yaml/badge.svg)](https://github.com/jdstone/helm-charts/actions/workflows/lint-test.yaml)

## How to Use My Charts

* Add this repository to your Helm:
```helm repo add jdstone https://charts.jdstone.dev```
* Install the chart with the values of your choice using the values.yaml file:
```helm install -f values.yaml sql-exporter```

## Actions Used

* [@helm/kind-action](https://github.com/helm/kind-action)
* [@helm/chart-testing-action](https://github.com/helm/chart-testing-action)
* [@helm/chart-releaser-action](https://github.com/helm/chart-releaser-action)

### Workflow

* The [Lint and Test Charts](/.github/workflows/lint-test.yaml) workflow uses [@helm/kind-action](https://www.github.com/helm/kind-action) GitHub Action to spin up a [kind](https://kind.sigs.k8s.io/) Kubernetes cluster, and [@helm/chart-testing-action](https://www.github.com/helm/chart-testing-action) to lint and test your charts on every Pull Request and push
* The [Release Charts](/.github/workflows/release.yaml) workflow uses [@helm/chart-releaser-action](https://www.github.com/helm/chart-releaser-action) to turn your GitHub project into a self-hosted Helm chart repo. It does this – during every push to `main` – by checking each chart in your project, and whenever there's a new chart version, creates a corresponding [GitHub release](https://help.github.com/en/github/administering-a-repository/about-releases) named for the chart version, adds Helm chart artifacts to the release, and creates or updates an `index.yaml` file with metadata about those releases, which is then hosted on GitHub Pages.

## Report issues

Please report any issues using the [Issues](https://github.com/jdstone/helm-charts/issues) section in this GitHub repository. Thank you!
