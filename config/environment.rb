# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

config.action_mailer.smtp_settings = {
  :user_name => 'apikey',
  :password => ENV['SENDGRID_API_KEY'],
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}