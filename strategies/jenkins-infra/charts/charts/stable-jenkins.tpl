source:
  kind: helmChart
  name: Get Jenkins helm chart version
  spec:
    url: https://kubernetes-charts.storage.googleapis.com
    name: jenkins
conditions:
  chartVersion:
    name: "is stable/jenkins Helm Chart being used"
    kind: yaml
    spec:
      file: "charts/jenkins/requirements.yaml"
      key: "dependencies[0].name"
      value: "jenkins"
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
    name: "Update stable/jenkins Helm Chart"
    kind: yaml
    spec:
      file: "charts/jenkins/requirements.yaml"
      key: "dependencies[0].version"
    scm:
      github:
        user: "{{ .github.user }}"
        email: "{{ .github.email }}"
        owner: jenkins-infra
        repository: charts
        token: "{{ requiredEnv .github.token }}"
        username: "{{ .github.username }}"
        branch: "{{ .github.branch }}"
