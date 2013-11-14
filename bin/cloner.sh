#!/bin

# cloner.sh <$1 github_username> <$2 github_repository>

mkdir -p tmp
cd tmp

git clone $2 $1

ruby bin/process_evaluation.rb &