<!--
Not all PRs will require all tests to be carried out. Delete where appropriate.
-->

<!--
MODIFY THIS AFTER your new app repo is in https://github.com/giantswarm/github
@team-rocket will be automatically requested for review once
this PR has been submitted. (But not for drafts)
-->

**EXTREMELY IMPORTANT: if you are updating the rook-operator helm chart from upstream via the git subtree method, you _must not_ squash merge this PR as it will break future updates. Standard merges only, please - you'll save future you a lot of pain.**


This PR:

- adds/changes/removes etc

### Testing

Description on how {APP-NAME} can be tested.

- [ ] fresh install works
  - [ ] KVM
- [ ] upgrade from previous version works
  - [ ] KVM

#### Other testing

Additional testing which should be carried out:

- [ ] check reconciliation of existing resources after upgrading
- [ ] X still works after upgrade
- [ ] Y is installed correctly

<!--
Changelog must always be updated.
-->

### Checklist

- [ ] Update changelog in CHANGELOG.md.
- [ ] Make sure `values.yaml` and `values.schema.json` are valid (more info on the values schema can be found [here](https://intranet.giantswarm.io/docs/organizational-structure/teams/halo/app-updates/helm-values-schema/)).
- [ ] I understand that I should not squash merge this PR if I am updating the `rook-operator` helm chart via the subtree method.
