#require 'capybara/cucumber'
require 'appium_lib'
require_relative 'helper.rb'
require_relative 'page_helper.rb'
require 'faker'



BROWSERS = ENV['BROWSERS']
AMBIENTE = ENV['AMBIENTE']
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")

World(Screens)
World(Helper)


SERVER_URL = 'http://localhost:4723/wd/hub'.freeze
PORT = 4723
TWENTY_SECONDS = 20

Before do
  def opts
    {
      caps: {
        deviceName: 'emulador-5554',
        platformName: 'Android',
        automationName: "UiAutomator2",
        app: File.join(File.dirname(__FILE__), 'qa.apk'),
        newCommandTimeout: '3600'
      },
      appium_lib: { server_url: SERVER_URL, port: PORT }
    }
  end
end

# App inicializa o