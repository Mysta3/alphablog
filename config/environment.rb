# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Removes field with error settings
# ActionView::Base.field_error_pro = Proc.new do |html_tag, instance| 
#   html_tag.html_safe 
# end