# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_sale_pricing'
  s.version     = '2.3.1'
  s.summary     = 'Adds sale pricing functionality to Spree Commerce'
  s.description = 'Adds sale pricing functionality to Spree Commerce'
  s.required_ruby_version = '>= 1.9.2'

  s.author            = 'Renuo GmbH, Jonathan Dean'
  s.email             = 'jon@jonathandean.com'
  s.homepage          = 'http://www.renuo.ch'

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.3'

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.7'
  s.add_development_dependency 'sqlite3'
end
