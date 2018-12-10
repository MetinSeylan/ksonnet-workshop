#### Add Registry
``` bash
ks registry add metin ../04-PACKAGE/metin/registry
```

#### Install Package
``` bash
ks pkg install metin/nginx
```

#### List Prototypes
``` bash
ks prototype list
```

#### Generate Component from Prototype
``` bash
ks generate io.ksonnet.pkg.nginx metin-nginx
```

#### Apply to cluster
``` bash
ks apply production
```