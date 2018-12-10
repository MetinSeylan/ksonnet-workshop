local env = std.extVar("__ksonnet/environments");
local params = std.extVar("__ksonnet/params").components["metin-nginx"];


local k = import 'k.libsonnet';
local nginx = import 'metin/nginx/nginx.libsonnet';

local appName = params.name;

k.core.v1.list.new([
  nginx.parts.deployment.base(appName),
  nginx.parts.service(appName),
])
