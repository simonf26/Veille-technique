# Grafana

Grafana is an open-source platform for monitoring and visualizing time-series
data. It allows you to create, explore, and share dashboards that display
data in various formats, such as graphs, tables, and heatmaps. These dashboards
can be used to track performance metrics, system health, and other important
data points in real-time.

One of the key features of Grafana is its flexibility. It supports a wide range
of data sources, including but not limited to Prometheus, Elasticsearch, InfluxDB,
and Graphite. This means you can pull data from various sources and visualize
it all in one place.

Grafana is often used in DevOps and IT operations to monitor infrastructure
and application performance, but it can be used in any context where you need
to visualize time-series data. It's highly customizable, allowing you to tailor
your dashboards to your specific needs.

[Grafana](https://grafana.com/)

## Tools

- [Alloy](https://github.com/grafana/alloy) : open source OpenTelemetry Collector
distribution with built-in Prometheus pipelines and support for metrics, logs,
traces, and profiles.
  - Programmable pipelines: Use a rich expression-based syntax for configuring
  powerful observability pipelines.
  - OpenTelemetry Collector Distribution: Alloy is a distribution of OpenTelemetry
  Collector and supports dozens of its components, alongside new components
  that make use of Alloy's programmable pipelines.
  - Big tent: Alloy embraces Grafana's "big tent" philosophy, where Alloy
  can be used with other vendors or open source databases. It has components
  to perfectly integrate with multiple telemetry ecosystems:
        OpenTelemetry Collector
        Prometheus
        Grafana Loki
        Grafana Pyroscope
  - Kubernetes-native: Use components to interact with native and custom Kubernetes
  resources; no need to learn how to use a separate Kubernetes operator.
  - Shareable pipelines: Use modules to share your pipelines with the world.
  - Automatic workload distribution: Configure Alloy instances to form a cluster
  for automatic workload distribution.
  - Centralized configuration support: Alloy supports retrieving its configuration
  from a server for centralized configuration management.
  - Debugging utilities: Use the built-in UI for visualizing and debugging
  pipelines.
