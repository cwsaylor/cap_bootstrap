# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cap_bootstrap/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Christopher Saylor"]
  gem.email         = ["chris@justhack.com"]
  gem.description   = %q{Capistrano tasks for deploying Rails applications using Ubuntu 10.04, rbenv, nginx, Unicorn and PostgreSQL.}
  gem.summary       = %q{Capistrano tasks for deploying Rails applications using Ubuntu 10.04, rbenv, nginx, Unicorn and PostgreSQL.}
  gem.homepage      = "http://github.com/cwsaylor/cap_bootstrap"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cap_bootstrap"
  gem.require_paths = ["lib"]
  gem.version       = CapBootstrap::VERSION
end
