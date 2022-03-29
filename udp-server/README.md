# Mini Game Server

## Test the scripts Locally
```
    python3 udp_server.py
    python3 udp_client.py
```
## Build a Docker image
```    
    docker build -t yosra94/udp_server:1.2 .
```
## Create create a container from image 
```
    docker run --rm -p 7778:7778/udp yosra94/udp_server:1.2
```
## Send your UDP packets
```
    echo -n "Hello Yousra" | nc -w 1 -u 127.0.0.1 7778
```
## Push image to dockerHub
```
    docker push yosra94/udp_server:1.2
```