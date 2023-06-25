require 'selenium-webdriver'
require 'cucumber'
require 'webdrivers/chromedriver'

Before('@test_setup') do
  Webdrivers::Chromedriver.update
end

Before('@scenario_setup') do
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  # Uncomment the line below if you want to run headless
  options.add_argument('--headless')
  options.add_argument('--window-size=1920,1080')
  options.add_argument('--allow-insecure-localhost')
  options.add_argument('--disable-gpu')
  options.add_argument('--remote-allow-origins=*')
  options.add_argument('disable-infobars')
  options.add_argument('--disable-extensions')
  options.add_argument('--hide-scrollbars')
  options.add_argument('start-maximized')

  Selenium::WebDriver::Chrome::Service.driver_path = Webdrivers::Chromedriver.driver_path
  @driver = Selenium::WebDriver.for :chrome, options: options

  @driver.manage.timeouts.page_load = 10 # Page load timeout in seconds
  @driver.manage.timeouts.implicit_wait = 10 # Implicit wait timeout in seconds
end

After('@scenario_setup') do
  @driver.quit if @driver
end
