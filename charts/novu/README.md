# 🚀 Novu Helm Chart

> 📣 A Helm chart to deploy **Novu**, the open-source notification infrastructure, on Kubernetes.

## 🛠️ Prerequisites

- Kubernetes **1.20+**
- Helm **3.7+**

## 📥 Installation

1. **Add the repository** 📚
   ```bash
   helm repo add nova-edge-charts oci://ghcr.io/nova-edge/charts
   helm repo update
   ```

2. **Install the chart** 🎉
   ```bash
   helm install novu nova-edge-charts/novu \
     --namespace novu \
     --create-namespace
   ```

3. **Verify** 🔍
   ```bash
   kubectl get pods -n novu
   ```

## 🗑️ Uninstallation

To remove all Novu resources:
```bash
helm uninstall novu -n novu
kubectl delete namespace novu
```

## ⚙️ Configuration

The following table lists the most commonly used parameters. For the full list, refer to [values.yaml](values.yaml).

| Parameter                        | Description                      | Default    |
|----------------------------------|----------------------------------|------------|
| `web.replicaCount`               | 🚀 Number of web pods            | `1`        |
| `api.replicaCount`               | 🔧 Number of API pods            | `1`        |
| `worker.replicaCount`            | 🏭 Number of worker pods         | `1`        |
| `ws.replicaCount`                | 🌐 Number of WebSocket pods      | `1`        |
| `global.env.mongodb.maxPoolSize` | 💾 MongoDB connection pool size  | `200`      |
| `global.env.secret.jwtSecret`    | 🔑 JWT signing secret            | *required* |
| `ingress.enabled`                | 🚪 Enable ingress                | `false`    |

## 🛢️ Persistence

By default, Novu uses ephemeral MongoDB and Redis. To enable persistence, configure `persistence` settings in [`values.yaml`](values.yaml).

## 📦 Image Tags

| Component | Default Image Tag   |
|-----------|---------------------|
| web       | `latest`            |
| api       | `latest`            |
| worker    | `latest`            |
| ws        | `latest`            |

## 📑 Schema Validation

Helm (>=3.7) automatically validates your custom values against `values.schema.json` on `helm install`, `helm upgrade` and `helm lint`.

**Editor support:** To get autocompletion & live errors, either:

- **Add a schema hint** at the top of `charts/novu/values.yaml`:
  ```yaml
  # yaml-language-server: $schema=https://raw.githubusercontent.com/Nova-Edge/novu-chart/refs/heads/main/charts/novu/values.schema.json
  ```

- **Map the schema URL** in your IDE (VS Code, JetBrains, etc.) to `charts/novu/values.yaml`.

## 👥 Maintainers

| Name            | Email                         |
|-----------------|-------------------------------|
| Ugo Mignon      | ugo.mignon@gameverse.app      |
| Jordan Labrosse | jordan.labrosse@gameverse.app |

## 📄 License

This chart is licensed under the **MIT License**. See [LICENSE](../../LICENSE).
