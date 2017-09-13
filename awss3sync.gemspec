# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "awss3sync/version"

Gem::Specification.new do |spec|
  spec.name          = "awss3sync"
  spec.version       = Awss3sync::VERSION
  spec.authors       = ["Vell"]
  spec.email         = ["lovell.mcilwain@gmail.com"]

  spec.summary       = %q{Sync AWS S3 Directories}
  spec.description   = %q{Sync AWS S3 directories. Requires AWS CLI to be installed and configured before use.}
  spec.homepage      = "https://www.github.com/vmcilwain/awss3sync"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir["{bin,lib}/**/*", "LICENSE.txt", "README.md", 'Rakefile', 'Gemfile', 'awss3sync.gemspec']
  spec.test_files    = Dir["spec/**/*"]
  spec.bindir        = "bin"
  spec.executables   = ['awss3sync']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'thor', '~> 0.20.0'
end
