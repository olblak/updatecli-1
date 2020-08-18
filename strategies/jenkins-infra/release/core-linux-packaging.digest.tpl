---
source:
  name: "Docker Image Published on DockerHub"
  kind: dockerDigest
  changelog: https://github.com/jenkins-infra/docker-packaging
  spec:
    image: "jenkinsciinfra/packaging"
    tag: latest
conditions:
  packageImageTag:
    name: "Docker image microsoft/azure-cli is available on Dockerhub"
    kind: yaml
    spec:
      file: "PodTemplates.d/package-linux"
      key: "spec.containers[1].name"
      value: "packaging"
    scm:
      github:
        user: "{{ .github.user }}" 
        email: "{{ .github.email }}" 
        owner: "jenkins-infra"
        repository: "release"
        token: "{{ requiredEnv .github.token }}" 
        username: "{{ .github.username }}" 
        branch: "master"
targets:
  packageImageTag:
    name: "package-linux podtemplate.yaml"
    kind: yaml
    prefix: "jenkinsciinfra/packaging:sha256@"
    spec:
      file: "PodTemplates.d/package-linux"
      key: "spec.containers[1].image"
    scm:
      github:
        user: "{{ .github.user }}" 
        email: "{{ .github.email }}" 
        owner: "jenkins-infra"
        repository: "release"
        token: "{{ requiredEnv .github.token }}" 
        username: "{{ .github.username }}" 
        branch: "master"
