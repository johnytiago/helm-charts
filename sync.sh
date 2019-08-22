#!/bin/sh

set -ex

CHARTS=(ipfs-testbed js-ipfs)
CHARTS_FOLDER=charts
REPO_URL=https://johnytiago.github.io/helm-charts/${CHARTS_FOLDER}

helm init --client-only

for dir in ${CHARTS[@]};do
  helm package $dir
  mv $dir*.tgz $CHARTS_FOLDER
done

helm repo index $CHARTS_FOLDER --url $REPO_URL --merge ./index.yaml
cat $CHARTS_FOLDER/index.yaml > ./index.yaml

set +ex
