#!/bin/sh

# This is the install for my ruby scripts,
# it downloads the files, and installs all
# the gems necessary to run them

echo "Installing"
gem install rest-client
gem install money
gem install monetize
echo "Finished gem install"
echo " "

curl -o $HOME 'https://github.com/jakewmeyer/Ruby-Scripts/archive/master.zip'
