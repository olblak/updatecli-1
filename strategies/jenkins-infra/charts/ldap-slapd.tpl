source:
  kind: dockerDigest
  name: Get jenkinscinfra/ldap:latest docker image digest
  spec:
    image: "jenkinsciinfra/ldap"
    tag: "latest"
targets:
  imageTag:
    name: "Update Ldap docker image tag"
    kind: yaml
    spec:
      file: "charts/ldap/values.yaml"
      key: "image.slapd.tag"
    scm:
      github:
        user: "{{ .github.user }}"
        email: "{{ .github.email }}"
        owner: "jenkins-infra"
        repository: "charts"
        token: "{{ requiredEnv .github.token }}"
        username: "{{ .github.username }}"
        branch: "master"
