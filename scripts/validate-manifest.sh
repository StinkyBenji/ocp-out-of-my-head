echo "Validate kustomize manifests"

mkdir -p ./tmp/kustomize_manifest

for dir in $(find . -name "kustomization.yaml" -exec dirname {} \;)
do
  echo
  echo "Validate $dir"
  echo

	kustomize build $dir -o ./tmp/kustomize_manifest
	kubeconform -schema-location https://raw.githubusercontent.com/adobe-platform/kubernetes-json-schema/master ./tmp/kustomize_manifest

  validate_response=$?

  if [ $validate_response -ne 0 ]; then
    echo "Error validating $dir"
    exit 1
  fi
done

rm -rf ./tmp

echo "finish validating"
