cd container

docker build  -t sfc-dev-plugin  .
docker tag sfc-dev-plugin quay.io/<USERNAME>/sfc-dev-plugin
docker push quay.io/<USERNAME>/sfc-dev-plugin


cd ..
