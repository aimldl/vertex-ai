gcloud resource-manager org-policies set-policy \
    --project=$PROJECT_ID
    --constraint=compute.requireShieldedVm \
    --policy-file=- <<EOF
constraint: compute.requireShieldedVm
listPolicy:
  allValues:
  - ALLOW_ALL
etag: BwWjRHCMETo=  # Replace with the current etag if updating an existing policy
EOF