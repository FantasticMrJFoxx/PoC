#!/usr/bin/env ruby

### about Chrome driver
#>> arguments (switches)
#' http://peter.sh/experiments/chromium-command-line-switches/
#>> flags
#' chrome://flags/
#' chrome://local-state/
#>> Capabilities
#' https://sites.google.com/a/chromium.org/chromedriver/capabilities

require 'capybara'
require 'capybara/dsl'
require 'pry'
require 'selenium-webdriver'

# overrides selenium's driver to use chrome browser
Capybara.register_driver :selenium do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome
=begin
  caps['chromeOptions'] = {}
  caps['chromeOptions']['args'] = ['--incognito']
  caps['chromeOptions']['localState'] = {
    'protocol_handler': {
      'excluded_schemes': {
        'mailto': false,
      }
    }
  }
=end
  Capybara::Selenium::Driver.new(app, {detach: false,
                                       browser: :chrome,
                                       desired_capabilities: caps})
end

# selecting the driver
Capybara.default_driver = :selenium

Capybara.visit 'about:blank'

binding.pry

