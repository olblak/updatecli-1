source:
  kind: helmChart
  name: Get oauth2-proxy helm chart version
  spec:
    url: https://kubernetes-charts.storage.googleapis.com
    name: oauth2-proxy
conditions:
  helmfileRelease:
    name: "Is stable/oauth2-proxy Helm Chart being used"
    kind: yaml
    spec:
      file: "helmfile.d/oauth2-proxy.yaml"
      key: "releases[0].chart"
      value: "stable/oauth2-proxy"
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
    name: "Update stable/oauth2-proxy Helm Chart"
    kind: yaml
    spec:
      file: "helmfile.d/oauth2-proxy.yaml"
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
