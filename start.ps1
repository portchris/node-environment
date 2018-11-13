
# This script starts up the environment, be sure to run the ./build.ps1 script first if no images exist.
# Usage: ./start.sh <Additional argurments>

# Get Path parameter
Param([String]$args)

docker-compose up -d --remove-orphans $args