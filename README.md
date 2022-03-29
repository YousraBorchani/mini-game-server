# Mini Game Server

#### There is two current folders : 
- udp-server that contain the application and the Dockerfile.
- terraform that contain the kubernetes manifest deployed on terraform


#### Expose UDP services in Kubernetes using nginx-ingress
![ingress architecture](https://github.com/YousraBorchani/mini-game-server/blob/main/game-server-architecture.png?raw=true)



1. Enable the minikube ingress addon  
```
  minikube addons enable ingress 
``` 

2. Apply k8s maniest
  
```
    cd terraform/ 
    terraform init
    terraform plan
    terraform apply
```


3. Add a UDP service to the nginx ingress

``` 
  cd manifests/
```

```
  kubectl patch configmap udp-services -n ingress-nginx --patch '{"data":{"7778":"default/udp-service:7778"}}'
```

4. Patch nginx controller 

```
  kubectl patch deployment ingress-nginx-controller --patch "$(cat ingress-nginx-controller-patch.yaml)" -n ingress-nginx
```


5. Test udp-server

```
  kubectl logs <NAME_OF_POD> -f
  echo -n "Hello From Outside" | nc -w 1 -u $(minikube ip) 7778
```


