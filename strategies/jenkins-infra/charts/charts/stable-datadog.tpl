source:
  kind: helmChart
  name: Get Datadog helm chart version
  spec:
    url: https://kubernetes-charts.storage.googleapis.com
    name: datadog
conditions:
  helmfileRelease:
    name: "if stable/datadog Helm Chart being used"
    kind: yaml
    spec:
      file: "helmfile.d/datadog.yaml"
      key: "releases[0].chart"
      value: "stable/datadog"
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
    name: "Update stable/datadog Helm Chart"
    kind: yaml
    spec:
      file: "helmfile.d/datadog.yaml"
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
