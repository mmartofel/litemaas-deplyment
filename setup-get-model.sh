
LLAMA_HOST=`oc get route llama -n litemaas -o jsonpath='{.spec.host}'`

curl http://{$LLAMA_HOST}/api/pull -d '{
  "model": "ollama/granite4"
}'

curl http://{$LLAMA_HOST}/api/pull -d '{
  "model": "ollama/llama2"
}'

curl http://{$LLAMA_HOST}/api/pull -d '{
  "model": "ollama/mistral"
}'

curl http://{$LLAMA_HOST}/api/tags