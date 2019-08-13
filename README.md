# drone-kubectl [![Build Status](https://drone.julina.ch/api/badges/sybnex/drone-kubectl/status.svg)](https://drone.julina.ch/sybnex/drone-kubectl) [![Pull Count](https://badgen.net/docker/pulls/sybex/drone-kubectl)](https://hub.docker.com/r/sybex/drone-kubectl) 

This [Drone](https://drone.io/) plugin allows you to use `kubectl` without messing around with the authentication

The docker image is also scanned by Clair.

## Usage

You can use all the Drone [env reference variables](https://docs.drone.io/reference/environ/) in your yaml files.
They will be replaced before the deployment.

```yaml
# drone 1.x syntax
kind: pipeline
name: deploy

steps:
  - name: deploy
    image: sybex/drone-kubectl
    settings:
      kubernetes_server:
        from_secret: k8s_server
      kubernetes_cert:
        from_secret: k8s_cert
      kubernetes_token:
        from_secret: k8s_token
    commands:
      - kubectl create -f job_foo.yaml
      - kubectl wait --for=condition=complete -f job_foo.yaml

```

### Special thanks to

Inspired by [drone-kubernetes](https://github.com/honestbee/drone-kubernetes).
