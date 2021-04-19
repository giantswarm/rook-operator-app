# App update process

## Updating

This process assumes that you have a master branch which is currently
offering `v1.5.9` of `rook`, and you want to update it to `v1.6.0` from
upstream.

As this repo contains additions to the upstream chart, you will need to
merge the changes from the new version in and assess them.

### Prepare your local checkout

If you haven't updated this repo before, you will first need to add the
`rook/rook` repo as a remote as we will be pulling in the upstream chart
directly.

Add the remote and fetch tags etc:

```
git remote add -f rook-upstream https://github.com/rook/rook.git
```

First we checkout the tag we want to update to - it is fine to be in a
detached head state as we aren't going to be committing anything here.

Note: it isn't possible to specify the origin of a tag, so if you have a
tag `v1.6.0` in both remotes (local and upstream) then this may cause you
some issues. In this case, use the commit hash in the upstream repo which
the tag points to instead.

```
git switch --detach v1.6.0
```

As the upstream Helm chart is in a subdir, we need to use some git magic
to filter out just the files we need into `temp-split-branch`. This
operation may take some time depending on the power of your local machine.

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
git subtree add --squash -P helm/rook-operator temp-split-branch
```

Finally, tidy up the branches we created ready for next time:

```
git branch -D temp-split-branch
```
