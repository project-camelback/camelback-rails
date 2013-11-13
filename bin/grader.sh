#!/bin/bash

# grader.sh <$1 github_username> <$2 github_repository> <$3 branch> <$4 submission id>
unset BUNDLE_GEMFILE

mkdir -p tmp
cd tmp

git clone $2 $1
cd $1
git checkout $3

# Comment out 'binding.pry' in all ruby files
# find ./ -name \*.rb -exec sed -i "s/binding.pry/#binding.pry/g" {} \;

if [ -a Gemfile ] ; then
  bundle config gemfile ./Gemfile
  bundle install --verbose
fi

# if rails app, run `rake db:migrate RAILS_ENV=test`
#   maybe also rake db:seed?

if [ -a db/migrate ] ; then
  rake db:migrate RAILS_ENV=test
fi

# --require ../../rspec_setup.rb 
bundle exec rspec --format json --out .rspec-results.json &> .rspec-results.errors

cd ../..
unset BUNDLE_GEMFILE
ruby bin/process_evaluation.rb $4 &