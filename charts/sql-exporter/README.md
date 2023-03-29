# Prometheus SQL Exporter Chart packaged by J.D. Stone

[Prometheus SQL Exporter](https://github.com/burningalchemist/sql_exporter) by Sergei Zyubin is, as he describes it, a Database agnostic SQL exporter for Prometheus.

## TL;DR

```bash
$ helm repo add jdstone https://charts.jdstone.dev
$ helm install my-release jdstone/sql-exporter
```

## Introduction

This chart bootstraps a SQL Exporter deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.14+
- Helm 3.11.2+

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install my-release jdstone/sql-exporter
```

The command deploys SQL Exporter on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm uninstall my-release
```

> NOTE: If you used `-n namespace` when you installed the chart, be sure to use it again when you uninstall the chart, otherwise the associated dependency Kubernetes resources will not be deleted:

```bash
$ helm uninstall -n namespace my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters


### Common parameters

| Name               | Type   | Description                           | Default |
| ------------------ | ------ | ------------------------------------- | ------- |
| `kubeVersion`      | string | Override Kubernetes version           | `nil`   |
| `nameOverride`     | string | Partially override names.fullname     | `nil`   |
| `fullnameOverride` | string | Fully override names.fullname         | `nil`   |
| `commonLabels`     | object | Labels to add to all deployed objects | `{}`    |


### SQL Exporter configuration parameters

| Name                           | Type   | Description                                                                           | Default                      |
| ------------------------------ | ------ | ------------------------------------------------------------------------------------- | ---------------------------- |
| `config.scrapeTimeout`         | string | Per-scrape timeout. See values.yaml for more information.                             | `"10s"`                      |
| `config.scrapeTimeoutOffset`   | string | Subtracted from scrapeTimeout to give headroom & prevent Prometheus from timing out   | `"500ms"`                    |
| `config.minInterval`           | string | Minimum interval between collector runs                                               | `"0s"`                       |
| `config.maxConnections`        | int    | Maximum number of open connections to any one target                                  | `3`                          |
| `config.maxIdleConnections`    | int    | Maximum number of idle connections to any one target                                  | `3`                          |
| `config.maxConnectionLifetime` | string | Maximum amount of time a connection may be reused to any one target. See values.yaml. | `infinite`                   |
| `config.dataSourceName`        | string | Database connection source. See values.yaml for more information.                     | `nil`                        |
| `config.collectorNames`        | list   | Collectors (referenced by name) to execute on the target                              | `["pricing_data_freshness"]` |
| `config.annotations`           | object | Annotations to add to the ConfigMap                                                   | `{}`                         |
| `config.labels`                | object | Labels to add to the ConfigMap                                                        | `{}`                         |
| `collectorDefs`                | string | Collector definitions. See values.yaml for more info.                                 | `"pricing_data_freshness"`   |


### Deployment parameters

| Name                                | Type    | Description                                         | Default                           |
| ----------------------------------- | ------- | --------------------------------------------------- | --------------------------------- |
| `image.registry`                    | string  | The Docker image registry                           | `"docker.io"`                     |
| `image.repository`                  | string  | The Docker image repository                         | `"burningalchemist/sql_exporter"` |
| `image.tag`                         | string  | The Docker image tag                                | `'latest'`                        |
| `image.pullPolicy`                  | string  | The Docker image pull policy                        | `"IfNotPresent"`                  |
| `replicaCount`                      | int     | Number of SQL Exporter replicas to deploy           | `1`                               |
| `strategy.type`                     | string  | Deployment strategy type                            | `"RollingUpdate"`                 |
| `strategy.rollingUpdate`            | object  | Strategy "RollingUpdate" parameters                 | `{}`                              |
| `resources.requests`                | object  | CPU/memory resource requests                        | `{}`                              |
| `resources.limits`                  | object  | CPU/memory resource limits                          | `{}`                              |
| `livenessProbe.enabled`             | boolean | Enable/Disable the default tcpSocket livenessProbe  | `true`                            |
| `livenessProbe.port`                | int     | Default livenessProbe tcpSocket port                | `nil`                             |
| `livenessProbe.initialDelaySeconds` | int     | Initial delay seconds for livenessProbe             | `30`                              |
| `livenessProbe.periodSeconds`       | int     | Period seconds for livenessProbe                    | `nil`                             |
| `livenessProbe.timeoutSeconds`      | int     | Timeout seconds for livenessProbe                   | `nil`                             |
| `livenessProbe.successThreshold`    | int     | Success threshold for livenessProbe                 | `nil`                             |
| `livenessProbe.failureThreshold`    | int     | Failure threshold for livenessProbe                 | `nil`                             |
| `customLivenessProbe`               | object  | Custom livenessProbe that overrides the default one | `{}`                              |
| `readinessProbeEnabled`             | boolean | Enable the custom readinessProbe                    | `false`                           |
| `readinessProbe`                    | object  | Container readiness probe                           | `{}`                              |
| `extraEnv`                          | list    | Container environment variables                     | `{}`                              |
| `extraVolumeMounts`                 | list    | Container volume mounts                             | `{}`                              |
| `extraVolumes`                      | list    | Container volumes                                   | `{}`                              |
| `annotations`                       | object  | Annotations to add to the Deployment                | `{}`                              |
| `labels`                            | object  | Labels to add to the Deployment                     | `{}`                              |


### Service parameters

| Name                  | Type   | Description                       | Default       |
| ----------------------| ------ | --------------------------------- | ------------- |
| `service.targetPort`  | int    | SQL Exporter Service target port  | `nil`         |
| `service.type`        | string | SQL Exporter Service Type         | `"ClusterIP"` |
| `service.nodePort`    | int    | SQL Exporter Service node port    | `nil`         |
| `service.annotations` | object | Annotations to add to the Service | `{}`          |
| `service.labels`      | object | Labels to add to the Service      | `{}`          |
