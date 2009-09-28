# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use. To use Rails without a database
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Specify gems that this application depends on. 
  # They can then be installed with "rake gems:install" on new installations.
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "aws-s3", :lib => "aws/s3"

  config.gem "authlogic"
  config.gem "mbleigh-acts-as-taggable-on", :source => "http://gems.github.com", :lib => "acts-as-taggable-on"
  config.gem "fastercsv", :lib => "fastercsv", :version => ">= 1.0.0"
  config.gem "httparty"
  

  ## Testing suite
  config.gem 'thoughtbot-shoulda', :lib => 'shoulda/rails', :source => "http://gems.github.com"
  config.gem 'webrat', :lib => "webrat", :source => "http://gems.github.com"
  config.gem "thoughtbot-factory_girl", :lib => "factory_girl", :source => "http://gems.github.com"
  config.gem 'redgreen', :version=> "1.2.2"
  
  ## Required for Heroku's cloud and saving to S3
  config.gem "openrain-action_mailer_tls", :version => '1.1.3', :lib => "smtp_tls", :source => "http://gems.github.com"
  config.gem 'thoughtbot-paperclip', :version => '2.2.9.2', :lib => 'paperclip', :source => 'http://gems.github.com'
  config.gem 'right_aws', :version => '1.9.0' # TODO change to aws-s3 when paperclip does; right_aws 1.10.0 acts funny
  config.gem 'right_http_connection', :version => '1.2.4'
  

  # Only load the plugins named here, in the order given. By default, all plugins 
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
  #config.plugin_paths += ["#{RAILS_ROOT}/../../Libs"]
  #config.plugins = [:authlogic]

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Make Time.zone default to the specified zone, and make Active Record store time values
  # in the database in UTC, and return them converted to the specified local zone.
  # Run "rake -D time" for a list of tasks for finding time zone names. Comment line to use default local time.
  config.time_zone = 'UTC'

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  #config.action_controller.session = {
  #  :session_key => '_authgasm_example_session',
  #  :secret      => '94b9c594695e69bdef6b1d4be037af5853be976b39a52a02f260fca0d0a36a8f913572bfdb631f55971a3b10b8dd9a875f9776ca61371741544e6ccc064dd41e'
  #}

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with "rake db:sessions:create")
  config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector
  
  # support yaml and heroku config
  CONFIG = (YAML.load_file('config/config.yml')[RAILS_ENV] rescue {}).merge(ENV)
  
  # consider s3 enabled if the configuration options have been set
  CONFIG['s3_access_id'] && CONFIG['s3_secret_key'] && CONFIG['s3_bucket_name'] ? CONFIG['s3'] = true : CONFIG['s3'] = false
  
end
