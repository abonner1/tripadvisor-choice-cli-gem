# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tripadvisor_best/version'

Gem::Specification.new do |spec|
  spec.name          = "tripadvisor_best"
  spec.version       = TripAdvisorBest::VERSION
  spec.authors       = ["'Andrew Bonner'"]
  spec.email         = ["'andrewbonner92@gmail.com'"]

  spec.summary       = %q{TripAdivsor Travelers' Choice Gem}
  spec.description   = %q{CLI gem the scrapes the top 25 museums, 25 landmarks, and 25 attractions}
  spec.homepage      = "https://github.com/abonner1/tripadvisor-choice-cli-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
  spec.add_dependency "colorize"
end
