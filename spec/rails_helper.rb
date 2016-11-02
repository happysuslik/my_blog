ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

include Warden::Test::Helpers
Warden.test_mode!
ActiveRecord::Migration.maintain_test_schema!

# RSpec ---------------------------------------------------------------------------------------------------------------

RSpec.configure do |config|

  config.use_transactional_fixtures = false

  config.include Warden::Test::Helpers
  config.include MyModel::SessionHelpers, type: :feature
  config.include FactoryGirl::Syntax::Methods

  config.include Devise::Test::ControllerHelpers, type: :controller
  
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
  [:controller, :view, :request].each do |type|
    config.include ::Rails::Controller::Testing::TestProcess, :type => type
    config.include ::Rails::Controller::Testing::TemplateAssertions, :type => type
    config.include ::Rails::Controller::Testing::Integration, :type => type
  end

  config.after :each do
    Warden.test_reset!
  end

end

Capybara.register_driver :chrome do |app| 
  Capybara::Selenium::Driver.new(app, :browser => :chrome) 
end

Capybara.javascript_driver = :chrome
