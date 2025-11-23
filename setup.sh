
cd ./openshift/oauth
./setup.sh
cd ..
./preparation.sh
cd ..
oc apply -k ./openshift
oc apply -k ./openshift/llama-server
