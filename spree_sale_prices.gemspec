# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree-sale-prices'
  s.version     = '2.4.5.1'
  s.summary     = 'Adds sale pricing functionality to Spree Commerce'
  s.description = 'Adds sale pricing functionality to Spree Commerce'
  s.required_ruby_version = '>= 1.9.3'

  s.author            = 'Renuo GmbH, Jonathan Dean'
  s.email             = 'info@renuo.ch'
  s.homepage          = 'https://www.renuo.ch'
  s.license           = 'BSD-3'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.4.5'

  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'capybara',  '~> 2.4'
  s.add_development_dependency 'database_cleaner',  '~> 1.4'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'simplecov',  '~> 0.9'
  s.add_development_dependency 'sqlite3',  '~> 1.3'
end
