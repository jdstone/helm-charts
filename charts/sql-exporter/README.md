# Prometheus SQL Exporter Chart packaged by J.D. Stone

[Prometheus SQL Exporter](https://github.com/burningalchemist/sql_exporter) by Sergei Zyubin is, as he describes it, a Database agnostic SQL exporter for Prometheus.

## TL;DR

```bash
$ helm repo add jdstone https://charts.jdstone.dev
$ helm install sql-exporter jdstone/sql-exporter
```

## Introduction

This chart bootstraps a SQL Exporter deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes v1.14+
- Helm v3.11.2+

## Installing the Chart

To install the chart with the release name `sql-exporter` and use your values:

```bash
$ helm install -f values.yaml sql-exporter jdstone/sql-exporter
```

The command deploys SQL Exporter on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `sql-exporter` deployment:

```bash
$ helm uninstall sql-exporter
```

> NOTE: If you used `-n namespace` when you installed the chart, be sure to use it again when you uninstall the chart, otherwise the associated dependency Kubernetes resources will not be deleted:

```bash
$ helm uninstall -n namespace sql-exporter
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Questions

Create an [issue](https://github.com/jdstone/helm-charts/issues) and I'll do the best I can to help you out.

## Parameters


### Common parameters

| Name               | Type   | Description                           | Default |
| ------------------ | ------ | ------------------------------------- | ------- |
| `kubeVersion`      | string | Override Kubernetes version           | `""`    |
| `nameOverride`     | string | Partially override names.fullname     | `""`    |
| `fullnameOverride` | string | Fully override names.fullname         | `""`    |
| `commonLabels`     | object | Labels to add to all deployed objects | `{}`    |


### SQL Exporter configuration parameters

| Name                             | Type    | Description                                                                           | Default                                 |
| -------------------------------- | ------- | ------------------------------------------------------------------------------------- | --------------------------------------- |
| `config.createK8sSecretConfig`   | boolean | Create a K8s Secret or ConfigMap for the app config. True = Secret, False = ConfigMap | `true`                                  |
| `config.scrapeTimeout`           | string  | Per-scrape timeout. See values.yaml for more information.                             | `"10s"`                                 |
| `config.scrapeTimeoutOffset`     | string  | Subtracted from scrapeTimeout to give headroom & prevent Prometheus from timing out   | `"500ms"`                               |
| `config.scrapeErrorDropInterval` | string  | Interval between dropping scrape_errors_total metric.                                 | `"0s"`                                  |
| `config.minInterval`             | string  | Minimum interval between collector runs                                               | `"0s"`                                  |
| `config.maxConnections`          | int     | Maximum number of open connections to any one target                                  | `3`                                     |
| `config.maxIdleConnections`      | int     | Maximum number of idle connections to any one target                                  | `3`                                     |
| `config.maxConnectionLifetime`   | string  | Maximum amount of time a connection may be reused to any one target. See values.yaml. | `infinite`                              |
| `config.dataSourceName`          | string  | Database Source Name (DSN). See values.yaml for more information.                     | `"sqlserver://user:pass@dbserver:1433"` |
| `config.awsSecretName`           | string  | Allows the ability to store the DSN in AWS Secrets Manager                            | `""`                                    |
| `config.collectorNames`          | list    | Collectors (referenced by name) to execute on the target                              | `["pricing_data_freshness"]`            |
| `config.collectorFiles`          | list    | Collector Files are filenames that sql-exporter will look for and load                | `["*.collector.yml"]`                   |
| `config.annotations`             | object  | Annotations to add to the Secret or ConfigMap                                         | `{}`                                    |
| `config.labels`                  | object  | Labels to add to the Secret or ConfigMap                                              | `{}`                                    |
| `collectorDefs`                  | string  | Collector definitions. See values.yaml for more info.                                 | `"pricing_data_freshness"`              |
| `collectorDefFiles`              | list    | Collector definitions, contained in individual files.                                 | `[]`                                    |


### Deployment parameters

| Name                                 | Type    | Description                                            | Default                              |
| ------------------------------------ | ------- | ------------------------------------------------------ | ------------------------------------ |
| `image.repository`                   | string  | Image repository                                       | `"burningalchemist/sql_exporter"`    |
| `image.tag`                          | string  | Image tag                                              | `appVersion` value from `Chart.yaml` |
| `image.pullPolicy`                   | string  | Image pull policy                                      | `"IfNotPresent"`                     |
| `image.pullSecrets`                  | list    | Image pull secrets                                     | `[]`                                 |
| `replicaCount`                       | int     | Number of SQL Exporter replicas to deploy              | `1`                                  |
| `strategy.type`                      | string  | Deployment strategy type                               | `"RollingUpdate"`                    |
| `strategy.rollingUpdate`             | object  | Strategy "RollingUpdate" parameters                    | `{}`                                 |
| `resources.requests`                 | object  | CPU/memory resource requests                           | `{}`                                 |
| `resources.limits`                   | object  | CPU/memory resource limits                             | `{}`                                 |
| `livenessProbe.enabled`              | boolean | Enable/Disable the default http livenessProbe          | `true`                               |
| `livenessProbe.port`                 | int     | Default livenessProbe http port                        | `nil`                                |
| `livenessProbe.initialDelaySeconds`  | int     | Initial delay seconds for livenessProbe                | `30`                                 |
| `livenessProbe.periodSeconds`        | int     | Period seconds for livenessProbe                       | `nil`                                |
| `livenessProbe.timeoutSeconds`       | int     | Timeout seconds for livenessProbe                      | `nil`                                |
| `livenessProbe.successThreshold`     | int     | Success threshold for livenessProbe                    | `nil`                                |
| `livenessProbe.failureThreshold`     | int     | Failure threshold for livenessProbe                    | `nil`                                |
| `readinessProbe.enabled`             | boolean | Enable/Disable the default http readinessProbe         | `true`                               |
| `readinessProbe.port`                | int     | Default readinessProbe http port                       | `nil`                                |
| `readinessProbe.initialDelaySeconds` | int     | Initial delay seconds for readinessProbe               | `30`                                 |
| `readinessProbe.periodSeconds`       | int     | Period seconds for readinessProbe                      | `nil`                                |
| `readinessProbe.timeoutSeconds`      | int     | Timeout seconds for readinessProbe                     | `nil`                                |
| `readinessProbe.successThreshold`    | int     | Success threshold for readinessProbe                   | `nil`                                |
| `readinessProbe.failureThreshold`    | int     | Failure threshold for readinessProbe                   | `nil`                                |
| `customLivenessProbe`                | object  | Custom livenessProbe that overrides the default probe  | `{}`                                 |
| `customReadinessProbe`               | object  | Custom readinessProbe that overrides the default probe | `{}`                                 |
| `extraEnv`                           | list    | Container environment variables                        | `[]`                                 |
| `extraVolumeMounts`                  | list    | Container volume mounts                                | `[]`                                 |
| `extraVolumes`                       | list    | Container volumes                                      | `[]`                                 |
| `annotations`                        | object  | Annotations to add to the Deployment                   | `{}`                                 |
| `labels`                             | object  | Labels to add to the Deployment                        | `{}`                                 |


### Service parameters

| Name                  | Type   | Description                       | Default       |
| ----------------------| ------ | --------------------------------- | ------------- |
| `service.targetPort`  | int    | SQL Exporter Service target port  | `nil`         |
| `service.type`        | string | SQL Exporter Service Type         | `"ClusterIP"` |
| `service.nodePort`    | int    | SQL Exporter Service node port    | `nil`         |
| `service.annotations` | object | Annotations to add to the Service | `{}`          |
| `service.labels`      | object | Labels to add to the Service      | `{}`          |
