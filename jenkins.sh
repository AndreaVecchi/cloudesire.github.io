#!/bin/bash -ex
CONTAINER="cd-docs"

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f /opt/nvm/nvm.sh ]; then
  source /opt/nvm/nvm.sh
fi
nvm use 0.10

bundle install
bundle exec jekyll hyde
bundle exec jekyll build
git submodule update --init
bundle exec ./jekyll-cloudfiles-upload/cloudfiles_upload.rb $CONTAINER
