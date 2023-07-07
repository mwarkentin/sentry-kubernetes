# sentry-kubernetes

Yet another Sentry Kubernetes agent (should it be called "YASKA"?)

## Configuration

- `SENTRY_DSN` - Sentry DSN that will be used by the agent.

- `SENTRY_ENVIRONMENT` - Sentry environment that will be used for reported events.

- `SENTRY_K8S_WATCH_NAMESPACES` - a comma-separated list of namespaces that will be watched. Only the `default` namespace is watched by default.

- `SENTRY_K8S_WATCH_HISTORICAL` - if set to `1`, all existing (old) events will also be reported. Default is `0` (old events will not be reported).

- `SENTRY_K8S_CLUSTER_CONFIG_TYPE` - the type of the cluster initialization method. Allowed options: `auto`, `in-cluster`, `out-cluster`. Default is `auto`.

- `SENTRY_K8S_KUBECONFIG_PATH` - filesystem path to the `kubeconfig` configuration that will be used to connect to the cluster. Not used if `SENTRY_K8S_CLUSTER_CONFIG_TYPE` is set to `in-cluster`.

- `SENTRY_K8S_LOG_LEVEL` - logging level. Can be `trace`, `debug`, `info`, `warn`, `error`, `disabled`. Default is `info`.

### Adding custom tags

To add a custom tag to all events produced by the agent, set an environment variable, whose name is prefixed with `SENTRY_K8S_GLOBAL_TAG_`.

**Example:**

`SENTRY_K8S_GLOBAL_TAG_cluster_name=main-cluster` will add `cluster_name=main_cluster` tag to every outgoing Sentry event.

### Integrations

- `SENTRY_K8S_INTEGRATION_GKE_ENABLED` - if set to `1`, enable the [GKE](https://cloud.google.com/kubernetes-engine/) integration. Default is `0` (disabled).

  The GKE integration will attempt to fetch GKE/GCE metadata from [the GCP metadata server](https://cloud.google.com/compute/docs/metadata/overview), such as project name, cluster name, and cluster location.

### Client-side Filters

If you don't want to report certain kinds of events to Sentry, you can configure client-side filters.

- Event Reason: filtering by `Event.Reason` field.

  `SENTRY_K8S_FILTER_OUT_EVENT_REASONS` is a comma separated set of Reason values. If the event's Reason is in that list, the event will be dropped. By default, the following reasons are filtered out: `DockerStart`, `KubeletStart`, `NodeSysctlChange`, `ContainerdStart`.

- Event Source: filtering by `Event.Source.Component` field.

  `SENTRY_K8S_FILTER_OUT_EVENT_SOURCES` is a comma separated set of Source Component values. If the event's Source Component is in that list, the event will be dropped. By default, no events are filtered out by Source Component.
