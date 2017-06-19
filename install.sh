#!/bin/sh

# This is the install for my ruby scripts,
# it downloads the files, and installs all
# the gems necessary to run them

$ruby = ruby -v

if [ -z "$ruby" ]
then
      echo "You don't have a version of ruby!"
      exit 1
else
  echo "Installing"
  gem install rest-client
  gem install money
  gem install monetize
  echo "Finished gem install"

  curl -LO https://github.com/jakewmeyer/Ruby-Scripts/archive/master.zip

fi
