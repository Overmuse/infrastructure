# Emergency playbook

## Process
Pause deploys by running `flux suspend kustomization flux-system`

## Post-emergency process
Reactivate deploys with `flux resume kustomization flux-system`
