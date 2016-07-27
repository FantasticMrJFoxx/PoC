#!/usr/bin/env ruby

# Code mainly taken from:
# https://github.com/jnicklas/capybara#configuring-and-adding-drivers

require 'capybara'
require 'capybara/dsl'
require 'pry'

# overrides selenium's driver to use chrome browser
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# selecting the driver
Capybara.default_driver = :selenium

Capybara.visit 'about:blank'

binding.pry

