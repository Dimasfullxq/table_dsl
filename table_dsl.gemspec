# frozen_string_literal: true

require_relative 'lib/table_dsl/version'

Gem::Specification.new do |spec|
  spec.name = 'table_dsl'
  spec.version = TableDsl::VERSION
  spec.authors = ['Dmytro Latyshev']
  spec.email = ['gliffy@ukr.net']

  spec.summary = 'Table dsl gem'
  spec.description = 'Table dsl gem'
  spec.homepage = 'https://github.com/Dimasfullxq/table_dsl'
  spec.required_ruby_version = '>= 3.1.2'

  spec.metadata['allowed_push_host'] = "'https://rubygems.org'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Dimasfullxq/table_dsl'
  spec.metadata['changelog_uri'] = 'https://github.com/Dimasfullxq/table_dsl'
  spec.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'fuubar', '~> 2.5.1'
  spec.add_development_dependency 'pry', '~> 0.14.2'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.12'
  spec.add_development_dependency 'rubocop', '~> 1.56'
  spec.add_development_dependency 'rubocop-performance', '~> 1.19'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.24'
  spec.add_development_dependency 'simplecov', '~> 0.22'
end
