#!/bin/bash

# 🔍 Get external route
LLAMA_HOST=$(oc get route llama -n litemaas -o jsonpath='{.spec.host}')

echo
echo "🌐 LLAMA HOST: $LLAMA_HOST"
echo

# 📥 Pull models
echo "⬇️  Pulling models..."
curl -s "https://$LLAMA_HOST/api/pull" -d '{"model":"granite4"}'
curl -s "https://$LLAMA_HOST/api/pull" -d '{"model":"llama2"}'
curl -s "https://$LLAMA_HOST/api/pull" -d '{"model":"mistral"}'

echo
echo "📦 Available models:"
echo

# 🧠 List models with icons
curl -s "https://$LLAMA_HOST/api/tags" \
  | jq -r '.models[].name' \
  | sed 's/^/🧩 /'

echo
echo "✅ Model setup complete."
echo