# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "upyun-paperclip/version"

Gem::Specification.new do |s|
  s.name        = "upyun-paperclip"
  s.version     = Upyun::Paperclip::VERSION
  s.authors     = ["frankel"]
  s.email       = ["frankelma@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Upyun gem for paperclip}
  s.description = %q{Upyun gem for paperclip}

  s.rubyforge_project = "upyun-paperclip"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "rest-client"
  s.add_development_dependency "rspec", "~> 2.6"
  # s.add_development_dependency "guard-rspec"
  s.add_development_dependency "ruby-debug19"
end
