VERSION="$1"
DOCKER_COMPOSE="$2"
#REPO_TOKEN="$3"

echo "VERSION=$VERSION"
echo "DOCKER_COMPOSE=$DOCKER_COMPOSE"

#Env
APP_ENV=production
DOCKER_ACCT=hextht
export APP_ENV=production
export DOCKER_ACCT=hextht

# login to github
docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_TOKEN}

# build and run the docker images
DOCKER_ACCT=hextht APP_ENV=production  VERSION=$VERSION docker-compose build
DOCKER_ACCT=hextht APP_ENV=production  VERSION=$VERSION docker-compose tag latest
DOCKER_ACCT=hextht APP_ENV=production  VERSION=$VERSION docker-compose push



# get all built IDs
### IMAGE_IDs=$(docker-compose -f $DOCKER_COMPOSE images -q)

### echo "IMAGE_IDs: $IMAGE_IDs"

### while read -r IMAGE_ID; do

###     echo "IMAGE_ID: $IMAGE_ID"
    # get the name label
###     NAME=$(basename ${GITHUB_REPOSITORY}).$(docker inspect --format '{{ index .Config.Labels.name }}' $IMAGE_ID)
###     PUSH="docker.pkg.github.com/${GITHUB_REPOSITORY}/$NAME:$VERSION"

    # tag and push
###     docker tag $IMAGE_ID $PUSH
###     docker push $PUSH

### done <<< "$IMAGE_IDs"