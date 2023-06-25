require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

Given("User on login page") do
  @driver.navigate.to "https://staging-showcase.adboost.tech/login"

end

Then("User inputs the Email and Password") do
  @driver.find_element(:xpath, '//input[@placeholder = "mail@example.com"]').send_keys 't.e.s.t.mihannod99@gmail.com'
  @driver.find_element(:xpath,'//input[@placeholder = "password"]').send_keys 'hGh^198O]QYd'
  @driver.find_element(:xpath, '//button [@class = "button big primary"]').click
  sleep(2)
end

Then("User press the Login button") do
  @driver.find_element(:xpath, '//button [@class = "button big primary"]').click
end

Then("User on the Deals page") do
  @driver.find_element(:xpath, '//a[@href = "/deals"]').displayed?
end

Then("User inputs the incorrect set of Email and Password") do
  @driver.find_element(:xpath, '//input[@placeholder = "mail@example.com"]').send_keys 't.e.s.t.mihannoasd99@gmail.com'
  @driver.find_element(:xpath,'//input[@placeholder = "password"]').send_keys 'hGh^198Oafafqs]QYd'
end

Then("User see error User credentials do not match") do
  error_text = @driver.find_element(:xpath, '//div [@class = "error-message"]').get_text
  actual_text = error_text.text.strip
  expect(actual_text).to include('User credentials do not match')
end
