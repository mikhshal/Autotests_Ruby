require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for :chrome
driver.manage.timeouts.implicit_wait = 10

Given("User on login page") do
  driver.navigate.to "https://staging-showcase.adboost.tech/login"

end

Then("User inputs the Email and Password and press Login") do
  driver.find_element(:xpath, '//input[@placeholder = "mail@example.com"]').send_keys 't.e.s.t.mihannod99@gmail.com'
  driver.find_element(:xpath,'//input[@placeholder = "password"]').send_keys 'hGh^198O]QYd'
  driver.find_element(:xpath, '//button [@class = "button big primary"]').click
  sleep(2)
end

Then("User on the Deals page") do
  driver.find_element(:xpath, '//a[@href = "/deals"]').displayed?
end
