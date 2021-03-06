A config extension to introduce a delay.

## Installation

Create a shared secret:

```console
$ openssl rand -hex 16
bea26a2221fd8090ea38720fc445eca6
```

Download and run the plugin:

```console
$ docker run -d \
  --publish=3000:3000 \
  --env=DRONE_DEBUG=true \
  --env=DRONE_SECRET=bea26a2221fd8090ea38720fc445eca6 \
  --env=DRONE_SLEEP=5m \
  --restart=always \
  --name=drone-delay-config drone-delay-config
```

Update your Drone server configuration to include the plugin address and the shared secret.

```text
DRONE_YAML_ENDPOINT=http://1.2.3.4:3000
DRONE_YAML_SECRET=bea26a2221fd8090ea38720fc445eca6
```
