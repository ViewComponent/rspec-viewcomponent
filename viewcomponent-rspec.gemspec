# frozen_string_literal: true

require_relative 'lib/rspec/viewcomponent/version'

Gem::Specification.new do |spec|
  spec.name = 'rspec-viewcomponent'
  spec.version = RSpec::ViewComponent::VERSION
  spec.authors = ['Simon Fish']
  spec.email = ['si@mon.fish']

  spec.summary = 'RSpec helpers for ViewComponent tests'
  spec.description = 'Provides setup to prevent you writing excessive boilerplate in ViewComponent tests.'
  spec.homepage = 'https://github.com/viewcomponent/rspec-viewcomponent'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'capybara', '~> 3'
  spec.add_development_dependency 'combustion', '~> 1.3'
  spec.add_development_dependency 'rails', '~> 7'
  spec.add_development_dependency 'rake', '~> 13'
  spec.add_development_dependency 'rspec-rails', '~> 5'
  spec.add_development_dependency 'standard', '~> 1.3'
  spec.add_development_dependency 'view_component', '~> 2'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
