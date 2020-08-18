source:
  kind: helmChart
  name: Get Falco helm chart version
  spec:
    url: https://falcosecurity.github.io/charts
    name: falco

conditions:
  helmfileRelease:
    name: "Test if falco/falco Helm Chart is being used"
    kind: yaml
    spec:
      file: "helmfile.d/falco.yaml"
      key: "releases[0].chart"
      value: "falco/falco"
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
    name: "Update falco/falco Helm Chart"
    kind: yaml
    spec:
      file: "helmfile.d/falco.yaml"
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
