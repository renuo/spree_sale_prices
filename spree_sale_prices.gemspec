# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_sale_prices'
  s.version     = '3.0.0'
  s.summary     = 'Adds sale pricing functionality to Spree Commerce'
  s.description = 'Adds sale pricing functionality to Spree Commerce. It enables timed sale planning for different currencies.'
  s.required_ruby_version = '>= 1.9.3'

  s.author            = 'Renuo GmbH, Jonathan Dean'
  s.email             = 'info@renuo.ch'
  s.homepage          = 'https://github.com/renuo/spree_sale_prices'
  s.license           = 'BSD-3'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.0'

  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'capybara',  '~> 2.4'
  s.add_development_dependency 'database_cleaner',  '~> 1.4'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'simplecov', '~> 0.10'
  s.add_development_dependency 'sqlite3', '~> 1.3'
end
