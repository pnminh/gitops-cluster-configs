## Rollouts support for Openshift
https://github.com/argoproj-labs/rollouts-plugin-trafficrouter-openshift
## Blue-green deployment
- 2 routes/services, 1 for active, and 1 for preview
- If this is first deployment, or if the promotion takes place, manually with `kubectl argo rollouts promote $ROLLOUT_NAME`, then both services will points to same pods
- During new deployment, if promotion is paused, active service points to existing one, preview service point to new one, using selector