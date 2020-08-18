source:
  kind: helmChart
  name: Get cert-manager helm chart version
  spec:
    url: https://charts.jetstack.io
    name: cert-manager
conditions:
  helmfileRelease:
    name: "is jetstack/cert-manager Helm Chart being used"
    kind: yaml
    spec:
      file: "helmfile.d/cert-manager.yaml"
      key: "releases[0].chart"
      value: "jetstack/cert-manager"
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
    name: "Update jetstack/cert-manager Helm Chart version"
    kind: yaml
    spec:
      file: "helmfile.d/cert-manager.yaml"
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
