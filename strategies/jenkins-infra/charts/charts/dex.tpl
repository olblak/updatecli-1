source:
  kind: helmChart
  name: Get Dex helm chart version
  spec:
    url: https://kubernetes-charts.storage.googleapis.com
    name: dex

conditions:
  helmfileRelease:
    name: "Test if stable/dex Helm Chart is defined"
    kind: yaml
    spec:
      file: "helmfile.d/dex.yaml"
      key: "releases[0].chart"
      value: "stable/dex"
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
    name: "Update stable/dex Helm Chart version"
    kind: yaml
    spec:
      file: "helmfile.d/dex.yaml"
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
