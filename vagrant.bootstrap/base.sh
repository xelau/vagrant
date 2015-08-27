#!/usr/bin/env bash

# ---------------------------------------
# Package
# ---------------------------------------
apt-get update
apt-get install -y build-essential nginx postgresql zsh git tig htop libpq-dev vim wget curl mongodb

# ---------------------------------------
# Ruby
# ---------------------------------------
wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz
tar -xzvf ruby-install-0.5.0.tar.gz
cd ruby-install-0.5.0/
make install
mkdir -p /opt/rubies
ruby-install --rubies-dir /opt/rubies ruby 2.1.3
cd .. && rm -rf ruby-install-0.5.0*

# ---------------------------------------
# Chruby
# ---------------------------------------
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
make install
cd .. && rm -rf chruby-0.3.9*

# ---------------------------------------
# User
# ---------------------------------------
useradd -m alex
usermod -aG sudo alex
chsh -s /bin/zsh alex
su -c "source /vagrant.bootstrap/alex.sh" alex
