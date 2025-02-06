for ns in knative-eventing knative-serving; do
  kubectl patch --namespace "$ns" configmap/config-tracing \
   --type merge \
   --patch '{"data":{"backend":"zipkin","zipkin-endpoint":"http://otel-collector.observability:9411/api/v2/spans", "debug": "true"}}'
done