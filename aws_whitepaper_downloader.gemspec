# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aws_whitepaper_downloader/version'

Gem::Specification.new do |spec|
  spec.name          = "aws_whitepaper_downloader"
  spec.version       = AwsWhitepaperDownloader::VERSION
  spec.authors       = ["StevenTTuD"]
  spec.email         = ["StevenTTuD@gmail.com"]

  spec.summary       = "Downloading all aws whitepapers by one click"
  spec.description   = "easy to use"
  spec.homepage      = ""

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir['{lib}/**/*']
  # spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.executables << "aws-whitepaper-downloader"
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", "~>0"
  spec.add_development_dependency "commander", "~>0"
end
