---
source:
  name: "Get azure-cli latest version"
  kind: githubRelease
  replaces:
    - from: "azure-"
      to: ""
    - from: "cli-"
      to: ""
  spec:
    owner: "azure"
    repository: "azure-cli"
    token: "{{ requiredEnv .github.token }}"
    username: "{{ .github.username }}"
    version: "latest"
conditions:
  packageImageTag:
    name: "is docker image name set to azure-cli?"
    kind: yaml
    spec:
      file: "PodTemplates.d/release-linux.yaml"
      key: "spec.containers[0].name"
      value: "azure-cli"
    scm:
      github:
        user: "{{ .github.user }}" 
        email: "{{ .github.email }}" 
        owner: "jenkins-infra"
        repository: "release"
        token: "{{ requiredEnv .github.token }}" 
        username: "{{ .github.username }}" 
        branch: "master"
  docker:
    name: "is Docker Image Tag exist on DockerHub"
    kind: dockerImage
    spec:
      url: "mcr.microsoft.com"
      image: "azure-cli"
targets:
  packageImageTag:
    name: "Update microsoft/azure-cli docker image tag"
    kind: yaml
    prefix: "microsoft/azure-cli:"
    spec:
      file: "PodTemplates.d/release-linux.yaml"
      key: "spec.containers[0].image"
    scm:
      github:
        user: "{{ .github.user }}" 
        email: "{{ .github.email }}" 
        owner: "jenkins-infra"
        repository: "release"
        token: "{{ requiredEnv .github.token }}" 
        username: "{{ .github.username }}" 
        branch: "master"
