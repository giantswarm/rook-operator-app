# App update process

## Updating

There are two distint update processes; one for the main chart and a
second one for the `ceph-cluster` subchart.

### Prepare your local checkout

If you haven't updated this repo before, you will first need to add the
`rook/rook` repo as a remote as we will be pulling in the upstream chart
directly.

Add the remote and fetch tags etc:

```
git remote add -f rook-upstream https://github.com/rook/rook.git
```

Make sure you fetch all changes from upstream:

```
git fetch rook-upstream master
```

Next we checkout the tag we want to update to - it is fine to be in a
detached head state as we aren't going to be committing anything here. You
can also check out an upstream branch, but `rook/rook` uses tags to
denote a release.

Note: it isn't possible to specify the origin of a tag, so if you have a
tag `v1.6.0` in both remotes (local and upstream) then this may cause you
some issues. In this case, use the commit hash in the upstream repo which
the tag points to instead.

```
git switch --detach v1.6.0
```

The repo is now ready to update the upstream charts it tracks.

### Updating the main chart

This process assumes that you have a master branch which is currently
offering `v1.5.9` of `rook`, and you want to update it to `v1.6.0` from
upstream.

As this repo contains additions to the upstream chart, you will need to
merge the changes from the new version in and assess them.
As the upstream Helm chart is in a subdir, we need to use some git magic
to filter out just the files we need into `temp-split-branch`. This
operation may take some time depending on the power of your local machine.

First check that there is no current local branch called `temp-split-branch`,
and remove it if it exists:

```
git branch -D temp-split-branch
```

Then recreate the branch for this update:

```
git subtree split -P cluster/charts/rook-ceph -b temp-split-branch
```

Now we create an update branch from our main branch (which is at `v1.5.9`):

```
git switch -c update-1.6.0 origin/main
```

Then merge in the upstream Helm chart which we split into the
`temp-split-branch` earlier:

```
git subtree merge --squash -P helm/rook-operator temp-split-branch
```

Finally, tidy up the branches we created ready for next time:

```
git branch -D temp-split-branch
```

### Updating the ceph-cluster subchart

This is the same process as for the main chart and should be carried out directly
after updating the main chart to ensure they are in sync.

- Switch to the same upstream release tag again:

```
git switch --detach v1.6.0
```

- Split the subchart off into its own branch:

```
git branch -D temp-split-branch-subchart
git subtree split -P cluster/charts/rook-ceph-cluster -b temp-split-branch-subchart
```

- Change branches back to the update branch created earlier:

```
git switch update-1.6.0
```

- Merge the subchart's branch into our repo and cleanup :

```
git subtree merge --squash -P helm/rook-operator/charts/rook-ceph-cluster temp-split-branch-subchart
git branch -D temp-split-branch-subchart
```

## Making a PR

When squash-merging a PR after merging in from upstream, the commit message
will also include all commit messages from upstream - these can safely be
removed. It is *extremely important* that you retain the following info in
the extended commit message as future subtree merges parse it and they will
fail without it:

```
git-subtree-dir: helm/rook-operator
git-subtree-split: bbf57758fe0706e6134a01d5e8f06dccba4aa0d9
```
