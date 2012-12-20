source 'https://rubygems.org'

gem 'devise'
gem 'haml'
gem 'hpricot'
gem 'jquery-rails', '~> 2.0.0'
gem 'pg'
gem 'rails', '3.2.9'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'rspec-rails'
end

git 'git://github.com/resolve/refinerycms.git' do
  gem 'refinerycms-core' #You can leave this out if you like. It's a dependency of the other engines.
  gem 'refinerycms-dashboard'
  gem 'refinerycms-images'
  gem 'refinerycms-pages'
  gem 'refinerycms-resources'
end

