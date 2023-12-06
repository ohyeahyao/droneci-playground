## Create Namespace & Secrets

```
kubectl create ns drone
kubectl apply -n drone -f drone-server/secret.yaml
```

## Deploy Server & Runner

```
helm repo add drone https://charts.drone.io

# server
helm upgrade -i drone drone/drone -n drone -f drone-server/value.server.yaml

# runner
helm upgrade -i drone-runner-docker drone/drone-runner-docker -n drone -f drone-server/value.runner-docker.yaml
```

## Forward Drone to Local
```
kubectl port-forward service/drone -n drone 8089:8080
echo "127.0.0.1       playground.drone.local" >> /etc/hosts
```
and then visits http://playground.drone.local:8089/welcome

### Take access token

visits User Setting Page and see Example CLI Usage:

```
export DRONE_SERVER=http://playground.drone.local:8089
export DRONE_TOKEN={Your_Token}
drone info
```

### Enable This Repository
```
drone repo enable ohyeahyao/droneci-playground
```