# Cap Bootstrap

Capistrano tasks for deploying Rails applications using Ubuntu 10.04, rbenv, nginx, Unicorn and PostgreSQL. Based on the excellent Railscasts by Ryan Bates, with permission of course. If you are new to Capistrano or setting up a VPS, I highly recommend subscribing to his pro screencasts and watching the following:

* [Deploying to a VPS](http://railscasts.com/episodes/335-deploying-to-a-vps) (Pro)
* [Capistrano Tasks](http://railscasts.com/episodes/133-capistrano-tasks-revised) (Free)
* [Capistrano Recipes](http://railscasts.com/episodes/337-capistrano-recipes) (Pro)

I am not affiliated with Railscasts, I'm just a fan.

## Requirements

* Capistrano
* Fresh Ubuntu 10.04 or 11.10 install

## Installation

Add these lines to your application's Gemfile:

    gem 'capistrano'
    gem 'cap_bootstrap'

And then execute:

    $ bundle

## Usage

Setup a new Ubuntu 10.04 slice. Add a user called deployer with sudo privileges.

In your project, run the following:

    capify .

Then run this generator with an optional IP address to copy over a deploy.rb that is more suited to this gem.
The application name defaults to the same name as your rails app and the repository is pulled from your .git/config.

    rails g cap_bootstrap:install 99.99.99.99

Double check the settings in config/deploy.rb and then run:

    cap deploy:install
    cap deploy:setup
    cap deploy:cold

## Advanced Options

Shown below are the default advanced settings, but they can overridden.

### Setup

    set(:domain) { "#{application}.com" }

### PostgreSQL

    set :postgresql_host, "localhost"
    set(:postgresql_user) { application }
    set(:postgresql_database) { "#{application}_production" }

### Ruby

    set :ruby_version, "1.9.3-p125"
    set :rbenv_bootstrap, "bootstrap-ubuntu-10-04" # Or bootstrap-ubuntu-11-10

### Unicorn

    set(:unicorn_user) { user }
    set(:unicorn_pid) { "#{current_path}/tmp/pids/unicorn.pid" }
    set(:unicorn_config) { "#{shared_path}/config/unicorn.rb" }
    set(:unicorn_log) { "#{shared_path}/log/unicorn.log" }
    set :unicorn_workers, 2

## Future Plans

Version 0.1 uses Ryan's recipes pulled directly from Railscast episode #337 Capistrano Recipes. You will always be able to access this version
with tag v0.1.

Future versions will incorporate optional installs such as MySQL, Apache, Phusion Passenger and additional server config such as setting a hostname.
Also considering changes to allow deploying multiple apps onto a single server and provisioning Linode slices using their api.

## Alternatives

* [Chef](http://www.opscode.com/chef/)
* [Puppet](http://puppetlabs.com/)
* [deprec](http://deprec.org/)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

