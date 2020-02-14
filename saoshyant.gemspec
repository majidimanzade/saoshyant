require 'version'

Gem::Specification.new do |s|
  s.name        = 'saoshyant'
  s.version     = '1.0.2'
  s.date        = '2020-02-10'
  s.summary     = "Handle Rails Exception Apis"
  s.description = "when exceptoin raised we dont want see it in ugly and red display, saoshyant present it in json response"
  s.authors     = ["Majid Imanzade"]
  s.email       = 'majidimanzade1@gmail.com'
  s.homepage    = 'https://rubygems.org/gems/saoshyant'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.add_development_dependency("bundler")
  s.add_development_dependency("rake")
  s.add_development_dependency("rspec")
end
