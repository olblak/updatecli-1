source:
  kind: helmChart
  name: Get loki helm chart version
  spec:
    url: https://grafana.github.io/loki/charts
    name: loki

conditions:
  helmfileRelease:
    name: "Test grafana/loki Helm Chart is being used"
    kind: yaml
    spec:
      file: "helmfile.d/loki.yaml"
      key: "releases[0].chart"
      value: "loki/loki"
    scm:
      github:
        user: "{{ .github.user }}"
        email: "{{ .github.email }}"
        owner: jenkins-infra
        repository: charts
        token: "{{ requiredEnv .github.token }}"
        username: "{{ .github.username }}"
        branch: "{{ .github.branch }}"

targets:
  chartVersion:
    name: "Update grafana/loki Helm Chart"
    kind: yaml
    spec:
      file: "helmfile.d/loki.yaml"
      key: "releases[0].version"
    scm:
      github:
        user: "{{ .github.user }}"
        email: "{{ .github.email }}"
        owner: jenkins-infra
        repository: charts
        token: "{{ requiredEnv .github.token }}"
        username: "{{ .github.username }}"
        branch: "{{ .github.branch }}"
