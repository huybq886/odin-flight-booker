# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!


config.action_mailer.delivery_method = :smtp
config.action_mailer.raise_delivery_errors = true
config.action_mailer.perform_deliveries = true
config.action_mailer.smtp_settings = {
  domain: 'damp-falls-29791.herokuapp.com',
  address:        "smtp.sendgrid.net",
  port:            587,
  authentication: :plain,
  user_name:      'apikey',
  password:       ENV['SENDGRID_API_KEY']
}