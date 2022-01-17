# Hub post installation steps

## Quay Admin User

After applying the OpenShift Plus Hub policy set, you must initialize the quay administrator password.
Quay was configured to allow this one time administrator initialization.  Take a look at the
[Quay documentation](https://access.redhat.com/documentation/en-us/red_hat_quay/3.6/html/deploy_red_hat_quay_on_openshift_with_the_quay_operator/operator-deploy#invoking_the_api) for more details.
View and run the [init-quay.sh](init-quay.sh) script to initialize the password for the administrative
user.  **NOTE:** Do not leave the administrative password set to the value in the script.

## Advanced Cluster Security CA Bundle

The Advanced Cluster Security Central Server needs to generate a CA bundle that can be propagated to 
managed clusters so the ACS Secured Cluster Services can securely communicate back to the Central server.
Run the script `acs-bundle-secret.sh` to create the bundle.  The bundle needs to be created and maintained
in the same namespace where the policies are being created for the Advanced Cluster Security Secured Cluster
services.  A sample command is:

```
./acs-bundle-secret.sh -i acs-bundle.json | oc apply -n policies -f -
```

The command above will store the bundle in the file `acs-bundle.json` and will create the bundle secrets
in the `policies` namespace.
