<!--
Not all PRs will require all tests to be carried out. Delete where appropriate.
-->

<!--
MODIFY THIS AFTER your new app repo is in https://github.com/giantswarm/github
@team-rocket will be automatically requested for review once
this PR has been submitted. (But not for drafts)
-->

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
