source:
  kind: helmChart
  name: Get nginx ingress helm chart version
  spec:
    url: https://kubernetes-charts.storage.googleapis.com
    name: nginx-ingress
conditions:
  publicHelmfileRelease:
    name: "is public stable/nginx-ingress Helm Chart being used"
    kind: yaml
    spec:
      file: "helmfile.d/nginx-ingress.yaml"
      key: "releases[0].chart"
      value:  "stable/nginx"
    scm:
      github:
        user: "{{ .github.user }}"
        email: "{{ .github.email }}"
        owner: jenkins-infra
        repository: charts
        token: "{{ requiredEnv .github.token }}"
        username: "{{ .github.username }}"
        branch: "{{ .github.branch }}"
  privateHelmfileRelease:
    name: "is private stable/nginx-ingress Helm Chart being used"
    kind: yaml
    spec:
      file: "helmfile.d/nginx-ingress.yaml"
      key: "releases[1].chart"
      value: "stable/nginx"
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
  public-nginx-ingress:
    name: "Update public stable/nginx-ingress Helm Chart"
    kind: yaml
    spec:
      file: "helmfile.d/nginx-ingress.yaml"
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
  private-nginx-ingress:
    name: "Update private stable/nginx-ingress Helm Chart"
    kind: yaml
    spec:
      file: "helmfile.d/nginx-ingress.yaml"
      key: "releases[1].version"
    scm:
      github:
        user: "{{ .github.user }}"
        email: "{{ .github.email }}"
        owner: jenkins-infra
        repository: charts
        token: "{{ requiredEnv .github.token }}"
        username: "{{ .github.username }}"
        branch: "{{ .github.branch }}"
