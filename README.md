## OpenShift Cluster Bootstrapping via GitOps

The needed application manifests for the cluster are defined in the `components/apps`, while the configuration manifests for the cluster are defined in the `components/configs`.

Operator installed:
- openshift-gitops-operator (pre-installed)
- openshift-cert-manager-operator
- openshift-pipelines-operator
  - customized `TektonConfig` for Tekton Chains
- rhtas-operator (Red Hat Trusted Artifact Signer)
  - the `securesign` resource is defined

Other applications:
- cert-manager-webhook-for-hetzner
- SPIFFE/SPIRE (https://github.com/spiffe/helm-charts-hardened/)
- Argo Workflows (with a Dex server)

Configuration:
- basic RBAC for groups and users
- Certificates
- NTP configuration
- OAuth config
