#!/bin/bash

# Local Dev Environment
# ------------------------------------------------------------------------------

# Get a relative path for the docker container
function getRelPath () {
	currentPath=$(pwd)
	relPath=${currentPath#$HOME}
	if [ ! -d "$HOME$relPath" ]; then
		newPath=/home/www
	else
		newPath=/home/www$relPath
	fi
	echo $newPath
}

# Run bash inside containers
alias php56='docker exec -e COLUMNS=\"`tput cols`\" -e LINES=\"`tput lines`\" -u www -ti php56 sh -c "cd `getRelPath` && bash"'
alias php70='docker exec -e COLUMNS=\"`tput cols`\" -e LINES=\"`tput lines`\" -u www -ti php70 sh -c "cd `getRelPath` && bash"'
alias php71='docker exec -e COLUMNS=\"`tput cols`\" -e LINES=\"`tput lines`\" -u www -ti php71 sh -c "cd `getRelPath` && bash"'
alias php72='docker exec -e COLUMNS=\"`tput cols`\" -e LINES=\"`tput lines`\" -u www -ti php72 sh -c "cd `getRelPath` && bash"'
alias php71-oro='docker exec -e COLUMNS=\"`tput cols`\" -e LINES=\"`tput lines`\" -u www -ti php71-oro sh -c "cd `getRelPath` && bash"'
alias nginxdocker='docker exec -e COLUMNS=\"`tput cols`\" -e LINES=\"`tput lines`\" -u root -ti nginx sh -c "cd `getRelPath` && bash"'

# Other useful aliases
alias redisflush="docker exec redis redis-cli flushall"
