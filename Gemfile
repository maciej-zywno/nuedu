source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.1.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use SCSS for stylesheets
# gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'less-rails'
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.1.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# app configuration
gem 'figaro'

gem 'aws-sdk' # S3 API
gem 'paperclip' # file attachment syntax and callbacks
gem 'jquery-fileupload-rails'
gem 's3_direct_upload' , :github => 'waynehoover/s3_direct_upload', :branch => 'master'# direct upload form helper and assets

# gem 'rails-assets-jquery-file-upload'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# gem 'haml'
gem "haml-rails"

group :test, :development do
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

gem 'google-api-client'

# gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git', branch: 'bootstrap3'
gem 'rails-assets-bootstrap', '3.1.0'
gem 'rails-assets-holderjs'

gem 'devise'
gem 'omniauth-facebook'
gem 'cancan'
gem 'rolify', :github => 'badaboda/rolify', :branch => 'master'

gem 'inherited_resources', :github => 'josevalim/inherited_resources', :branch => 'master'
gem 'has_scope', :github => 'plataformatec/has_scope', :branch => 'master'

gem 'youtube_it', :github => 'kylejginavan/youtube_it', :branch => 'master'

gem 'tinymce-rails', github: 'spohlenz/tinymce-rails', branch: 'tinymce-4'
gem 'tinymce-rails-langs'

gem 'rails_admin'
gem 'ancestry'
gem 'rails_admin_nestable'

gem "font-awesome-rails", '3.2.1'

gem "friendly_id", '~> 5.0.0'

gem 'comfortable_mexican_sofa', github: 'comfy/comfortable-mexican-sofa', branch: 'master'
# gem 'refinerycms', :branch => 'rails-4-1'


gem 'seed_dump'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'quiet_assets'
end
