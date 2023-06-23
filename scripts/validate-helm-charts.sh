echo "Validate helm chart contents"

mkdir -p ./tmp/helm_contents

for dir in $(find . -name "values.yaml" -exec dirname {} \;)
do
  echo
  echo "Validate $dir"
  echo

#  helm template "$dir" -f $dir/values.yaml --output-dir=./tmp/helm_contents
#  kubeconform ./tmp/helm_contents
	helm kubeconform $dir

  validate_response=$?

  if [ $validate_response -ne 0 ]; then
    echo "Error validating $dir"
    exit 1
  fi

  yamllint ./tmp/helm_contents || exit 3
done
