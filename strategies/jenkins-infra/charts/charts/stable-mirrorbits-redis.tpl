source:
  kind: helmChart
  name: Get redis helm chart version
  spec:
    url: https://kubernetes-charts.storage.googleapis.com
    name: redis
conditions:
  chartVersion:
    name: "is stable/redis Helm Chart being used"
    kind: yaml
    spec:
      file: "helmfile.d/mirrorbits.yaml"
      key: "releases[0].chart"
      value: "stable/redis"
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
    name: "Update stable/redis Helm Chart version"
    kind: yaml
    spec:
      file: "helmfile.d/mirrorbits.yaml"
      key: "releases[0].version"
    scm:
      github:
        user: "updatecli"
        email: "updatecli@olblak.com"
        owner: "jenkins-infra"
        repository: "charts"
        token: {{ requiredEnv "UPDATECLI_GITHUB_TOKEN" }}
        username: "olblak"
        branch: "master"
