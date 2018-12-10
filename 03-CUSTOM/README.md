#### Params
``` json
"my-nginx": {
  containerPort: 80,
  image: "nginx:latest",
  name: "my-nginx",
  replicas: 2,
  servicePort: 80,
  type: "LoadBalancer",
},
```