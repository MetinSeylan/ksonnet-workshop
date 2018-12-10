// @apiVersion 0.0.1
// @name io.ksonnet.pkg.nginx
// @description .
// @shortDescription .
// @param name string Name to give to each of the components


local k = import 'k.libsonnet';
local nginx = import 'metin/nginx/nginx.libsonnet';

local appName = import 'param://name';

k.core.v1.list.new([
  nginx.parts.deployment.base(appName),
  nginx.parts.service(appName),
])
