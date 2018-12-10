#### Installation
``` bash
brew install ksonnet/tap/ks
```

#### Initialize Application
``` bash
ks init hello-app
```

#### Create Namespaces
``` bash
ks generate io.ksonnet.pkg.namespace production-namespace --name="production"
ks generate io.ksonnet.pkg.namespace production-staging --name="staging"
```

#### Create Environments
``` bash
ks env add staging --namespace="staging"
ks env add production --namespace="production"
```

#### Create Components
``` bash
ks generate deployed-service nginx --image="nginx:latest" --type="LoadBalancer"
```

#### Create Environment Level Params
``` bash
ks param set nginx replicas 1 --env staging
ks param set nginx replicas 3 --env production
```

#### Apply
``` bash
ks apply production
ks apply staging
```

#### Cleanup
``` bash
ks component rm nginx
```