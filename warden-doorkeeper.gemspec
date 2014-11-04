$:.push File.expand_path("../lib", __FILE__)

require "warden/strategies/doorkeeper"

Gem::Specification.new do |s|
  s.name        = "warden-doorkeeper"
  s.version     = Warden::Strategies::Doorkeeper::VERSION
  s.authors     = ["Tyler Margison"]
  s.email       = "kolorahl@gmail.com"
  s.homepage    = "https://github.com/kolorahl/warden-doorkeeper"
  s.summary     = "Integration with Doorkeeper."
  s.description = "Integration with Doorkeeper."

  s.files = Dir["lib/**/*", "LICENSE", "README.md"]

  s.add_dependency "warden", "~> 1.2"
end
