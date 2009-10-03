# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true

# Use a different cache store in production
# config.cache_store = :mem_cache_store

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host                  = "http://assets.example.com"

# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false

config.action_view.cache_template_loading = true
config.action_mailer.raise_delivery_errors = true


if CONFIG['smtp_address']
  config.action_mailer.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address => CONFIG['smtp_address'],
    :port => CONFIG['smtp_port'], 
    :domain => CONFIG['smtp_domain'],
    :user_name => CONFIG['smtp_user_name'],
    :password => CONFIG['smtp_password'],
    :authentication => CONFIG['smtp_authentication'].to_sym,
    :enable_starttls_auto => CONFIG['smtp_enable_starttls_auto']
  }
end

