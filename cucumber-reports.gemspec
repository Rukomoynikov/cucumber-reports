Gem::Specification.new do |spec|
  spec.name        = "cucumber-reports"
  spec.version     = "0.0.1"
  spec.summary     = "Hola!"
  spec.description = "Gem that builds a very basic page with list of all the step deifinitions from the project."
  spec.authors     = ["Max Rukomoynikov"]
  spec.email       = "cat@mos-it.com"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.homepage    =
    "https://rubygemspec.org/gems/cucumber-reports"
  spec.license       = "MIT"

  spec.executables << 'cucumber-reports'
  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "rake", "~> 13"
  spec.add_development_dependency "rspec", "~> 3"
  spec.add_development_dependency "aruba", "~> 2"
  spec.add_development_dependency "byebug", "~> 11"

  spec.add_dependency "parser", "~> 3"
  spec.add_dependency "thor", "~> 1"
end
