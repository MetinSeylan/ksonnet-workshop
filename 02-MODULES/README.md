#### Create a module
``` bash
ks module create order-service
```

#### Add Component
``` bash
ks generate io.ksonnet.pkg.deployed-service order-redis --name="order-service-redis" --image="redis:latest" --module="order-service"
ks generate io.ksonnet.pkg.deployed-service order-nginx --type="LoadBalancer" --name="order-service-nginx" --image="nginx:latest" --module="order-service"
```

#### Add Environment Target
``` bash
ks env targets production --module order-service
```

#### Apply
``` bash
ks apply production
```