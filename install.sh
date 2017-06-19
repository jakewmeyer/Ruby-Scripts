#!/bin/sh

# This is the install for my ruby scripts,
# it downloads the files, and installs all
# the gems necessary to run them

# TO DO: Needs to test for ctive ruby version first

echo "Installing"
gem install rest-client
gem install money
gem install monetize
echo "Finished gem install"

curl -LO https://github.com/jakewmeyer/Ruby-Scripts/archive/master.zip
