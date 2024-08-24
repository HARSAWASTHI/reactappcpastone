!/bin/bash

chmod +x build.sh
./build.sh

# Tag the Docker image for the dev environment
docker tag myreactappimg harsawasthi/dev:v1

# Push the Docker image to the dev repository
docker push harsawasthi/dev:v1