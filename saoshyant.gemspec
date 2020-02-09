$:.push File.expand_path('../lib', __FILE__)
require 'version'

Gem::Specification.new do |s|
  s.name        = 'saoshyant'
  s.version     = Saoshyant::Version::GEM_VERSION
  s.date        = '2020-02-10'
  s.summary     = "Handle Rails Exception Apis"
  s.description = "when exceptoin raised we dont want see it in ugly and red display, saoshyant present it in json response"
  s.authors     = ["Majid Imanzade"]
  s.email       = 'majidimanzade1@gmail.com'
  s.homepage    = 'https://rubygems.org/gems/saoshyant'
  s.license     = 'MIT'
  s.files       = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end