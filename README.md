<div align="center">
  <a href="https://novu.co?utm_source=github" target="_blank">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/2233092/213641039-220ac15f-f367-4d13-9eaf-56e79433b8c1.png">
    <img alt="Novu Logo" src="https://user-images.githubusercontent.com/2233092/213641043-3bbb3f21-3c53-4e67-afe5-755aeb222159.png" width="280"/>
  </picture>
  </a>
</div>

<br/>

<p align="center">
  <a href="https://github.com/nova-edge/novu-chart/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/nova-edge/novu-chart" alt="MIT">
  </a>
</p>

<div align="center">
  ⚠️ This Helm Chart is created by the community and is not officially supported by the Novu team.
</div>

<div align="center">
  This Helm Chart project provides an easy way to deploy Novu, an innovative open-source tool that significantly simplifies notification integration into modern applications. By using this Helm Chart, teams can leverage a robust and flexible solution to orchestrate all of Novu's features across their Kubernetes clusters, ensuring complete adaptability and optimized configuration according to their specific needs.
</div>

<p align="center">
  <br />
  <a href="https://docs.novu.co?utm_campaign=github-readme" rel="dofollow"><strong>Explore the official Novu documentation »</strong></a>
  <br />
  or
  <br />
  <a href="https://github.com/nova-edge/novu-chart/issues/new?assignees=&labels=bug&template=bug_report.yml&title=%F0%9F%90%9B+Bug+Report%3A+">Report a bug</a>
  ·
  <a href="https://github.com/nova-edge/novu-chart/issues/new?assignees=&labels=enhancement&template=feature_request.yml&title=%F0%9F%9A%80+Feature%3A+">Request a feature</a>
  ·
  <a href="https://bit.ly/novu-github-discord">Join our Discord</a>
</p>

## ⭐ Why Use This Helm Chart for Novu?

This Helm Chart offers an efficient and simplified method for deploying Novu within Kubernetes clusters, enabling development teams to seamlessly and centrally integrate multi-channel notifications. Novu is designed to manage a broad range of notification channels, including email, SMS, push notifications, and in-app notifications, ensuring a consistent and enhanced experience for the end user. Using this Helm Chart, it is possible to deploy a complete notification management solution with just a few commands, seamlessly integrating into your existing infrastructure while guaranteeing high levels of security and scalability.

Whether you are a startup looking to accelerate the implementation of your services or an enterprise requiring scalable deployment, this Helm Chart simplifies every step of the integration process. This allows you to focus on product innovation without being bogged down by the underlying infrastructure complexities. Novu adapts equally well to the needs of small teams and to more complex multi-tenant deployments.

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
   helm repo add novu-helm oci://ghcr.io/nova-edge/novu
   ```

   Adding this repository will give you access to the most recent versions of our Helm Chart, ensuring you always have the latest improvements and fixes.

2. Install the Novu Chart:

   ```bash
   helm install my-novu novu-helm/novu
   ```

   This command will deploy Novu with default settings. To cater to the specific needs of your infrastructure, you can customize the deployment by using a custom `values.yaml` file.

3. Configure your installation:

   The `values.yaml` file allows you to customize every aspect of the Novu installation, from resource management to configuring environment parameters. This flexibility enables you to adapt the deployment to achieve optimal performance and compatibility, whether for local experimentation or large-scale production deployments.

## 📚 Table of Contents

- [Why Use This Helm Chart](#-why-use-this-helm-chart-for-novu)
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
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  host: chart-example.local
  tls: []
  #  - secretName: chart-example-tls
  #    hosts:
  #      - chart-example.local

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
  contextPath:

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
  contextPath:
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

If you encounter any issues or have questions, join our [Discord server](https://discord.novu.co) for support. You can also open a [GitHub issue](https://github.com/nova-edge/novu-chart/issues). Our community is active and ready to assist you in resolving problems and answering your questions.

## 🔗 Links

- [Novu Homepage](https://novu.co?utm_campaign=github-readme)
- [Novu Documentation](https://docs.novu.co?utm_campaign=github-readme)
- [Contribution Guide](https://github.com/nova-edge/novu-chart/blob/main/CONTRIBUTING.md)
- [Novu Blog](https://novu.co/blog): Explore articles on best practices for notification integration, new features in Novu, and more.
- [Video Tutorials](https://novu.co/tutorials): Watch video tutorials to help you get started and integrate Novu more easily.

## 🛡️ License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/nova-edge/novu-chart/blob/main/LICENSE) file for details. This license allows you to use, modify, and distribute this project freely, as long as the established terms are met.

## 💪 Thanks to All Our Contributors

Thanks to everyone who has taken the time to contribute to this project and help it grow! Your participation is essential to making Novu the best open-source notification management solution.

<a href="https://github.com/nova-edge/novu-chart/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=nova-edge/novu-chart" />
</a>

We encourage you to contribute by opening issues, suggesting new features, or improving the documentation. Every contribution, large or small, is valuable to us and to the community!

