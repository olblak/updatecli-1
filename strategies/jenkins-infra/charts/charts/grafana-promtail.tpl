source:
  kind: helmChart
  name: Get Promtail helm chart version
  spec:
    url: https://grafana.github.io/loki/charts
    name: promtail

conditions:
  helmfileRelease:
    name: "is grafana/promtail Helm Chart used"
    kind: yaml
    spec:
      file: "helmfile.d/promtail.yaml"
      key: "releases[0].chart"
      value: "loki/promtail"
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
    name: "Update grafana/promtail Helm Chart"
    kind: yaml
    spec:
      file: "helmfile.d/promtail.yaml"
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
