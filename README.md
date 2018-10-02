# sfc-k8s-device-plugin

Device plugin to monitor Solarflare NIC availability and allow pods that need it to be correctly scheduled.

See https://blog.openshift.com/the-path-to-cloud-native-trading-platforms/ for more information.


To use it:

Build the Solarflare Device Plugin container image

# cd sfc-k8s-device-plugin/container
# docker build -t sfc-dev-plugin .

Tag and push the built image to a registry

# docker tag sfc-dev-plugin quay.io/<username>/sfc-dev-plugin
# docker push quay.io/<username>/sfc-dev-plugin

Create the Security Context Constraints within the Solarflare namespace that will allow the device plugin the necessary privileges and capabilities to do its job.

# oc create -f scc/sfc-deviceplugin-scc.yaml

(if that doesn't create the service account use "oc create sa sfc-deviceplugin")

Now we’re ready to create the DaemonSet that will run the Solarflare Device Plugin pod on every node.
Edit deviceplugin/sfc-device-plugin.yml to point to the quay.io image you created above.

# oc create -f deviceplugin/sfc-device-plugin.yml
