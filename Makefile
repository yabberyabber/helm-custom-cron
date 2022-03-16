HELM != helm

gen-expected:
	${HELM} template --kube-version=1.21.0 --namespace=default --values=tests/values.yaml custom . > tests/expected.yaml || \
		${HELM} template --debug --kube-version=1.21.0 --namespace=default --values=tests/values.yaml custom .
	sed -i 's/[[:blank:]]\+$$//g'  tests/expected.yaml
