
cd ./openshift/oauth
./setup.sh
cd ..
./preparation.sh
cd ..
oc apply -k ./openshift

