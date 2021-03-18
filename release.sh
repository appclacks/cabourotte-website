set -e
tag=$1
hugo
git tag -a "${tag}" -m "release ${tag}"
docker build -t mcorbin/cabourotte-website:${tag} .
docker push mcorbin/cabourotte-website:${tag}
git push --tags
