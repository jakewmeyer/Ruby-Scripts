#!/bin/sh

# This is the install for my ruby scripts,
# it downloads the files, and installs all
# the gems necessary to run them


echo " => Installing"
echo ''
gem install rest-client
echo ''
gem install money
echo ''
gem install monetize
echo ''
echo "=> Finished gem install"
echo ''
curl -LO https://github.com/jakewmeyer/Ruby-Scripts/archive/master.zip
echo ''
echo "=> Finished file download"
echo ''
exit 0
