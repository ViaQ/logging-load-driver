loader-deployment.yaml: loader-template.yaml
	oc process -f loader-template.yaml

apply: loader-deployment.yaml
	oc delete --ignore-not-found=true deployment loader
	oc apply -f loader-deployment.yaml
