[![Novu Logo](https://user-images.githubusercontent.com/2233092/213641043-3bbb3f21-3c53-4e67-afe5-755aeb222159.png)](https://novu.co?utm_source=github)

[![License](https://img.shields.io/github/license/nova-edge/novu-chart)](https://github.com/nova-edge/novu-chart/blob/main/LICENSE) [![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/novu)](https://artifacthub.io/packages/helm/novu/novu) 

⚠️ This Helm Chart is created by the community and is not officially supported by the Novu team.

This Helm Chart project provides an easy way to deploy Novu, an innovative open-source tool that significantly simplifies notification integration into modern applications. By using this Helm Chart, teams can leverage a robust and flexible solution to orchestrate all of Novu's features across their Kubernetes clusters, ensuring complete adaptability and optimized configuration according to their specific needs.

**Explore the official Novu documentation »**  
https://docs.novu.co?utm_campaign=github-readme

**Report a bug** · **Request a feature** · **Join our Discord**
- Bug report: https://github.com/nova-edge/novu-chart/issues/new?assignees=&labels=bug&template=bug_report.yml
- Feature request: https://github.com/nova-edge/novu-chart/issues/new?assignees=&labels=enhancement&template=feature_request.yml
- Discord: https://discord.gg/5hNfTC68fw

## ⭐ Why Use This Helm Chart for Novu?

This Helm Chart offers an efficient and simplified method for deploying Novu within Kubernetes clusters, enabling development teams to seamlessly and centrally integrate multi-channel notifications. Novu is designed to manage a broad range of notification channels, including email, SMS, push notifications, and in-app notifications, ensuring a consistent and enhanced experience for the end user. Using this Helm Chart, it is possible to deploy a complete notification management solution with just a few commands, seamlessly integrating into your existing infrastructure while guaranteeing high levels of security and scalability.

Whether you are a startup looking to speed up the implementation of your services or an enterprise requiring scalable deployment, this Helm Chart simplifies every step of the integration process. This allows you to focus on product innovation without being bogged down by the underlying infrastructure complexities. Novu adapts equally well to the needs of small teams and to more complex multi-tenant deployments.

## ✨ Features

- 🚀 Deploy Novu with a simple `helm install`: a quick and hassle-free deployment process.
- ⚙️ Advanced customization via `values.yaml`: configure Novu according to your specific environment needs.
- 📦 Multi-channel provider support (Inbox/In-App, Email, SMS, Push, Chat): centralize notification management seamlessly.
- 📋 Integrated dashboard for holistic management: visualize notifications and related events in real-time.
- 🌍 Adaptability to local, cloud, and hybrid Kubernetes environments: works perfectly on various cluster types.
- 🔄 Smooth integration with CI/CD tools: easily implement Novu in your DevOps pipelines for increased automation.
- 💡 Flexible scaling: define resource requirements for each component to optimize performance based on deployment needs.
- 🛡 Enhanced security: centralized secret management ensures optimal security throughout the notification process.

## 🚀 Getting Started

To get started with this Helm Chart, follow the steps below:

1. Add the Helm repository:
   ```bash
   helm repo add nova-edge-charts oci://ghcr.io/nova-edge/charts
   ```

2. Install the Novu Chart:
   ```bash
   helm install novu nova-edge-charts/novu
   ```

3. Configure your installation:
   The `values.yaml` file allows you to customize every aspect of the Novu installation, from resource management to configuring environment parameters. This flexibility enables you to adapt the deployment to achieve optimal performance and compatibility, whether for local experimentation or large-scale production deployments.

## 📚 Table of Contents

- [Why Use This Helm Chart for Novu?](#-why-use-this-helm-chart-for-novu)
- [Features](#-features)
- [Getting Started](#-getting-started)
- [Configuration](#%EF%B8%8F-configuration)
- [Need Help?](#-need-help)
- [Links](#-links)
- [License](#%EF%B8%8F-license)

## ⚙️ Configuration

You can customize the installation of Novu by modifying the values in your `values.yaml` file. Below is an example of the most common parameters:

```yaml
ingress:
  enabled: false
  className: ""
  annotations: {}
  host: chart-example.local
  tls: []

service:
  type: ClusterIP

web:
  replicaCount: 1
  image:
    repository: ghcr.io/novuhq/novu/web
    pullPolicy: IfNotPresent
    tag: ""
  port: 4200
  resources: {}
  widgets:
    embedPath: http://localhost:4701/embed.umd.min.js
    url: http://localhost:4500

api:
  replicaCount: 1
  image:
    repository: ghcr.io/novuhq/novu/api
    pullPolicy: IfNotPresent
    tag: ""
  port: 3000
  resources: {}
  contextPath: ""

worker:
  replicaCount: 1
  image:
    repository: ghcr.io/novuhq/novu/worker
    pullPolicy: IfNotPresent
    tag: ""
  resources: {}
  broadcastQueueChunkSize: 100
  multicastQueueChunkSize: 100

ws:
  replicaCount: 1
  image:
    repository: ghcr.io/novuhq/novu/ws
    pullPolicy: IfNotPresent
    tag: ""
  port: 3002
  contextPath: ""
  resources: {}

global:
  imagePullSecrets: []
  env:
    nodeEnv: production
    mongodb:
      maxPoolSize: 200
      minPoolSize: 75
    secret:
      jwtSecret: your-secret
      storageKey: <ENCRYPTION_KEY_MUST_BE_32_LONG>
    s3:
      localStack: false
      bucketName: your-bucket-name
      region: your-region
    aws:
      accessKeyId: your-access-key-id
      secretAccessKey: your-secret-access-key
    sentry:
      dsn: your-sentry-dsn
    newRelic:
      appName: your-new-relic-app-name
      licenseKey: your-new-relic-license-key
    apiRootUrl: http://localhost:3000
    disableUserRegistration: false
    frontBaseUrl: http://localhost:4200

redis:
  enabled: true
  replica:
    replicaCount: 1

mongodb:
  enabled: true
```

For a complete list of configurable values, refer to the [values.yaml file](https://github.com/nova-edge/novu-chart/blob/main/values.yaml).

## 💻 Need Help?

If you encounter any issues or have questions, join our [Discord server](https://discord.novu.co) for support. You can also open a [GitHub issue](https://github.com/nova-edge/novu-chart/issues/new). Our community is active and ready to assist you in resolving problems and answering your questions.

## 🔗 Links

- [Novu Homepage](https://novu.co?utm_campaign=github-readme)
- [Novu Documentation](https://docs.novu.co?utm_campaign=github-readme)
- [Contribution Guide](https://github.com/nova-edge/novu-chart/blob/main/CONTRIBUTING.md)
- [Novu Blog](https://novu.co/blog): Explore articles on best practices for notification integration, new features in Novu, and more.
- [Video Tutorials](https://novu.co/tutorials): Watch video tutorials to help you get started and integrate Novu more easily.

## 🛡️ License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/nova-edge/novu-chart/blob/main/LICENSE) file for details.

## 💪 Thanks to All Our Contributors

Thanks to everyone who has taken the time to contribute to this project and help it grow! Your participation is essential to making Novu the best open-source notification management solution.

[![Contributors](https://contrib.rocks/image?repo=nova-edge/novu-chart)](https://github.com/nova-edge/novu-chart/graphs/contributors)

