# Emergency playbook

## Process
- Pause deploys by running `flux suspend kustomization flux-system`
- (optional) Check rollout history with `kubectl rollout history deploy/{deployment name}`
- Rollback to previous version of offending app using `kubectl rollout undo deploy/{deployment name}`

## Post-emergency process
Reactivate deploys with `flux resume kustomization flux-system`
