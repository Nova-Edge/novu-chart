# Contributing Guide for the Novu Helm Chart 🌟

Thank you for contributing to our Helm Chart project for deploying **Novu**, the open-source notification
infrastructure. Follow these steps to ensure a smooth development experience. 🛠️

## Prerequisites 📋

- **Helm**: Version 3 or above.
- **Kubernetes**: Access to a cluster for testing.

## Commit Conventions 📝

Use Conventional Commits:

`type(scope): description`

Examples:

- `feat(api): add custom scaling`
- `fix(worker): resolve memory leaks`

## Versioning 🚀

The versionning is automatic don't change the version in `Chart.yaml`.

## Git Workflow 🔄

1. Create a branch:
   ```bash
   git checkout develop
   git checkout -b feature/my-feature
   ```
2. Validate with:
   ```bash
   helm lint ./novu
   ```
3. Test in a Kubernetes cluster:
   ```bash
   helm install my-novu ./novu
   ```
4. Push your branch and open a pull request to `main`.

## Testing ✅

- Use `helm lint`.
- Test on Kubernetes (e.g., Minikube).

## Community Support 💬

- Open an issue on GitHub.

Thank you for contributing! 🚀

