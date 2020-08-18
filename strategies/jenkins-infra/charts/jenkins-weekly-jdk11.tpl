source:
  kind: maven
  name: Get latest jenkins version
  postfix: "-jdk11"
  spec:
    owner: "maven"
    url: "repo.jenkins-ci.org"
    repository: "releases"
    groupID: "org.jenkins-ci.main"
    artifactID: "jenkins-war"
conditions:
  docker:
    name: "Is Docker Image available on Docker Registry"
    kind: dockerImage
    spec:
      image: "jenkins/jenkins"
targets:
  imageTag:
    name: "Update jenkins/jenkins docker digest"
    kind: yaml
    spec:
      file: "charts/jenkins/values.yaml"
      key: "jenkins.master.imageTag"
    scm:
      github:
        user: "{{ .github.user }}"
        email: "{{ .github.email }}"
        owner: "jenkins-infra"
        repository: "charts"
        token: "{{ requiredEnv .github.token }}"
        username: "{{ .github.username }}"
        branch: "master"
