source:
  kind: dockerDigest
  name: Get jenkinsciinfra/ldap:cron-latest docker digest
  spec:
    image: "jenkinsciinfra/ldap"
    tag: "cron-latest"
targets:
  imageTag:
    name: "Update Ldap crond docker image digest"
    kind: yaml
    spec:
      file: "charts/ldap/values.yaml"
      key: "image.crond.tag"
    scm:
      github:
        user: "{{ .github.user }}"
        email: "{{ .github.email }}"
        owner: "jenkins-infra"
        repository: "charts"
        token: "{{ requiredEnv .github.token }}"
        username: "{{ .github.username }}"
        branch: "master"
