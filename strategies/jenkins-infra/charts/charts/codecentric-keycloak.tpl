source:
  kind: helmChart
  name: "Get keycloak helm chart version"
  spec:
    url: https://codecentric.github.io/helm-charts
    name: keycloak
conditions:
  helmfileRelease:
    name: "Check if codecentric/keycloak is used"
    kind: yaml
    spec:
      file: "helmfile.d/keycloak.yaml"
      key: "releases[0].chart"
      value: "codecentric/keycloak"
    scm:
      github:
        user: "{{ .github.user }}"
        email: "{{ .github.email }}"
        owner: "jenkins-infra"
        repository: "charts"
        token: {{ requiredEnv "UPDATECLI_GITHUB_TOKEN" }}
        username: "{{ .github.username }}"
        branch: "master"
targets:
  chartVersion:
    name: "Update codecentric/keycloak Helm Chart version"
    kind: yaml
    spec:
      file: "helmfile.d/keycloak.yaml"
      key: "releases[0].version"
    scm:
      github:
        user: "{{ .github.user }}"
        email: "{{ .github.email }}"
        owner: "jenkins-infra"
        repository: "charts"
        token: {{ requiredEnv "UPDATECLI_GITHUB_TOKEN" }}
        username: "{{ .github.username }}"
        branch: "master"
