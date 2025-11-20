# Create htpasswd file with users and passwords
htpasswd -c -B -b ocp.htpasswd admin admin
htpasswd -B -b ocp.htpasswd user1 user1
htpasswd -B -b ocp.htpasswd user2 user2

# Create htpasswd secret in OpenShift from the htpasswd file
oc create secret generic htpasswd-secret \
  --from-file=htpasswd=ocp.htpasswd \
  -n openshift-config

# Create OAuth configuration to use htpasswd secret
oc apply -f oauth-provider-from-htpasswd-secret.yaml

# Create admin group and add admin user
oc adm groups new litemaas-admins
oc adm groups add-users litemaas-admins admin

# Create read-only admin group and add user1
oc adm groups new litemaas-readonly
oc adm groups add-users litemaas-readonly user1

# Create users group and add user2
oc adm groups new litemaas-users
oc adm groups add-users litemaas-users user2

# Report update progress with a command
# oc get pods -n openshift-authentication -w 