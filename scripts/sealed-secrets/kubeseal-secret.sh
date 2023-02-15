export SEALED_SECRETS_CONTROLLER_NAMESPACE=sealed-secrets
kubeseal -o yaml --controller-name sealed-secrets <*/*-secret.yaml> */*-secret-sealed.yaml