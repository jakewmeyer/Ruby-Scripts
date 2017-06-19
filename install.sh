#!/bin/sh

# This is the install for my ruby scripts,
# it downloads the files, and installs all
# the gems necessary to run them


echo " => Installing"
echo ''
gem install rest-client
gem install money
gem install monetize
echo ''
echo "=> Finished gem install"

curl -LO https://github.com/jakewmeyer/Ruby-Scripts/archive/master.zip

echo "=> Finished file download"
exit 0
