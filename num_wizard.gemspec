# num_wizard2.gemspec
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "num_wizard2"

Gem::Specification.new do |spec|
  spec.name          = "num_wizard2"
  spec.version       = NumWizard2::VERSION
  spec.authors       = ["Alexey"]
  spec.email         = ["mirgorodsky.alexey@gmail.com"]
  spec.summary       = "Math helpers for university homework"
  spec.description   = "Simple gem: primes (sieve + Fermat), factorial profiling, fibonacci, OEIS links"
  spec.homepage      = "https://github.com/spad17/num_wizard2"
  spec.license       = "MIT"
  spec.files         = Dir["lib/**/*", "README.md", ".gitignore"]
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.5.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end