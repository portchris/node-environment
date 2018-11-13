# This script build the docker images for the the environment.
# Usage: ./build.sh <Additional argurments>

# Get Path parameter
Param([String]$args)

docker-compose -f docker-compose.yml build --build-arg UID=1000 --build-arg GID=1000 $args