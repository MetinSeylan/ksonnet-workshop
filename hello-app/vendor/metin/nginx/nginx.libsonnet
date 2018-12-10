local k = import 'k.libsonnet';
local deployment = k.extensions.v1beta1.deployment;
local container = deployment.mixin.spec.template.spec.containersType;

{
  parts:: {
    deployment:: {
      local defaults = {
        imageTag: "latest",
        imagePullPolicy: "IfNotPresent",
      },

      base(name, labels={app: name}):: {
        apiVersion: "extensions/v1beta1",
        kind: "Deployment",
        metadata: {
          name: name,
          labels: { app: name },
        },
        spec: {
          replicas: 1,
          template: {
            metadata: { labels: labels },
            spec: {
              containers: [{
                name: name,
                image: "nginx:" + defaults.imageTag,
                imagePullPolicy: defaults.imagePullPolicy,
                ports: [
                  {
                    name: "http",
                    containerPort: 80,
                  },
                  {
                    name: "https",
                    containerPort: 443,
                  },
                ],
                livenessProbe: {
                  httpGet: {
                    path: "/",
                    port: "http",
                  },
                  initialDelaySeconds: 30,
                  timeoutSeconds: 5,
                  failureThreshold: 6,
                },
                readinessProbe: {
                  httpGet: {
                    path: "/",
                    port: "http",
                  },
                  initialDelaySeconds: 5,
                  timeoutSeconds: 3,
                  periodSeconds: 5,
                },
              }],
            },
          },
        },
      },
    },

    service(name, selector={app: name}):: {
      apiVersion: "v1",
      kind: "Service",
      metadata: {
        name: name,
        labels: { app: name },
      },
      spec: {
        type: "LoadBalancer",
        ports: [
          {
            name: "http",
            port: 80,
            targetPort: "http",
          },
        ],
        selector: selector,
      },
    },
  },
}
