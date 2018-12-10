{
  global: {
    // User-defined global parameters; accessible to all component and environments, Ex:
    // replicas: 4,
  },
  components: {
    // Component-level parameters, defined initially from 'ks prototype use ...'
    // Each object below should correspond to a component in the components/ directory
    "order-redis": {
      containerPort: 80,
      image: "redis:latest",
      name: "order-service-redis",
      replicas: 1,
      servicePort: 80,
      type: "ClusterIP",
    },
    "order-nginx": {
      containerPort: 80,
      image: "nginx:latest",
      name: "order-service-nginx",
      replicas: 1,
      servicePort: 80,
      type: "ClusterIP",
    },
  },
}
