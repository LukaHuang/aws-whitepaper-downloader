$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name          = "aws-whitepaper-downloader"
  s.version       = "0.1.3"
  s.authors       = ["StevenTTuD"]
  s.email         = ["StevenTTuD@gmail.com"]

  s.summary       = "Downloading all aws whitepapers by 1 command"
  s.description   = "Downloading all aws whitepapers by 1 command"
  s.homepage      = "https://github.com/StevenTTuD/aws-whitepaper-downloader"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  s.add_runtime_dependency('commander', '>= 4.4.3')
  s.add_runtime_dependency('highline', '>= 1.7.8')
  s.add_runtime_dependency('rake', '>= 12.1.0')

  s.files         = Dir['{lib}/**/*']
  s.executables << "aws-whitepaper-downloader"
  s.require_paths = ["lib"]
end
