# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'watersupply-client/version'

Gem::Specification.new do |gem|
  gem.name          = "watersupply-client"
  gem.version       = Watersupply::Client::VERSION

  gem.authors       = ["Mike Utley", "Corey Woodcox"]
  gem.email         = ["mikey.utley@gmail.com", "corey.woodcox@gmail.com"]
  gem.description   = %q{This is the client for the watersupply service that runs on the raspberry pi}
  gem.summary       = %q{}
  gem.homepage      = "http://watersupp.ly/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "em-eventsource"
  gem.add_dependency "rufus-scheduler"
  gem.add_dependency "gpio"

end
