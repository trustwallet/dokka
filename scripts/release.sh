#!/bin/bash

target_dir=dokka-out
publish_branch=gh-pages

git worktree add ../${publish_branch} ${publish_branch}

cp -R ${target_dir}/* ../${publish_branch}/

pushd ../${publish_branch}
git add . && git commit -m "Update docs"
git push
popd

git worktree remove ../${publish_branch}
