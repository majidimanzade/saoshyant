Gem::Specification.new do |s|
  s.name        = 'saoshyant'
  s.version     = '1.2.1'
  s.date        = '2020-02-10'
  s.summary     = "Handle Rails Exception"
  s.description = "Handle Unexpected Controller Exceptions using Saoshyant."
  s.authors     = ["Majid Imanzade"]
  s.email       = 'majidimanzade1@gmail.com'
  s.homepage    = 'https://rubygems.org/gems/saoshyant'
  s.homepage    = "http://github.com/majidimanzade/saoshyant"
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.add_development_dependency("bundler")
  s.add_development_dependency("rake")
  s.add_development_dependency("rspec")
end
