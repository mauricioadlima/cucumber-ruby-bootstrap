require "pry"
require "capybara/cucumber"

# Use your url here, example: http://192.168.0.1:3000/app
$url = "file:///#{File.expand_path('../../../', __FILE__)}/"

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.app_host = $url
end
