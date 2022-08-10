#!/bin/bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"/..
KUSTOMIZATION_FILE="$ROOT/components/quality-dashboard/frontend/kustomization.yaml"
CLUSTER_URL_HOST=$(oc whoami --show-console|sed 's|https://console-openshift-console.apps.||')

#yq e -i "s|appstudio-stage.x99m.p1.openshiftapps.com|${CLUSTER_URL_HOST}|" "$KUSTOMIZATION_FILE"
yq e -i "(.configMapGenerator[].literals[] | select(. == \"appstudio-stage.x99m.p1.openshiftapps.com\")) = \"$CLUSTER_URL_HOST\"" "$KUSTOMIZATION_FILE"
